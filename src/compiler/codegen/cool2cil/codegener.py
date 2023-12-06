import compiler.AST.environment as env
from compiler.AST.ast import CoolProgram, CoolClass, Feature, expr, IntNode, CoolBool, CoolString, CoolLet, ArithmeticOP,Logicar,Assign, CoolID, Context, Dispatch, CoolCase, CoolWhile, CoolIf, CoolBlockScope, CoolCallable, CoolNew, CoolNot, CoolUminus

import colorama
from colorama import Fore
colorama.init()
colors = [Fore.RED, Fore.GREEN, Fore.YELLOW, Fore.BLUE, Fore.MAGENTA, Fore.CYAN]
count_colors = 0
def get_color():
    global colors
    global count_colors
    count_colors= (1+count_colors)%6
    return colors[count_colors]

'''
1. El registro $s3 se usa para cargar direcciones de data, si va a usar este registro en otro lugar usted debe guardar su valor en la pila para poder recuperarlo.
2. El registro $s2 se usa para guardar la instancia desde la cual se llamara un metodo, por ejemplo x.f(), se guarda la instancia de x en $s2, escribir en $s2 implica tener que guardar su valor escrito en pila xq si se hace un dispatch el valor de $s2 cambia
3. El registro $s1 hay que controlarlo en pila, se usa para guardar las direcciones de las instancias nuevas creadas, si usted usa $s1 tendra que guardar su valor en pila, xq en caso de crear una instancia de clase el valor de $s1 sera modificado.
4. El registro $s4 se usa en operaciones para guardar strings, no debera usarlo en otro ambito dado que cuando se guarda un string este registro sera manipulado
5. El registro $s5 y $s6 se usan para comparacion de strings, si usted usa este registro debe tratarlo cuidadosamente xq una exprsion `=` los sobreescribe
'''
#esto es para usar operaciones con valores inmediatos, por ejemplo addi $s0, $1, 5 . Las constantes solo admiten 16 bytes. Valor default = False
USE_i = True

TYPE_LENGTH= {'Int':4, 'Bool':4, 'String':4,}
TYPES = {}


class TempNames:
    used_id = [False, False,False, False, False, False, False, False, False]
    s_id = [False,False,False]
    def get_name():
        for i in range(len(TempNames.used_id)):
            if not TempNames.used_id[i]:
                TempNames.used_id[i]= True
                return f"temp_{i}"
        else:    
            TempNames.used_id.append(True)
            return f"expr_{len(TempNames.used_id)-1}"
    
    def get_s(index):
        TempNames.s_id[index] = True
        return f'$s{index}'
    def free_s(index):
        TempNames.s_id[index] = False
    
    def free(names:list):
        if isinstance (names, str):
            #es uno solo y no una lista
            if names != 'a0':
                id = int(names[5:])
                TempNames.used_id[id] = False
        else:
            for name in names:
                if name == 'a0' or name[0]=='$': continue
                id = int(name[5:])
                TempNames.used_id[id] = False

    def free_all():
        TempNames.used_id = [False, False,False, False, False, False, False, False, False]
    
    def used_temps():
        result = []
        for i in range(len(TempNames.used_id)):
            if TempNames.used_id[i]:
                result.append(f'temp_{i}')
        for i in range(len(TempNames.s_id)):
            if TempNames.s_id[i]:     
                result.append(f'$s{i}')
        result.append('$ra')        
        return result        
    
class NameTempExpression:
    id = -1  # Contador para generar identificadores
    def get_name():
        NameTempExpression.id+=1
        return f"expr_{NameTempExpression.id}"

class Data:
    body = []
    def add(data):
        Data.body.append(data)
    
    def free():
        Data.body = []

class CILProgram():
    def __init__(self, program:CoolProgram):
        super().__init__()
        Data.free()
        self.types:dict[str,CILType] = {}  # Lista de CILType
        self.methods:list[CILMethod] = []
        self.set_types(program)
        self.generate_methods(program)
        self.generate_init_types()
        
    def generate_init_types(self):
        for type in self.types.values():
            self.methods.append(type.init_meth())
    
    def set_types(self, program:CoolProgram):
        for cclass in program.classes:
            if not cclass.type in env.base_classes:
                self.types[cclass.type]=CILType(cclass)

    def __str__(self) -> str:
        result = ".DATA\n\n"
        for line in Data.body:
            result+= f'{line}\n'
        result = ".TYPES\n\n"
        for type in self.types.values():
            result+= str(type)
        result += ".TEXT\n\n"
        for meth in self.methods:
            result+= str(meth)
        return result
    
    def generate_methods(self, cool_program:CoolProgram):
        # for cclass in cool_program.classes:
        #     if cclass.type == 'Main':
        #         for feature in cclass.features:
        #             if isinstance(feature,Feature.CoolDef) and feature.ID.id == 'main':
        #                 self.methods.append(CILMethod(feature, self))

        for cclass in cool_program.classes:
            if not cclass.type in env.base_classes:
                for feature in cclass.features:
                    if isinstance(feature,Feature.CoolDef):
                        # if not(cclass.type == 'Main' and feature.ID.id == 'main'):
                            self.methods.append(CILMethod(feature, self))

class CILType():
    def __init__(self, cclass:CoolClass):
        self.name = cclass.type
        self.methods:list[CILId] = []  # Lista de CILMethod
        self.attributes:list[CILVar] = []  # Lista de CILAttribute
        self.atrs = {env.self_type_name: 0}
        self.space = self.get_all_from(cclass)
        TYPES[self.name] = self
        Data.add(f'{self.name}: .asciiz "{self.name}"')
        self.cclass = cclass

    def get_all_from(self, cclass:CoolClass):
        self.process_class(cclass)
        return self.set_space()

    def set_space(self):
        result = 4 #En la posicion 0 se pondra el SELF_TYPE
        for atr in self.attributes:
            result += atr.space
        
        TYPE_LENGTH[self.name] = result
        return result
    
    def process_class(self,cclass:CoolClass):
        if cclass.type != env.object_type_name:
            self.process_class(cclass.inherit_class)

        pos = 4 #en la posicion 0 hay que poner el SELF_TYPE, esto se consigue usando la direccion de en .data TODO: implementar
        for feature in cclass.features:
            if isinstance(feature,Feature.CoolAtr):
                self.atrs[feature.ID.id] = pos
                self.attributes.append(CILVar(f'{self.name}_{feature.ID.id}', value=feature.value,space=4))
                pos += 4
            else:    
                self.methods.append(CILId(f'{self.name}_{feature.ID.id}')) #Esto apunta a una dirccion de memoria y su tamanno siempre es 4 bytes
    
    def init_meth(self):
        result = InitMethod(self.cclass, self.space)
        return result
    
    def __str__(self) -> str:
        result = f'\n.{self.name}'+' {\n'
        for atr in self.attributes:
            result+= f'\tattribute {atr};\n'
        for met in self.methods:
            result+= f'\tmethod {met};\n'
        return result +'}\n'

class CILMethod():
    def __init__(self, cool_meth: Feature.CoolDef, cil_program: CILProgram):
        super().__init__()
        self.name = f'{cool_meth.father.type}_{cool_meth.ID.id}'
        self.body:list[CILExpr] = []  # Lista de CILExpr, representa el cuerpo del método
        self.params:list[CILId] = []
        self.locals:list[CILVar] = []
        self.context = {}
        self.set_vars(cool_meth, cil_program)
        self.set_body(cool_meth)
    
    def set_vars(self, cool_meth:Feature.CoolDef, cil_program:CILProgram):
        # for atr in cil_program.types[cool_meth.father.type].attributes:
        #     self.locals.append(atr)
        #     self.context[atr.id.id] = pos
        #     pos+=4
        
        #el scope del metodo posee los parametros, los parametros estaran en orden en la pila. El contexto define la posicion del parametro en la pila     
        #queda por parte del invocador guardar los valores que se le pasan por parametros y la instancia en la pila. Esto se hace en el callable
        self.context[env.self_name] = 0
        pos= 0
        for param in cool_meth.params.childs():
            self.params.append(param)
            pos+=4
            self.context[param.id] = pos
        
    def set_body(self, cool_meth:Feature.CoolDef):    
        body = Body()
        TempNames.free_all() #Cuando se va a definir un nuevo metodo se liberan los temporales
        DivExpression(cool_meth.scope, body, self.context)
        self.body = [e for e in body.expressions if e.use_in_code_line]
        
        # if self.name != 'Main_main':
            # self.body.insert(0,Label(self.name))
        # else:
        #     self.body.insert(0,Label('main'))
        self.body.insert(0,Label(self.name))
        
        # if self.name == 'Main_main':
        #     self.body.append(CloseProgram(body.return_value()))
        # else:    
        #     self.body.append(CILReturn(body.return_value()))
        self.body.append(CILReturn(body.return_value()))
        

    def __str__(self) -> str:
        result = str(self.body[0])
        result += '{\n'
        for local in self.locals:
            result+= f'\tLocal {local};\n'
        for param in self.params:
            result+= f'\tParam {param};\n'
        i = 0
        for e in self.body:
            if i > 0:
                if isinstance (e,CILCommet):
                    result+= f'\t{e}\n'
                else:
                    result+= f'\t{e};\n'
            i+=1
        return result +'}\n'

class InitMethod(CILMethod):
    def __init__(self, cclass: CoolClass, space):
        self.body:list[CILExpr] = []  # Lista de CILExpr, representa el cuerpo del método
        self.set_body(cclass, space)
        self.cclass = cclass
        self.name = f'__init_{cclass}__'

    def __str__(self) -> str:
        result = f'init_{self.cclass}\n'
        for e in self.body:
            result += f'\t{e}\n'
        return result+'\n}\n'        
            
    def set_body(self, cclass:CoolClass, space):
        TempNames.free_all() #esto lleva ahora un control fuerte en la pila, antes de lamar un metodo hay que guardar los temporales
        scope = {env.self_name: 0}
        body = Body()
        body.add_expr(ReserveHeap(space))#Reservar espacio para la instancia
        body.add_expr(MipsLine(f'move {TempNames.get_s(1)}, $v0')) # Mover la dirección del heap al registro $s1
        # body.add_expr(StoreInDir('$a0',0,'$a0')) #Guarda el puntero de a0 en a0(0)
        temp = TempNames.get_name()
        body.add_expr(MipsLine(f'la $t{temp[5:]}, {cclass.type}')) # Carga la direccion del tipo en Data
        body.add_expr(StoreInDir(temp,0)) #Guarda cada uno de los features en la memoria
        TempNames.free([temp])
        
        pos = 4 #que comience en 4 dice que 
        
        for feature in cclass.childs():
            if isinstance(feature,Feature.CoolAtr):
                DivExpression(feature, body, scope)
                temp = body.current_value()
                body.add_expr(StoreInDir(body.current_value(),pos)) #Guarda cada uno de los features en la memoria
                TempNames.free([temp])
                pos+=4
        
        body.expressions.insert(0,Label(f'__init_{cclass.type}__'))
        # body.add_expr(CILId('$s1'))
        # body.add_expr(CILReturn(body.return_value()))
        body.add_expr(CILReturn('$s1'))
        TempNames.free_s(1)
        self.body = [e for e in body.expressions]          

class StartMetodh(CILMethod):
    def __init__(self):
        pass

class NameLabel():
    label_id:dict[str:int] = {}  # Contador para generar identificadores
    def __init__(self, label = 'else') -> None:
        self.label = label
        if NameLabel.label_id.__contains__(label):
            NameLabel.label_id[label]+=1
        else:
            NameLabel.label_id[label]=0
    
    def get(self):
        return f"{self.label}_{NameLabel.label_id[self.label]}"

class CILExpr():
    def __init__(self) -> None:
        self.use_in_code_line = True
        self.tab_lv = 0
        self.return_void = False
        self.use_as_current = True

    def add_tab_lv(self):
        self.tab_lv+=1    
    def __repr__(self) -> str:
        return self.__str__()    

class CILVoid(CILExpr):
    def __init__(self) -> None:
        super().__init__()
        self.return_void = True
        self.use_in_code_line = False

class Label(CILExpr):
    def __init__(self, name_label) -> None:
        super().__init__()
        self.name = name_label + ':'
        self.use_as_current = False

    def __str__(self) -> str:
        # return f"{Fore.MAGENTA}{self.name}{Fore.WHITE}"
        return f"{self.name}"
    def __repr__(self) -> str:
        return self.__str__()
    
class CILId(CILExpr):
    def __init__(self, name):#, space = 4) -> None:
        super().__init__()
        self.use_in_code_line = False #esto implica que estara en el cuerpo que se esta analizando para tenerlo presente como valor de retorno, pero no se usa en el codigo, salvo en el caso exepcional de usarlo de return.
        self.name = name
        self.dest = name
        self.space = 4

    def __str__(self) -> str:
        return self.name
    def __repr__(self) -> str:
        return str(self)

class CILVar(CILId):
    def __init__(self, name, space=4, value = None) -> None:
        super().__init__(name)
        self.space = space
        self.value = value

    def __str__(self) -> str:
        if self.value is None:
            return f'{self.name}'
        else:
            return f'{self.name} = {self.value}'
            
    def __repr__(self) -> str:
        return str(self)

class CILReturn(CILExpr):
    def __init__(self, e) -> None:
        self.ret = e
    def __str__(self) -> str:
        return f'return {self.ret}'
    def __repr__(self) -> str:
        return self.__str__()    

class CILAttribute():
    def __init__(self, name):
        super().__init__()
        self.name = name

class CILAssign(CILExpr):
    def __init__(self, dest:str, source, is_temp = True):
        super().__init__()
        self.dest:str = dest      # Vrle a la que se asigna el valor
        # self.dest:CILVar = CILVar(dest)      # Vrle a la que se asigna el valor
        self.source:CILExpr = source  # Expresin que se asigna a la variable
        self.is_temp = is_temp

    def __str__(self):
        return f"{self.dest} = {self.source}"
    def __repr__(self) -> str:
        return self.__str__()

class CILArithmeticOp(CILExpr):
    def __init__(self, left, right, operation, constant = False):
        super().__init__()
        self.left = left       # lado izquierdo
        self.right = right     # lado derecho
        self.operation = operation  #('+', '-', '*', '/')
        self.constant = constant

    def __str__(self):
        return f"{self.left} {self.operation} {self.right}"
    def __repr__(self) -> str:
        return self.__str__()
    
class CILLogicalOP(CILExpr):
    def __init__(self,left, right, operation):
        super().__init__()
        self.operation = operation
        self.left = left   
        self.right = right

    def __str__(self):
        return f"{self.left} {self.operation} {self.right}"
    def __repr__(self) -> str:
        return self.__str__()

class CILogicalString(CILLogicalOP):
    def __init__(self, left, right, operation, temp1 = '$s5', temp2 = '$s6'):
        ''' Recibe el string izquierdo, el string derecho, y dos temporales para cargar valores, los temporales por defecto son $s5 y $s6, el resultado final lo guarda en uno de los dos registros que se le pasaron para comparar'''
        super().__init__(left, right, operation)
        self.temp1 = temp1 #regitro temporal para cargar bytes del string izquierdo
        self.temp2 = temp2 #regitro temporal para cargar bytes del string derecho
        self.dir1 = left #registro con el valor igual a la posicion en memoria del string 1
        self.dir2 = right #registro con el valor igual a la posicion en memoria del string 2
        self.label_loop = NameLabel('loop_compare').get() #cargar un label para el loop del copiado de string
        self.label_end = NameLabel('end_compare').get() #etiqueta para salir del ciclo
        self.label_not_equals = NameLabel('end_not_equals').get() #
        self.dest = left #va a guardar el resultado de la comparacion en el mismo registro que se uso en la misma

    def __str__(self):
        return f'{self.dir1} == {self.dir2}'
    
    def to_mips(self):
        temp1 = self.temp1
        temp2 = self.temp2
        dir1 = self.dir1
        dir2 = self.dir2
        if temp1[0] != '$': temp1 = f'$t{temp1[5:]}'
        if temp2[0] != '$': temp2 = f'$t{temp2[5:]}'
        if dir1[0] != '$': dir1 = f'$t{dir1[5:]}'
        if dir2[0] != '$': dir2 = f'$t{dir2[5:]}'
        dest = dir1

        lines = [
            f'{self.label_loop}:',
            f'lb {temp1}, 0({dir1})',         # Cargar el caracter actual en temporal
            f'lb {temp2}, 0({dir2})',         # Cargar el caracter actual en temporal
            f'addiu {dir1}, {dir1}, 1',       # Avanzar a la siguiente posición en la memoria
            f'addiu {dir2}, {dir2}, 1',       # Avanzar a la siguiente posición en la memoria
            f'bne {temp1}, {temp2}, {self.label_not_equals}', #si son distintos ir a la etiqueta de `no son iguales`, en otro caso sigue.
            f'bnez {temp1}, {self.label_loop}',    # Si llega a aqui entonces ambos temporales tienen igual vaor xq no aslto arriba, luego basta comparar uno con zero, si es distinto de cero, repite el ciclo, en caso de ser cero, se llego al caracter final con todos iguales, por lo tanto son iguales los string
            f'li {dest}, 1', #Si llega a aqui xq el ciclo termino sin desigualdad entonces son iguales, se le asigna 1 al valor de salida
            f'j {self.label_end}', #salta hasta el final sin asignar 0
            f'{self.label_not_equals}:',
            f'li {dest}, 0', #asigna 0 al resultado final
            f'{self.label_end}:', #etiqueta final
        ]    
        return lines


class CILIf(CILExpr):
    def __init__(self, condition, else_label, _while = False):
        super().__init__()
        self._while = _while
        self.condition = condition
        self.else_label = else_label 
        # self.then_label = then_label

    def __str__(self):
        # return f'if not {self.condition} GOTO {Fore.MAGENTA}{self.else_label}{Fore.WHITE}'
        return f'if not {self.condition} GOTO {self.else_label}'
    def __repr__(self) -> str:
        return self.__str__()

class CILWhile(CILExpr):
    
    def __init__(self, condition, body):
        super().__init__()
        self.condition = condition  # Expresn que determina el bucle
        self.body = body           

    def __str__(self):
        body_str = " ".join(str(node) for node in self.body)
        return f"while {self.condition.get_id()} loop {body_str} pool"

class CILCallLocal(CILExpr):
    def __init__(self, id, pos) -> None:
        super().__init__()
        try:
            self.name = id.id
        except:
            self.name = id

        self.pos = pos #esta es la posicion relativa en la pila.

    def __str__(self) -> str:
        return f'GETLOCAL {self.name}({self.pos})'
    
    def __repr__(self) -> str:
        return self.__str__()

class CILCallAtr(CILExpr):
    def __init__(self, pos_intance_in_memory, id:CoolID, type) -> None:
        super().__init__()
        self.name = id.id
        #este type sirve para buscar los atrbutos por posicion en un diccionario
        self.type = type
        #En get atr la instancia siempre va a ser la correspondiente a self
        self.pos = pos_intance_in_memory

    def __str__(self) -> str:
        return f'GETATTR {self.name}'
    
    def __repr__(self) -> str:
        return self.__str__()
    
    def to_mips(self):
        lines = ['']
    
class CILCall(CILExpr):
    def __init__(self, instance, method, arguments):
        super().__init__()
        self.instance = instance  
        self.method = method     
        self.arguments = arguments 

    def __str__(self):
        args_str = ", ".join(arg.get_id() for arg in self.arguments)
        return f"{self.get_id()} = call {self.instance.get_id()}.{self.method}({args_str})"

class CILBlock(CILExpr):

    def __init__(self, instructions):
        super().__init__()
        self.instructions = instructions  # instruccion de bloq

    def __str__(self):
        instr_str = " ".join(str(instr) for instr in self.instructions)
        return f"{{ {instr_str} }}"

class CILAllocate(CILExpr):
    
    def __init__(self, type_name):
        super().__init__()
        self.type_name = type_name  # El nombre del tipo que se asigna memoria

    def __str__(self):
        return f"{self.get_id()} = ALLOCATE {self.type_name}"

class CILFree(CILExpr):
    
    def __init__(self, instance):
        super().__init__()
        self.instance = instance  # La instancia de memoria qse libera

    def __str__(self):
        return f"FREE {self.instance.get_id()}"

class CILCommet(CILExpr):
    def __init__(self, text = '#comment') -> None:
        super().__init__()
        self.text = text
        self.use_as_current = False
        

    def __str__(self) -> str:
        result = self.text
        # result = Fore.GREEN + self.text + Fore.WHITE
        return result
    def __repr__(self) -> str:
        return str(self)

class GOTO(CILExpr):
    def __init__(self, label) -> None:
        super().__init__()
        self.label = label
        self.return_void = True
    def __str__(self) -> str:
        return f"GOTO {self.label}"    
        # return f"GOTO {Fore.YELLOW}{self.label}{Fore.WHITE}"    
    def __repr__(self) -> str:
        return self.__str__()

class ReserveSTACK(CILExpr):
    def __init__(self, space ) -> None:
        super().__init__()
        self.space = space
        self.use_as_current = False
    def __str__(self) -> str:
        return f"Reserve Stack {self.space}"    
    def __repr__(self) -> str:
        return self.__str__()
    
class FreeStack(CILExpr):
    def __init__(self, space) -> None:
        super().__init__()
        self.space = space
        self.use_as_current = False

    def __str__(self) -> str:
        return f"Free Stack {self.space}"    
    def __repr__(self) -> str:
        return self.__str__()

class StoreLocal(CILExpr):
    def __init__(self, name, pos, value, register ='$t', type = env.int_type_name) -> None:
        super().__init__()
        self.name = name
        self.value = value
        self.pos = pos #esta es la posicion relativa en la pila.
        self.dest = value
        self.register = f'{register}{value[5:]}'
        self.type = type
        if value == 'a0':
            self.register = '$a0'
        if value[0] =='$':
            self.register = value


    def __str__(self) -> str:
        return f'{self.name} => STORELOCAL {self.value}({self.pos})'
    
    def __repr__(self) -> str:
        return self.__str__()

class CallDispatch(CILExpr):
    def __init__(self,meth:CoolCallable, instance: CoolID,arguments = []) -> None:
        super().__init__()
        self.meth = meth
        self.context:Context = instance.get_class_context()
        self.type = self.context.type
        self.arguments = arguments
    
    def __str__(self) -> str:
        return f'CALL {isinstance.id}.{self.meth}{self.arguments}'    

class CallMethod(CILExpr):
    def __init__(self,label) -> None:
        super().__init__()
        self.label = label
    
    def __str__(self) -> str:
        return f'GOTO self.{self.label}'    

class ToA0(CILExpr):
    def __init__(self, value) -> None:
        super().__init__()
        self.value = value
    def __str__(self) -> str:
        return f'a0 = {self.value}'
    
class FromA0(CILExpr):
    def __init__(self) -> None:
        super().__init__()
        self.dest = 'a0'
        self.use_in_code_line = False
    def __str__(self) -> str:
        return f'a0'    

class CloseProgram(CILExpr):
    def __init__(self, e) -> None:
        super().__init__()
        self.use_in_code_line = False
        self.ret = e

    def __str__(self) -> str:
        return f'CLOSE'
        # return f'{Fore.RED}CLOSE{Fore.WHITE}'

class MipsLine(CILExpr):
    def __init__(self, line) -> None:
        super().__init__()
        self.line = line
    def __str__(self) -> str:
        return self.line    

class ReserveHeap(CILExpr):
    def __init__(self, space) -> None:
        super().__init__()
        self.space = space
            
    def __str__(self) -> str:
        return f'ReserveMemory {self.space}'
    
    def to_mips(self):
        return  [f'li $a0, {self.space}',  # Reservar `space` bytes en el heap
                  'li $v0, 9',             # Código de sistema para sbrk
                  'syscall']               #Llamar al sistema]

class StoreInDir(CILExpr):
    def __init__(self, value, pos, dir ='$s1') -> None:
        super().__init__()
        self.dest = value
        self.pos = pos #esta es el desplazamiento desde la posicion `dir`
        self.dir = dir

    def __str__(self) -> str:
        return f'{self.dest}=> STOREMEMORY {self.dir}({self.pos})'
    
    def __repr__(self) -> str:
        return self.__str__()
    
    def to_mips(self):
        if self.dir[0] !='$':
            self.dir = f'$t{self.dir[5:]}'
        
        if self.dest[0] == '$' :
            return [f'sw {self.dest}, {self.pos}({self.dir})']
        else:
            return [f'sw $t{self.dest[5:]}, {self.pos}({self.dir})']
        
class LoadFromDir(CILExpr):
    def __init__(self, dest, pos, dir) -> None:
        super().__init__()
        self.dest = dest
        self.pos = pos
        self.dir = dir
    
    def __str__(self) -> str:
        return f'{self.dest}=> LOADEMEMORY {self.dir}({self.pos})'
    
    def __repr__(self) -> str:
        return self.__str__()
    
    def to_mips(self):
        if self.dir[0] !='$':
            self.dir = f'$t{self.dir[5:]}'

        if self.dest[0] == '$':
            return [f'lw {self.dest}, {self.pos}({self.dir})']
        else:
            return [f'lw $t{self.dest[5:]}, {self.pos}({self.dir})']

class StoreString(CILExpr):
    def __init__(self,data_name,temp,dir = '$s3', dest ='$s4') -> None:
        super().__init__()
        self.dir = dir #lugar donde voy a guardar temporalmente la direccion en memoria de la data
        self.dest = dest #direccion en memoria donde voy a guardar el string
        self.label = NameLabel('copy').get() #cargar un label para el loop del copiado de string
        self.data_name = data_name #identificador en la seccion de data
        self.temp = temp #temporal que voy a utilizar para mover bits

    def __str__(self) -> str:
        return f'{self.dest}=> STORESTRING {self.dir}(0)'
    
    def __repr__(self) -> str:
        return self.__str__()
    
    def to_mips(self):
        if self.dir[0] !='$':
            self.dir = f'$t{self.dir[5:]}'
        
        if self.dest[0] !='$':
            self.dest = f'$t{self.dest[5:]}'
        
        if self.temp[0] != '$' :
            self.temp = f'$t{self.temp[5:]}'

        lines = [
            f'la {self.dir}, {self.data_name}',      # Cargar la dirección del string en el registro dir
            f'{self.label}:',
            f'lb {self.temp}, 0({self.dir})',         # Cargar el caracter actual en temporal
            f'sb {self.temp}, 0({self.dest})',        # Almacenar el caracter en la memoria direccion dest
            f'addiu {self.dir}, {self.dir}, 1',       # Avanzar al siguiente caracter en el string
            f'addiu {self.dest}, {self.dest}, 1',     # Avanzar a la siguiente posición en la memoria
            f'bnez {self.temp}, {self.label}',    # Si el caracter no era el terminador de string (NULL), repetir el bucle'
        ]    
        return lines

class LoadString(CILExpr):
    '''Recibe un coolstring y un temporal, carga la direccion de coolstring de data en el temporal '''
    def __init__(self, string:CoolString, temp) -> None:
        super().__init__()
        self.string = string
        self.dest = temp

    def __str__(self) -> str:
        return f"LOADSTRING {self.string} in {self.dest}"
    
    def to_mips(self):
        return [f'la $t{self.dest[5:]}, {self.string.data_name}'] # carga la direccion del string en el registro temporal

class CILNot(CILExpr):
    def __init__(self, dest) -> None:
        super().__init__()
        self.dest = dest
    def __str__(self) -> str:
        return f'{self.dest} = not {self.dest}'

    def to_mips(self):
        dest = self.dest
        if dest[0] != '$':
            dest = f'$t{dest[5:]}'
        return [
            f'addi {dest} {dest} -1',
            f'subu {dest} $zero {dest}'
            ]    

class CILUminus(CILExpr):
    def __init__(self, dest) -> None:
        super().__init__()
        self.dest = dest
    def __str__(self) -> str:
        return f'{self.dest} = ~{self.dest}'

    def to_mips(self):
        dest = self.dest
        if dest[0] != '$':
            dest = f'$t{dest[5:]}'
        return [
            f'addi {dest} {dest} -1',
            f'subu {dest} $zero {dest}'
            ]    

################################################## PROCESADOR DE COOL ###########################################################
class Body:
    def __init__(self) -> None:
        self.expressions:list[CILExpr] = []
    
    def add_expr(self, e:CILExpr):
        self.expressions.append(e)
    
    def current(self):
        index = 1
        for i in range(len(self.expressions)-1, -1,-1):
            # if isinstance(self.expressions[i], CILCommet)\
            #     or isinstance(self.expressions[i], FreeStack)\
            #     or isinstance(self.expressions[i], ReserveSTACK):
            if not self.expressions[i].use_as_current:
                index+=1
            else:
                break
            
        if len(self.expressions)>=index:
            return self.expressions[-index]
    
    def current_value(self):
        return self.current().dest
        

    def return_value(self):
        if self.current().return_void:
            return ""
        else:
            return self.current_value()

class IsType:
    def simple_type(e): return IsType.simple_id(e) or IsType.int(e) or  IsType.string(e) or IsType.bool(e)
    def atr(e): return IsType.id(e) and e.is_atr(e.id)
    def int(e): return isinstance(e, IntNode)
    def string(e): return isinstance(e, CoolString)
    def bool(e): return isinstance(e, CoolBool)
    def id(e): return isinstance(e, CoolID)
    def local(e): return isinstance(e, CoolID) and not e.is_atr(e.id)
    def simple_id(e): return IsType.id(e) and not IsType.atr(e)
    def arithmetic(e): return isinstance(e, ArithmeticOP)
    def logical(e): return isinstance(e, Logicar)
    def let(e): return isinstance(e, CoolLet)
    def block(e): return isinstance(e, CoolBlockScope)
    def assign(e): return isinstance(e, Assign)
    def dispatch(e): return isinstance(e, Dispatch)
    def callable(e): return isinstance(e, CoolCallable)
    def new(e): return isinstance(e, CoolNew)
    def _if(e): return isinstance(e, CoolIf)
    def _while(e): return isinstance(e, CoolWhile)
    def cool_atr(e): return isinstance(e,Feature.CoolAtr)
    def bool(e): return isinstance(e,CoolBool)
    def _not(e): return isinstance(e,CoolNot)
    def uminus(e): return isinstance(e,CILUminus)
    # def out_string(e): return isinstance(e.callable) and 

class DivExpression:
    def __init__ (self, e:expr, body:Body, scope = {}):
        if IsType.arithmetic(e):
            DivExpression.arithmetic(e, body, scope)
        if IsType.logical(e):
            DivExpression.logical(e, body, scope)
        if IsType.atr(e):
            #Aqui entrara solo en casos que se necesite hacer get
            DivExpression.get_atr(e,body, scope) 
        # if IsType.id(e):
            # DivExpression.id_value(e,body) 
        if IsType.local(e):
            DivExpression.local_var(e,body, scope) 
        if IsType.let(e):
            DivExpression.let(e,body, scope)
        if IsType.block(e):
            DivExpression.block(e,body, scope)
        if IsType.assign(e):
            DivExpression.assing(e,body, scope)
        if IsType.dispatch(e):
            DivExpression.dispatch(e,body, scope)    
        if IsType.new(e):
            DivExpression.new(e,body, scope)    
        if IsType._if(e):
            DivExpression._if(e,body, scope)
        if IsType._while(e):
            DivExpression._while(e,body, scope)
        if IsType.int(e):
            DivExpression.int(e,body, scope)    
        if IsType.bool(e):
            DivExpression.bool(e,body, scope)    
        if IsType.callable(e):
            DivExpression.call_meth(e,body, scope)
        if IsType.cool_atr(e):
            DivExpression.cool_atr(e,body,scope)    
        if IsType.string(e):
            DivExpression.save_str(e,body,scope)
        if IsType._not(e):
            DivExpression._not(e,body,scope)
        if IsType.uminus(e):
            DivExpression.uminus(e,body,scope)    

    def _not(e: CoolNot, body:Body, scope:dict = {}):
        DivExpression(e.value, body, scope)
        temp = body.current_value()
        body.add_expr(CILNot(temp))
        TempNames.free([temp]) #Como no existe and\or se puede liberar el temporal, debe usarse de inmediato o guardarse en una variable
    
    def uminus(e: CoolUminus, body:Body, scope:dict = {}):
        DivExpression(e.value, body, scope)
        temp = body.current_value()
        body.add_expr(CILUminus(temp))
        TempNames.free([temp]) #

    def save_str(s: CoolString, body:Body, scope:dict = {}):
        Data.add(f'{s.data_name}: .asciiz "{s.value[1:-1]}"')

        space = len(s.value) -2 +1 # el string es de tamanno len-2 y se le suma 1 para el caracter nulo
        body.add_expr(ReserveHeap(space))#Reservar espacio para el tamanno del string
        body.add_expr(MipsLine(f'move $s4, $v0')) # Mover la dirección del heap al registro $s1

        temp = TempNames.get_name()
        body.add_expr(StoreString(s.data_name,temp=temp,dest= '$s4',dir = '$s3')) #Guarda byte a byte el string en la direccion del heap
        body.add_expr(CILAssign(temp,'$v0')) #Guarda en un temporal la direccion de memoria donde se escribio el string
        #TODO considerar liberar el temporal desde aqui

    def load_string(s: CoolString, body:Body, scope:dict = {}):
        #esto carga el string en un resgitro pero no lo guarda en memoria
        Data.add(f'{s.data_name}: .asciiz "{s.value[1:-1]}"') #se guarda el string en la seccion data
        temp = TempNames.get_name() #se crea una variable temporal para guardar el string
        body.add_expr(LoadString(s,temp)) # carga la direccion del string en el registro temporal
        #TODO valorar liberar el temporal desde aqui
        return temp #Devuelve el registro con el string, al devolverlo se tiene mas contro para despues hacer free
        
    def assing(assign: Assign, body:Body, scope:dict = {}):
        if assign.left.id in scope:
            #estamos tratando con una variable local, luego hay que guardar su valor en la pila
            DivExpression(assign.right, body, scope)
            temp = body.current_value()
            if isinstance(scope[assign.left.id],list):
                body.add_expr(StoreLocal(assign.left.id, value = body.current_value(), pos= scope[assign.left.id][0]))
            else:
                body.add_expr(StoreLocal(assign.left.id, value = body.current_value(), pos= scope[assign.left.id]))
            TempNames.free([temp])    
        else:
            #si la parte izquierda no esta en el scope(lo que es la pila o lo declarado en algun let), entonces es un atributo, TODO implementar el comportamiento
            DivExpression(assign.right, body, scope)
            assigned_value = body.current_value()
            DivExpression.set_atr(assign.left,body,scope,value=assigned_value)
            TempNames.free([assigned_value])

            #lo de debajo no deberia pinchar, debe estar sobrando
            # if IsType.simple_type(assign.right):
            #     body.add_expr(CILAssign(assign.left.id,assign.right,is_temp=False))
            # else:
            #     DivExpression(assign.right, body, scope)
            #     body.add_expr(CILAssign(assign.left.id,body.current_value(),is_temp=False))
    
    def cool_atr(a:Feature.CoolAtr, body:Body, scope:dict = {}):
        DivExpression(a.value,body,scope)
        # temp = body.current_value()
        # body.add_expr(CILAssign(TempNames.get_name(),temp))
        # TempNames.free([temp])

    def arithmetic(aritmetic: ArithmeticOP, body:Body, scope:dict = {}):
        # lefth_is_id_and_not_atr = IsType.id(aritmetic.left) and not aritmetic.left.is_atr()
        # right_is_id_and_not_atr = IsType.id(aritmetic.right) and not aritmetic.right.is_atr()
        
        mult_div = (aritmetic.op == '/' or aritmetic.op == '*')

        # if (IsType.int(aritmetic.left) or lefth_is_id_and_not_atr)  and (IsType.int(aritmetic.right) or right_is_id_and_not_atr ):
        if (IsType.int(aritmetic.left)) and (IsType.int(aritmetic.right) ) and not mult_div and USE_i:
            body.add_expr(CILAssign(TempNames.get_name(),aritmetic.left))
            left_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILArithmeticOp(left_value,aritmetic.right, aritmetic.op, constant=True)))
            TempNames.free([left_value])
        elif isinstance(aritmetic.left, IntNode) and (aritmetic.op == '+') and not mult_div and USE_i:# or lefth_is_id_and_not_atr):
            DivExpression(aritmetic.right,body,scope)
            rigth_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILArithmeticOp(rigth_value,aritmetic.left,aritmetic.op, constant=True)))
            TempNames.free([rigth_value])
            # body.add_expr(CILAssign(TempNames.get_name(),CILArithmeticOp(aritmetic.left,body.current_value(),aritmetic.op)))
        # elif (isinstance(aritmetic.right, IntNode) or right_is_id_and_not_atr):
        elif (isinstance(aritmetic.right, IntNode))and not mult_div and USE_i:
            DivExpression(aritmetic.left,body,scope)
            left_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILArithmeticOp(body.current_value(),aritmetic.right,aritmetic.op, constant=True)))
            TempNames.free([ left_value])
        else:
            DivExpression(aritmetic.left,body,scope)
            left_value = body.current_value()
            DivExpression(aritmetic.right,body,scope)
            rigth_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILArithmeticOp(left_value,rigth_value,aritmetic.op)))
            #cuando yo termino una operacion aritmetica, yo puedo volver a utilizar los variables donde no guarde el resultado, dado la naturaleza del codigo recursivo que va desde hijos a padres, solo me interesa conservar la varable donde se asigno el valor de la operacion. Luego las variables que use en el cuerpo de la operacion no las necesito, por lo tanto pueden volver a usarse.
            TempNames.free([left_value,rigth_value])
    
    def logical(logicar:Logicar, body:Body, scope:dict = {}):
        if logicar.op != '=':
            DivExpression.logicar_not_eq(logicar, body, scope)
        else:
            DivExpression.logicar_eq(logicar, body, scope)

    def logicar_eq(logicar:Logicar, body:Body, scope:dict = {}):
        if logicar.left.get_type() != env.string_type_name:
            DivExpression(logicar.left,body,scope)
            left_value = body.current_value()
            DivExpression(logicar.right,body,scope)
            rigth_value = body.current_value()
            TempNames.free([left_value,rigth_value])
            body.add_expr(CILAssign(TempNames.get_name(),CILLogicalOP(left_value,rigth_value,logicar.op)))
        else:
            #En caso de ser string hay que usar el comparador de strings
            if isinstance(logicar.left, CoolString):
                #en caso de ser un string constante solo hace falta cargarlo
                left_value = DivExpression.load_string(logicar.left,body, scope)
            else:    
                #en caso contrario hay que dividir la expresion
                DivExpression(logicar.left,body,scope)
                left_value = body.current_value()
            
            if isinstance(logicar.right, CoolString):
                #en caso de ser un string constante solo hace falta cargarlo
                rigth_value = DivExpression.load_string(logicar.right,body, scope)
            else:    
                #en caso contrario hay que dividir la expresion
                DivExpression(logicar.left,body,scope)
                rigth_value = body.current_value()

            body.add_expr(CILogicalString(left_value,rigth_value,'='))
            TempNames.free([left_value,rigth_value])

    def logicar_not_eq(logicar:Logicar, body:Body, scope:dict = {}):
        if (IsType.int(logicar.left)) and (IsType.int(logicar.right)):
            body.add_expr(CILAssign(TempNames.get_name(),logicar.left))
            left_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),logicar.right))
            rigth_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILLogicalOP(left_value,rigth_value, logicar.op)))
            TempNames.free([left_value,rigth_value])

        elif isinstance(logicar.left, IntNode):
            body.add_expr(CILAssign(TempNames.get_name(),logicar.left))
            left_value = body.current_value()
            DivExpression(logicar.right,body,scope)
            rigth_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILLogicalOP(left_value,rigth_value,logicar.op)))
            TempNames.free([left_value,rigth_value])
        
        elif isinstance(logicar.right, IntNode):
            body.add_expr(CILAssign(TempNames.get_name(),logicar.right))
            rigth_value = body.current_value()
            DivExpression(logicar.left,body,scope)
            left_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILLogicalOP(body.current_value(),rigth_value,logicar.op)))
            TempNames.free([left_value,rigth_value])
        else:
            DivExpression(logicar.left,body,scope)
            left_value = body.current_value()
            DivExpression(logicar.right,body,scope)
            rigth_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILLogicalOP(left_value,rigth_value,logicar.op)))
            TempNames.free([left_value,rigth_value])
    
    def int(_int:IntNode, body:Body, scope:dict = {}):
        body.add_expr(CILAssign(TempNames.get_name(),_int))

    def bool(_bool:CoolBool, body:Body, scope:dict = {}):
        if _bool.value == False:
            body.add_expr(CILAssign(TempNames.get_name(),IntNode()))
        else:    
            body.add_expr(CILAssign(TempNames.get_name(),IntNode(1)))

    def get_atr(id:CoolID, body:Body, scope:dict = {}, instance = 'self', dest= None):
        # body.add_expr(CILCallAtr(scope[instance],id))

        dir_instance_in_stack = scope[instance]
        #ahora hay que sacar la direccion que tiene la pila en la posicion en pila de self
        body.add_expr(CILAssign(TempNames.get_name(), CILCallLocal('self',dir_instance_in_stack)))
        dir_instance = body.current_value()
        #yo puedo pedir el type dela clase del id directamente, porque el get atr sera sin formato dispatch(gramatica de cool)
        type = id.get_class_context().type #Este es el type de la clase que tiene el id
        
        if id.id != env.self_name:
            pos = TYPES[type].atrs[id.id]
            if dest == None:
               dest = TempNames.get_name() #si es none guardar en un temporal

            body.add_expr(LoadFromDir(dest=dest,pos=pos,dir=dir_instance))
            TempNames.free([dir_instance])
            # TempNames.free([body.current_value()])
            
        #Si no entra al if el ultimo valor(curent value) sera exactamente dir_instance que es self

    def set_atr(id:CoolID, body:Body, scope:dict = {}, instance = 'self', value = None):
        dir_instance_in_stack = scope[instance]
        #ahora hay que sacar la direccion que tiene la pila en la posicion en pila de self
        body.add_expr(CILAssign(TempNames.get_name(), CILCallLocal('self',dir_instance_in_stack)))
        dir_instance = body.current_value()
        #yo puedo pedir el type dela clase del id directamente, porque el get atr sera sin formato dispatch(gramatica de cool)
        type = id.get_class_context().type #Este es el type de la clase que tiene el id
        pos = TYPES[type].atrs[id.id]
        body.add_expr(StoreInDir(value=value,pos=pos, dir=dir_instance))
        TempNames.free([dir_instance])
    
    def local_var(vvar, body:Body, scope:dict = {}):
        #Si el scope tiene dos posiciones para ua variable entonces, se ha definido que la variable que se usa para definir a una con su mismo nombre estara en la posicion 1, y la variable nueva creada es la que esta en la posision 0.
        if isinstance(scope[vvar.id], list):
            body.add_expr(CILAssign(TempNames.get_name(),CILCallLocal(vvar,scope[vvar.id][1])))
        else:
            body.add_expr(CILAssign(TempNames.get_name(),CILCallLocal(vvar,scope[vvar.id])))
    
    def let(let:CoolLet, body:Body, scope:dict = {}):
        color = get_color()
        # body.add_expr(CILCommet(f'{color}#Region Let'))
        body.add_expr(CILCommet(f'#Region Let'))
        
        let_scope:dict= {}
        length = 0
        pos = 0
        for vvar in let.let:
            length += 4

        for var in scope.keys():
            #esto inicializa cada variable del scope anterior en su posicion anterior, se hace esto para usar el scope recursivo
            let_scope[var] = scope[var] 
        
        for vvar in let.let:
            if not scope.__contains__(vvar.id):
                let_scope[vvar.id] = 0 #Como se agrega una por una las variables a la pila, lo que se hace es mover la posicion del resto y agregar la nueva en la posicion 0 
                # let_scope[vvar.id] = pos 
            else:
                #va a tener dos posiciones, en la posicion 0 estara la variable principal, y en la posicion 1 estara la referencia a la vieja
                #esto es para el caso que quiera en la defincion de a variable `x` usar una variable con el nombre `x` en el scope anterior
                if not isinstance(scope[vvar.id], list):
                    let_scope[vvar.id] = [0, scope[vvar.id]]
                else:
                    #si entra aqui quiere decir que no ha salido de la definicion de la variable, y esta tratando de definir otra con el mimo nombre, por ejemplo en el caso de let x<- let x<-<expr que usa `x`> y la variable `x`` existe en el scope anterior, entonces si va a usar `x` dentro de lainicializacion del segundo let al cual le llega el scope del primer let, a ese let le llegara un scope con `scope[x] = (p1,p2)`, donde p2 es la posicion de la primera de las x, la que en ese momento esta defnida, luego esa sera la x que nos interesa llamar en la expresion donde se inicializara la `x` del segundo let. Por tanto para buscar el valor de `x` en la pila se buscara la posicion 1, scope[1]. Cuando se termina de defnir una variable la x que esta en la pila se sobreescribe por la nueva.(Ultima linea del For).
                    let_scope[vvar.id] = [0, scope[vvar.id][1]]

            move = 4 
            # if vvar.get_type() == env.string_type_name:
            #     move = 32
            
            pos += move
            body.add_expr(ReserveSTACK(move))
            
            for var in scope.keys():
                #Esto mueve los datos de contextos superiores de forma dinamica, en caso que la variable del scope anterior tenga igual nombre que una nueva no se hace este movimiento
                if vvar.id != var:
                    let_scope[var] += move
                else:
                    #si en el scope anterior hay una variable con el mismo nombre, esta tendra dos posiciones, se mueve la posicion 1
                    let_scope[var][1] += move
                    pass
            
            for var in let_scope.keys():
                #las variales que no son de scope anterior hay que moverlas tambien, ya que se crea espacio uno a uno
                if var not in scope and var != vvar.id:
                    let_scope[var] += move
                
            
            # if vvar.get_type() == env.int_type_name:
            if vvar.value is not None:
                DivExpression(vvar.value, body, scope = let_scope)
                temp = body.current_value()
                if isinstance(let_scope[vvar.id],list):
                    body.add_expr(StoreLocal(vvar.id, value = body.current_value(), pos= let_scope[vvar.id][0]))
                else:
                    body.add_expr(StoreLocal(vvar.id, value = body.current_value(), pos= let_scope[vvar.id]))
                TempNames.free([temp])    
            else:
                
                pass #este es el caso de una instancia de clase, hay que analizarlo
            
            #Cuando la variable ya salga de su definicion, del cuerpo del let, hay que eliminar la tupla y dejarlo solo en el valor como entero
            if isinstance(let_scope[vvar.id], list):
                let_scope[vvar.id] = let_scope[vvar.id][0]
        
        DivExpression(let.in_scope, body, scope = let_scope)
        #Liberar espacio de la pila una vez se sale del let, el scope anterior al del let debe salir igual que antes por recursividad
        body.add_expr(FreeStack(length))        
        # body.add_expr(CILCommet(f'{color}#End Region Let'))
        body.add_expr(CILCommet(f'#End Region Let'))

    def block(block:CoolBlockScope, body:Body, scope:dict = {}):
        for e in block.exprs:
            DivExpression(e,body, scope)

    def id_value(e:CoolID,body, scope:dict = {}):
        body.add_expr(CILAssign(TempNames.get_name(),e.id))

    def new(e:CoolNew, body:Body, scope:dict = {}):
        if e.type == env.int_type_name:
            DivExpression.int(IntNode(),body, scope)
        elif e.type == env.bool_type_name:
            DivExpression.bool(CoolBool(),body, scope)
        elif e.type == env.string_type_name:
            pass
        else:
            DivExpression.goto_init(f'__init_{e.type}__',body,scope)
            body.add_expr(CILAssign(TempNames.get_name(),'a0'))

    def case(case:CoolCase, scope:dict = {}):
        pass

    def _while(_while:CoolWhile, body:Body, context:dict = {}):
        color = get_color()
        # loop = NameLabel(f'{color}loop').get()
        loop = NameLabel(f'loop').get()
        condition = _while.condition
        scope = _while.loop_scope
        end_while = NameLabel('end_while').get()
        
        body.add_expr(Label(loop)) #Todos los cambios de la condiciona tienen que volverse a pocesar

        # if IsType.bool(condition):
        #     if condition:
        #         body.add_expr(CILIf(IntNode(1),else_label=end_while))
        #     else:
        #         body.add_expr(CILIf(IntNode(0),else_label=end_while))
        # else:
        DivExpression(condition,body, context)
        temp = body.current_value()
        body.add_expr(CILIf(body.current_value(),else_label=end_while, _while=True))
        TempNames.free([temp])
        #end_else

        DivExpression(scope,body,context)
        body.add_expr(GOTO(loop))
        body.add_expr(Label(end_while))
        body.add_expr(CILVoid()) #esto sirve para que se sepa que si el valor de retorno de la funcion es el while, entonces es tipo void

    def _if (_if:CoolIf, body:Body, scope:dict = {}):
        condition = _if.condition
        then_s = _if.then_scope
        else_s = _if.else_scope
        label = NameLabel('else').get()
        label_end = NameLabel('endif').get()
        result_expr = "$a0"#el resultado se mete en $a0, en caso de ser el if la ultima expresion de un metodo entonces devuelve el resultado

        if IsType.bool(condition):
            if condition:
                body.add_expr(CILIf(IntNode(1),else_label=label))
            else:
                body.add_expr(CILIf(IntNode(0),else_label=label))
        else:
            DivExpression(condition,body,scope)
            body.add_expr(CILIf(body.current_value(),else_label=label))

        DivExpression(then_s,body,scope)
        body.add_expr(CILAssign(result_expr,body.current_value()))
        # then_return = body.current_value()
        body.add_expr(GOTO(label_end))
        body.add_expr(Label(label))
        DivExpression(else_s,body,scope)
        body.add_expr(CILAssign(result_expr,body.current_value()))
        body.add_expr(Label(label_end))

    def dispatch(dispatch:Dispatch, body:Body, scope:dict = {}):
        callable:CoolCallable = dispatch.function
        
        if isinstance( dispatch.expr, CoolID) and dispatch.expr.id == env.self_name:
            #Si la parte izquierda es self, entonces se llama el callable con el self que tiene el scope 
            instance = TempNames.get_name()
            body.add_expr(CILAssign(instance,CILCallLocal('self',scope[env.self_name])))
            #Se guardo en instance la direccion de la instancia que hay en la pila en la posicion indicada por self
            #El tipo de self es el tipo de la clase que contiene a self
            type = dispatch.expr.get_class_context().type
            DivExpression.callable(callable,body,scope,instance, type)
            TempNames.free([instance])
            return
        
        if dispatch.type is not None:
            type = dispatch.type
        else:
            type = dispatch.expr.get_type()    

        expr_type = dispatch.expr.get_type()
        
        if  expr_type != env.int_type_name \
        and expr_type != env.bool_type_name\
        and expr_type != env.string_type_name:
            DivExpression(dispatch.expr, body,scope)
        else:
            #aqui se pueden usar las funciones basicas de string y las funciones de object
            pass 
        instance = body.current_value()#esto va a ser una instancia de clase, dado que es lo que sale de la parte izquierda del dispatch
        
        DivExpression.callable(callable,body,scope,instance, type)#se le pasa esa intancia como self   
    
    def call_meth(meth:CoolCallable, body:Body, scope:dict = {}):
        #esto es lo que se llama cuando se llama al metodo sin nada deante en formato dispatch
        #Si la parte izquierda es vacia es lo mismo que self, entonces se llama el callable con el self que tiene el scope 
        instance = TempNames.get_name()
        body.add_expr(CILAssign(instance,CILCallLocal('self',scope[env.self_name])))
        #Se guardo en instance la direccion de la instancia que hay en la pila en la posicion indicada por self
        #El tipo de self es el tipo de la clase que contiene a self
        type = meth.get_class_context().type
        DivExpression.callable(meth,body,scope,instance, type)
        TempNames.free([instance])

    def callable(callable:CoolCallable, body:Body, scope:dict = {},_self= None, cclass_type = None):
        if cclass_type is None:
            context:Context = callable.get_class_context()
            type = context.type
        else:    
            #Si es llamado desde un dispatch hay que pasarle el tipo
            type = cclass_type

        arguments = callable.params
        id = callable.id.id
        if id not in env.base_methods:
            label_method = f'{type}_{id}'
        else:
            label_method = f'{id}' #Se asume que las funciones de las clases base no se pueden redefinir.

        if _self is not None: #En caso que se le pase una instancia se guarda en $s2
            body.add_expr(CILAssign('$s2',_self))
            TempNames.free([_self])
        
        #Es responsabilidad del invocador coservar los registros temporales, por tanto hay que guardarlos en la pila antes de invocar, asi que se guardan los temporales en la pila. Por ejemplo si tengo algo como temp_0 +call(), tengo que guardar temp_0 en la pila.
        used_temps = TempNames.used_temps()
        if len(used_temps)>0:
            body.add_expr(ReserveSTACK(len(used_temps)*4)) #Reserva pila para los registros temporales en uso
        
        for i in range(len(used_temps)):
            #si hay varios llamados dentro de otro que usa el mismo id de temporal, entonces hay que cambiar el key
            while used_temps[i] in scope:
                used_temps[i] = used_temps[i]+'0'
        
        #Cuando se reserva pila hay que mover las posiciones relativas de las variables del scope
        for key in scope.keys():
            if isinstance(scope[key], list):
                scope[key][0] +=len(used_temps)*4
                scope[key][1] +=len(used_temps)*4
            else:
                scope[key] += len(used_temps)*4

        #primero se mueve las posiciones de lo que hay en la pila y luego se agregan los tmporales
        p = 0
        for temp in used_temps:
            scope[temp] = p
            if temp[0]!='$':
                body.add_expr(StoreLocal(name=temp,pos= p,value=temp[:6]))
            else:
                body.add_expr(StoreLocal(name=temp,pos= p,value=temp[:3]))
            p+=4        

        #una vez se llega a este punto todo lo anterior deberia haberse guardado debidamente en la pila, luego no se necesita guardar ningun registro temporal. Todo lo que el programador de cool necesita guardado lo esta.
        #Ahora hay que procesar los parametros y pasarlos al methodo que se llama, los registros a0-a3 estan pensados para ello, pero si los parametros son mas de esto se debe usar la pila.
        
        space =len(arguments)*4 + 4
        

        #Cuando se reserva pila hay que mover las posiciones relativas de las variables del scope
        body.add_expr(ReserveSTACK(space))
        for key in scope.keys():
            if isinstance(scope[key], list):
                scope[key][0] +=space
                scope[key][1] +=space
            else:
                scope[key] += space

        #TODO hay que asignarle el self
        if _self is not None:
            body.add_expr(StoreLocal(name='self',pos= 0,value='$s2'))

        pos = 4
        for arg in arguments:
            DivExpression(arg,body,scope)
            temp = body.current_value()
            body.add_expr(StoreLocal(name=body.current_value(),pos= pos,value=body.current_value()))
            TempNames.free([temp])#libera el temporal que se uso para almacenar en los argumentos
            pos +=4
        
        # llama a ua funcion
        body.add_expr(CallMethod(label_method))

        #Aqui hay que recuperar el valor de los registros temporales. Para ello hay que liberar la pila de los argumentos con los que se llamo la funcion, luego de ello recueperar la posicion en pila de los temporales restando el desplaziento que se libero
        body.add_expr(FreeStack(space))
        for temp in used_temps:
            scope[temp] -= space
            #ademas asignar a los valores temporales el valor que se guardo en la pila:
            if temp[0] != '$':
                body.add_expr(CILAssign(temp[:6],CILCallLocal(temp[:6], scope.pop(temp)))) #esto toma el valor de la pila en la posicion que se encuentra el temp, el .pop elimina el elemento y devuelve el valor. Ya no son necesarios los temporales en la pila
            else:
                body.add_expr(CILAssign(temp[:3],CILCallLocal(temp[:3], scope.pop(temp)))) 


        #Como ya se recuperaron todos los teporales entonces se puede liberar ese espacio en la pila 
        if len(used_temps) >0:
            body.add_expr(FreeStack(len(used_temps)*4))
        #Cuando se libera la pila hay que mover las posiciones relativas del scoep que se habia modificado
        #como hubo dos movimientos de pila entonces tiene que recuperar la posicion despues de ambos movimientos len(parametros) + len(temporales guardados)
        for key in scope.keys():
            if isinstance(scope[key], list):
                scope[key][0] -= (space +len(used_temps)*4)
                scope[key][1] -= (space+len(used_temps)*4)
            else:
                scope[key] -= (space+ len(used_temps)*4)

        body.add_expr(FromA0())

    def goto_init(label:Label, body:Body, scope:dict = {}):
        #El caso de inicializar una instancia es un caso particular con comportamiento parecido al callable en mips. Solo que aqui solo se va a guardar en pila los temporales porque no se pasan argumentos

        #Es responsabilidad del invocador coservar los registros temporales, por tanto hay que guardarlos en la pila antes de invocar, asi que se guardan los temporales en la pila.
        used_temps = TempNames.used_temps()
        if len(used_temps) == 0:
            # llama a la funcion
            body.add_expr(CallMethod(label))
        else:
            body.add_expr(ReserveSTACK(len(used_temps)*4)) #Reserva pila para los registros temporales en uso

            for i in range(len(used_temps)):
                #si hay varios llamados dentro de otro que usa el mismo id de temporal, entonces hay que cambiar el key
                while used_temps[i] in scope:
                    used_temps[i] = used_temps[i]+'0'

            #Cuando se reserva pila hay que mover las posiciones relativas de las variables del scope
            for key in scope.keys():
                if isinstance(scope[key], list):
                    scope[key][0] +=len(used_temps)*4
                    scope[key][1] +=len(used_temps)*4
                else:
                    scope[key] += len(used_temps)*4

            #primero se mueve las posiciones de lo que hay en la pila y luego se agregan los tmporales
            p = 0
            for temp in used_temps:
                scope[temp] = p
                if temp[0] != '$':
                    body.add_expr(StoreLocal(name=temp,pos= p,value=temp[:6]))
                else:
                    body.add_expr(StoreLocal(name=temp,pos= p,value=temp[:3]))
                p+=4        

            # llama a la funcion
            body.add_expr(CallMethod(label))

            #Aqui hay que recuperar el valor de los registros temporales.
            for temp in used_temps:
                #asignar a los valores temporales el valor que se guardo en la pila
                if temp[0] != '$':
                    body.add_expr(CILAssign(temp[:6],CILCallLocal(temp[:6], scope.pop(temp)))) #esto toma el valor de la pila en la posicion que se encuentra el temp, el .pop elimina el elemento y devuelve el valor. Ya no son necesarios los temporales en la pila
                else:    
                    body.add_expr(CILAssign(temp[:3],CILCallLocal(temp[:3], scope.pop(temp))))

            #Como ya se recuperaron todos los teporales entonces se puede liberar ese espacio en la pila 
            body.add_expr(FreeStack(len(used_temps)*4))

            #Cuando se libera la pila hay que correr las posiciones del scope a las oficiales
            for key in scope.keys():
                if isinstance(scope[key], list):
                    scope[key][0] -= (len(used_temps)*4)
                    scope[key][1] -= (len(used_temps)*4)
                else:
                    scope[key] -= (len(used_temps)*4)
        # body.add_expr(FromA0())