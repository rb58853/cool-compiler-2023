import AST.environment as env
from AST.ast import CoolProgram, CoolClass, Feature, expr, IntNode, CoolBool, CoolString, CoolLet, ArithmeticOP,Logicar,Assign, CoolID, Context, Dispatch, CoolCase, CoolWhile, CoolIf, CoolBlockScope, CoolCallable, CoolNew

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

#esto es para usar operaciones con valores inmediatos, por ejemplo addi $s0, $1, 5 . Las constantes solo admiten 16 bytes. Valor default = False
USE_i = True

TYPE_LENGTH= {'Int':4, 'Bool':4, 'String':32,}
TYPE_ATRS = {}

class TempNames:
    used_id = [False, False,False, False, False, False, False, False, False]
    def get_name():
        for i in range(len(TempNames.used_id)):
            if not TempNames.used_id[i]:
                TempNames.used_id[i]= True
                return f"expr_{i}"
        else:    
            TempNames.used_id.append(True)
            return f"expr_{len(TempNames.used_id)-1}"
    
    def free(names:list):
        for name in names:
            id = int(name[5:])
            TempNames.used_id[id] = False

class NameTempExpression:
    id = -1  # Contador para generar identificadores
    def get_name():
        NameTempExpression.id+=1
        return f"expr_{NameTempExpression.id}"

class NameLabel:
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

    def add_tab_lv(self):
        self.tab_lv+=1    

class CILVoid(CILExpr):
    def __init__(self) -> None:
        super().__init__()
        self.return_void = True
        self.use_in_code_line = False

class CILLabel(CILExpr):
    def __init__(self, name_label) -> None:
        super().__init__()
        self.name = name_label

    def __str__(self) -> str:
        return f"{Fore.MAGENTA}LABEL {self.name}{Fore.WHITE}"
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

class CILProgram():
    def __init__(self, program:CoolProgram):
        super().__init__()
        self.types:dict[str,CILType] = {}  # Lista de CILType
        self.methods:list[CILMethod] = []
        self.set_types(program)
        self.generate_methods(program)

    def set_types(self, program:CoolProgram):
        for cclass in program.classes:
            if not cclass.type in env.base_classes:
                self.types[cclass.type]=CILType(cclass)

    def __str__(self) -> str:
        result = ".TYPES\n\n"
        for type in self.types.values():
            result+= str(type)
        result += ".TEXT\n\n"
        for meth in self.methods:
            result+= str(meth)
        return result
    
    def generate_methods(self, cool_program:CoolProgram):
        for cclass in cool_program.classes:
            if not cclass.type in env.base_classes:
                for feature in cclass.features:
                    if isinstance(feature,Feature.CoolDef):
                        self.methods.append(CILMethod(feature, self))
    
class CILType():
    def __init__(self, cclass:CoolClass):
        self.name = cclass.type
        self.methods:list[CILId] = []  # Lista de CILMethod
        self.attributes:list[CILVar] = []  # Lista de CILAttribute
        self.space = self.get_all_from(cclass)
        self.atrs = {}
        TYPE_ATRS[self.name] = self.atrs

    def get_all_from(self, cclass:CoolClass):
        self.process_class(cclass)
        return self.set_space()

    def set_space(self):
        result = 0
        for atr in self.attributes:
            result += atr.space
            
        # for met in self.methods:
        #     result += met.space
        TYPE_LENGTH[self.name] = result
    
    def process_class(self,cclass:CoolClass):
        if cclass.type != env.object_type_name:
            self.process_class(cclass.inherit_class)

        for feature in cclass.features:
            space = 0
            if isinstance(feature,Feature.CoolAtr):
                self.atrs[feature.ID.id] = space 
                if feature.get_type == env.string_type_name:
                    self.attributes.append(CILVar(f'{self.name}_{feature.ID.id}', value=feature.value,space=32))
                    space += 32
                else:
                    self.attributes.append(CILVar(f'{self.name}_{feature.ID.id}', value=feature.value,space=4))
                    space += 4
            else:    
                self.methods.append(CILId(f'{self.name}_{feature.ID.id}')) #Esto apunta a una dirccion de memoria y su tamanno siempre es 4 bytes
    
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
        self.set_vars(cool_meth, cil_program)
        self.set_body(cool_meth)
    
    def set_vars(self, cool_meth:Feature.CoolDef, cil_program:CILProgram):
        for local in cil_program.types[cool_meth.father.type].attributes:
            self.locals.append(local)
        for param in cool_meth.params.childs():
            self.params.append(param)
        
    def set_body(self, cool_meth:Feature.CoolDef):    
        body = Body()
        DivExpression(cool_meth.scope, body)
        self.body = [e for e in body.expressions if e.use_in_code_line]
        self.body.append(CILReturn(body.return_value()))

    def __str__(self) -> str:
        result = f'\n.method {self.name}'+' {\n'
        for local in self.locals:
            result+= f'\tLocal {local};\n'
        for param in self.params:
            result+= f'\tParam {param};\n'
        for e in self.body:
            if isinstance (e,CILCommet):
                result+= f'\t{e}\n'
            else:
                result+= f'\t{e};\n'
        return result +'}\n'

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

class CILIf(CILExpr):
    def __init__(self, condition, else_label):
        super().__init__()
        self.condition = condition
        self.else_label = else_label 
        # self.then_label = then_label

    def __str__(self):
        return f'if not {self.condition} GOTO {Fore.MAGENTA}{self.else_label}{Fore.WHITE}'
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

class CILCallAtr(CILExpr):
    def __init__(self, id:CoolID) -> None:
        super().__init__()
        self.name = id.id
    def __str__(self) -> str:
        return f'GETATTR {self.name}'
    
    def __repr__(self) -> str:
        return self.__str__()
    
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

    def __str__(self) -> str:
        result = Fore.GREEN + self.text + Fore.WHITE
        return result
    def __repr__(self) -> str:
        return str(self)

class GOTO(CILExpr):
    def __init__(self, label) -> None:
        super().__init__()
        self.label = label
        self.return_void = True
    def __str__(self) -> str:
        return f"GOTO {Fore.YELLOW}{self.label}{Fore.WHITE}"    
    def __repr__(self) -> str:
        return self.__str__()

################################################## PROCESADOR DE COOL ###########################################################
class Body:
    def __init__(self) -> None:
        self.expressions:list[CILExpr] = []
    
    def add_expr(self, e:CILExpr):
        self.expressions.append(e)
    
    def current(self):
        index = 1
        for i in range(len(self.expressions)-1, -1,-1):
            if isinstance(self.expressions[i], CILCommet):
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
    def atr(e): return IsType.id(e) and e.is_atr()
    def int(e): return isinstance(e, IntNode)
    def string(e): return isinstance(e, CoolString)
    def bool(e): return isinstance(e, CoolBool)
    def id(e): return isinstance(e, CoolID)
    def simple_id(e): return IsType.id(e) and not IsType.atr(e)
    def arithmetic(e): return isinstance(e, ArithmeticOP)
    def logical(e): return isinstance(e, Logicar)
    def let(e): return isinstance(e, CoolLet)
    def block(e): return isinstance(e, CoolBlockScope)
    def assign(e): return isinstance(e, Assign)
    def dispatch(e): return isinstance(e, Dispatch)
    def new(e): return isinstance(e, CoolNew)
    def _if(e): return isinstance(e, CoolIf)
    def _while(e): return isinstance(e, CoolWhile)

class DivExpression:
    def __init__ (self, e:expr, body:Body):
        if IsType.arithmetic(e):
            DivExpression.arithmetic(e, body)
        if IsType.logical(e):
            DivExpression.logical(e, body)
        if IsType.atr(e):
            DivExpression.atr(e,body) 
        if IsType.id(e):
            DivExpression.id_value(e,body) 
        if IsType.let(e):
            DivExpression.let(e,body)
        if IsType.block(e):
            DivExpression.block(e,body)
        if IsType.assign(e):
            DivExpression.assing(e,body)
        if IsType.dispatch(e):
            DivExpression.dispatch(e,body)    
        if IsType.new(e):
            DivExpression.new(e,body)    
        if IsType._if(e):
            DivExpression._if(e,body)
        if IsType._while(e):
            DivExpression._while(e,body)
        if IsType.int(e):
            DivExpression.int(e,body)    

    def arithmetic(aritmetic: ArithmeticOP, body:Body, scope:dict[str:int] = {}):
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
            DivExpression(aritmetic.right,body)
            rigth_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILArithmeticOp(rigth_value,aritmetic.left,aritmetic.op, constant=True)))
            TempNames.free([rigth_value])
            # body.add_expr(CILAssign(TempNames.get_name(),CILArithmeticOp(aritmetic.left,body.current_value(),aritmetic.op)))
        # elif (isinstance(aritmetic.right, IntNode) or right_is_id_and_not_atr):
        elif (isinstance(aritmetic.right, IntNode))and not mult_div and USE_i:
            DivExpression(aritmetic.left,body)
            left_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILArithmeticOp(body.current_value(),aritmetic.right,aritmetic.op, constant=True)))
            TempNames.free([ left_value])
        else:
            DivExpression(aritmetic.left,body)
            left_value = body.current_value()
            DivExpression(aritmetic.right,body)
            rigth_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILArithmeticOp(left_value,rigth_value,aritmetic.op)))
            #cuando yo termino una operacion aritmetica, yo puedo volver a utilizar los variables donde no guarde el resultado, dado la naturaleza del codigo recursivo que va desde hijos a padres, solo me interesa conservar la varable donde se asigno el valor de la operacion. Luego las variables que use en el cuerpo de la operacion no las necesito, por lo tanto pueden volver a usarse.
            TempNames.free([left_value,rigth_value])
    
    def logical(logicar:Logicar, body:Body, scope:dict[str:int] = {}):
        if logicar.op != '=':
            DivExpression.logicar_not_eq(logicar, body)
        else:
            pass
            
    def logicar_not_eq(logicar:Logicar, body:Body, scope:dict[str:int] = {}):
        lefth_is_id_and_not_atr = IsType.id(logicar.left) and not logicar.left.is_atr()
        right_is_id_and_not_atr = IsType.id(logicar.right) and not logicar.right.is_atr()

        # if (IsType.int(logicar.left) or lefth_is_id_and_not_atr)  and (IsType.int(logicar.right) or right_is_id_and_not_atr ):
        if (IsType.int(logicar.left)) and (IsType.int(logicar.right)):
            body.add_expr(CILAssign(TempNames.get_name(),logicar.left))
            left_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),logicar.right))
            rigth_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILLogicalOP(left_value,rigth_value, logicar.op)))
            TempNames.free([left_value,rigth_value])

        elif isinstance(logicar.left, IntNode) or lefth_is_id_and_not_atr:
            body.add_expr(CILAssign(TempNames.get_name(),logicar.left))
            left_value = body.current_value()
            DivExpression(logicar.right,body)
            rigth_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILLogicalOP(left_value,rigth_value,logicar.op)))
            TempNames.free([left_value,rigth_value])
        
        elif isinstance(logicar.right, IntNode) or right_is_id_and_not_atr:
            body.add_expr(CILAssign(TempNames.get_name(),logicar.right))
            rigth_value = body.current_value()
            DivExpression(logicar.left,body)
            left_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILLogicalOP(body.current_value(),rigth_value,logicar.op)))
            TempNames.free([left_value,rigth_value])
        else:
            DivExpression(logicar.left,body)
            left_value = body.current_value()
            DivExpression(logicar.right,body)
            rigth_value = body.current_value()
            body.add_expr(CILAssign(TempNames.get_name(),CILLogicalOP(left_value,rigth_value,logicar.op)))
            TempNames.free([left_value,rigth_value])
    
    def int(_int:IntNode, body:Body, scope:dict[str:int] = {}):
        body.add_expr(CILAssign(TempNames.get_name(),_int))

    def atr(id:CoolID, body:Body, scope:dict[str:int] = {}):
        body.add_expr(CILAssign(TempNames.get_name(),CILCallAtr(id)))
    
    def let(let:CoolLet, body:Body, scope:dict[str:int] = {}):
        color = get_color()
        body.add_expr(CILCommet(f'{color}#Region Let'))
        
        let_scope:dict[str:int]= {}
        for var in scope.keys():
            let_scope[var] = scope[var] #esto toma el scope suerior y en caso de tener que sobreescrbir variables se hace debajo
        pos = 0
        length = 0
        
        for vvar in let.let:
            length += TYPE_LENGTH[vvar.get_type()]
        #TODO Reservar espacio en la pila para un tamanno = length
            
        for vvar in let.let:
            let_scope[vvar.id] = pos
            pos += TYPE_LENGTH[vvar.get_type()]
            if vvar.value is not None:
                if IsType.simple_type(vvar.value):
                    body.add_expr(CILAssign(vvar.id,vvar.value,is_temp=False))
                else:
                    DivExpression(vvar.value, body, scope = let_scope)
                    body.add_expr(CILAssign(vvar.id,body.current_value(),is_temp=False))
            else:
                pass #este es el caso de una instancia de clase, hay que analizarlo
        
        DivExpression(let.in_scope, body, scope = let_scope)        
        body.add_expr(CILCommet(f'{color}#End Region Let'))

    def assing(assign: Assign, body:Body, scope:dict[str:int] = {}):
        if IsType.simple_type(assign.right):
            body.add_expr(CILAssign(assign.left.id,assign.right,is_temp=False))
        else:
            DivExpression(assign.right, body)
            body.add_expr(CILAssign(assign.left.id,body.current_value(),is_temp=False))
    
    def block(block:CoolBlockScope, body:Body, scope:dict[str:int] = {}):
        for e in block.exprs:
            DivExpression(e,body)

    def id_value(e:CoolID,body, scope:dict[str:int] = {}):
        # if in_params(e):
            #tratarlo como parametro
            # pass
        body.add_expr(CILAssign(TempNames.get_name(),e.id))
        # body.add_expr(CILId(e.id))

    def new(e:CoolID, body, scope:dict[str:int] = {}):
        body.add_expr(CILAssign(TempNames.get_name,e))
        
    def dispatch(dispatch:Dispatch, body:Body, scope:dict[str:int] = {}):
        callable:CoolCallable = dispatch.function
        type = dispatch.type
        body.add_expr(CILCall(type, callable.id.id,callable.params))
        pass
    
    def case(case:CoolCase, scope:dict[str:int] = {}):
        pass

    def _while(_while:CoolWhile, body:Body, scope:dict[str:int] = {}):
        loop = NameLabel('loop').get()
        condition = _while.condition
        scope = _while.loop_scope
        end_while = NameLabel('end_while').get()
        
        body.add_expr(CILLabel(loop)) #Todos los cambios de la condiciona tienen que volverse a pocesar

        if IsType.bool(condition):
            if condition:
                body.add_expr(CILIf(IntNode(1),else_label=end_while))
            else:
                body.add_expr(CILIf(IntNode(0),else_label=end_while))
        else:
            DivExpression(condition,body)
            # temp = body.expressions.pop()
            # body.add_expr(temp)

            body.add_expr(CILIf(body.current_value(),else_label=end_while))

        DivExpression(scope,body)
        body.add_expr(CILLabel(loop))
        body.add_expr(CILLabel(end_while))
        body.add_expr(CILVoid()) #esto sirve para que se sepa que si el valor de retorno de la funcion es el while, entonces es tipo void

    def _if (_if:CoolIf, body:Body, scope:dict[str:int] = {}):
        condition = _if.condition
        then_s = _if.then_scope
        else_s = _if.else_scope
        label = NameLabel('else').get()
        label_end = NameLabel('endif').get()
        result_expr = TempNames.get_name()

        if IsType.bool(condition):
            if condition:
                body.add_expr(CILIf(IntNode(1),else_label=label))
            else:
                body.add_expr(CILIf(IntNode(0),else_label=label))
        else:
            DivExpression(condition,body)
            body.add_expr(CILIf(body.current_value(),else_label=label))

        DivExpression(then_s,body)
        body.add_expr(CILAssign(result_expr,body.current_value()))
        # then_return = body.current_value()
        body.add_expr(GOTO(label_end))
        body.add_expr(CILLabel(label))
        DivExpression(else_s,body)
        body.add_expr(CILAssign(result_expr,body.current_value()))
        body.add_expr(CILLabel(label_end))
        body.add_expr(CILId(result_expr))