import AST.environment as env
from AST.ast import CoolProgram, CoolClass, Feature, expr, IntNode, CoolBool, CoolString, CoolLet, ArithmeticOP,Logicar,Assign, CoolID, Context, Dispatch, CoolCase, CoolWhile, CoolIf, CoolBlockScope, CoolCallable, CoolNew

import colorama
from colorama import Fore
colorama.init()

class CILExpr():
    def __init__(self) -> None:
        self.use_in_code_line = True
        self.tab_lv = 0
        self.return_void = False

    def add_tab_lv(self):
        self.tab_lv+=1    

class CILId(CILExpr):
    def __init__(self, name):#, space = 4) -> None:
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

    def get_all_from(self, cclass:CoolClass):
        self.process_class(cclass)
        return self.set_space()

    def set_space(self):
        result = 0
        for atr in self.attributes:
            result += atr.space
        for met in self.methods:
            result += met.space
        return result
    
    def process_class(self,cclass:CoolClass):
        if cclass.type != env.object_type_name:
            self.process_class(cclass.inherit_class)

        for feature in cclass.features:
            if isinstance(feature,Feature.CoolAtr):
                self.attributes.append(CILVar(f'{self.name}_{feature.ID.id}', value=feature.value))
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
            self.set_body(cool_meth)
    
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

class NameTempExpression:
    id = -1  # Contador para generar identificadores
    def get_name():
        NameTempExpression.id+=1
        return f"expr_{NameTempExpression.id}"

class CILAssign(CILExpr):
    def __init__(self, dest:str, source):
        super().__init__()
        self.dest:CILVar = CILVar(dest)      # Vrle a la que se asigna el valor
        self.source:CILExpr = source  # Expresin que se asigna a la variable

    def __str__(self):
        return f"{self.dest} = {self.source}"
    def __repr__(self) -> str:
        return self.__str__()

class CILArithmeticOp(CILExpr):
    def __init__(self, left, right, operation):
        super().__init__()
        self.left = left       # lado izquierdo
        self.right = right     # lado derecho
        self.operation = operation  #('+', '-', '*', '/')

    def __str__(self):
        return f"{self.left} {self.operation} {self.right}"
    def __repr__(self) -> str:
        return self.__str__()
    
class CILLogicalOP(CILExpr):
  
    def __init__(self, operation, left, right=None):
        super().__init__()
        self.operation = operation  # ('and', 'or', 'not')
        self.left = left   
        self.right = right

    def __str__(self):
        if self.right is not None:
            return f"{self.get_id()} = {self.left.get_id()} {self.operation} {self.right.get_id()};"
        else:
            return f"{self.get_id()} = {self.operation} {self.left.get_id()};"

class CILIf(CILExpr):

    def __init__(self, condition, then_body, else_body=None):
        super().__init__()
        self.condition = condition  # Expresión de condición
        self.then_body = then_body  # Lista de CILExpr para el cuerpo del then
        self.else_body = else_body  # """"""""""""""""""""""""""""""""""  else 

    def __str__(self):
        then_str = " ".join(str(node) for node in self.then_body)
        else_str = " ".join(str(node) for node in self.else_body) if self.else_body else ""
        return f"if {self.condition.get_id()} then {then_str} else {else_str} fi"

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
            return 0
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
    def let(e): return isinstance(e, CoolLet)
    def block(e): return isinstance(e, CoolBlockScope)
    def assign(e): return isinstance(e, Assign)
    def dispatch(e): return isinstance(e, Dispatch)
    def new(e): return isinstance(e, CoolNew)

class DivExpression:
    def __init__ (self, e:expr, body:Body):
        if IsType.arithmetic(e):
            DivExpression.arithmetic(e, body)
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

    def arithmetic(aritmetic: ArithmeticOP, body:Body):
        lefth_is_id_and_not_atr = IsType.id(aritmetic.left) and not aritmetic.left.is_atr()
        right_is_id_and_not_atr = IsType.id(aritmetic.right) and not aritmetic.right.is_atr()

        if (IsType.int(aritmetic.left) or lefth_is_id_and_not_atr)  and (IsType.int(aritmetic.right) or right_is_id_and_not_atr ):
            body.add_expr(CILAssign(NameTempExpression.get_name(),CILArithmeticOp(aritmetic.left,aritmetic.right, aritmetic.op)))
        elif isinstance(aritmetic.left, IntNode) or lefth_is_id_and_not_atr:
            DivExpression(aritmetic.right,body)
            body.add_expr(CILAssign(NameTempExpression.get_name(),CILArithmeticOp(aritmetic.left,body.current_value(),aritmetic.op)))
        elif isinstance(aritmetic.right, IntNode) or right_is_id_and_not_atr:
            DivExpression(aritmetic.left,body)
            body.add_expr(CILAssign(NameTempExpression.get_name(),CILArithmeticOp(body.current_value(),aritmetic.right,aritmetic.op)))
        else:
            DivExpression(aritmetic.left,body)
            temp_current = body.current_value()
            DivExpression(aritmetic.right,body)
            body.add_expr(CILAssign(NameTempExpression.get_name(),CILArithmeticOp(temp_current,body.current_value(),aritmetic.op)))
    
    def atr(id:CoolID, body:Body):
        body.add_expr(CILAssign(NameTempExpression.get_name(),CILCallAtr(id)))

    def let(let:CoolLet, body:Body):
        body.add_expr(CILCommet('#Region Let'))
        for vvar in let.let:
            if vvar.value is not None:
                if IsType.simple_type(vvar.value):
                    body.add_expr(CILAssign(vvar.id,vvar.value))
                else:
                    DivExpression(vvar.value, body)
                    body.add_expr(CILAssign(vvar.id,body.current_value()))
            else:
                pass #este es el caso de una instancia de clase, hay que analizarlo
        DivExpression(let.in_scope, body)        
        body.add_expr(CILCommet('#End Region Let'))

    def assing(assign: Assign, body:Body):
        if IsType.simple_type(assign.right):
            body.add_expr(CILAssign(assign.left.id,assign.right))
        else:
            DivExpression(assign.right, body)
            body.add_expr(CILAssign(assign.left.id,body.current_value()))
    
    def block(block:CoolBlockScope, body:Body):
        for e in block.exprs:
            DivExpression(e,body)

    def id_value(e:CoolID,body):
        body.add_expr(CILId(e.id))

    def new(e:CoolID, body):
        body.add_expr(CILAssign(NameTempExpression.get_name,e))
        
    def dispatch(dispatch:Dispatch, body:Body):
        callable:CoolCallable = dispatch.function
        type = dispatch.type
        body.add_expr(CILCall(type, callable.id.id,callable.params))
        pass
    
    def case(case:CoolCase):
        pass

    def _while(_while:CoolWhile):
        pass
    
    def _if (_if:CoolIf):
        pass