import AST.environment as env
from AST.ast import CoolProgram, CoolClass, Feature, expr, IntNode, CoolBool, CoolString, CoolLet, ArithmeticOP,Logicar,Assign

def get_expr_type(e:expr):
    if isinstance(e,ArithmeticOP):
        pass

class CILVar:
    def __init__(self, name, space = 4) -> None:
        self.name = name
        self.space = space
    def __str__(self) -> str:
        return self.name
    def __repr__(self) -> str:
        return self.name


class CILExpr():
    pass

class CILProgram():
    def __init__(self, program:CoolProgram):
        super().__init__()
        self.types:list[CILType] = []  # Lista de CILType
        self.set_types(program)

    def set_types(self, program:CoolProgram):
        for cclass in program.classes:
            self.types.append(CILType(cclass))

    def __str__(self) -> str:
        result = "CIL PROGRAM\n\n"
        for type in self.types:
            result+= str(type)
        return result
    
class CILType():
    def __init__(self, cclass:CoolClass):
        self.name = cclass.type
        self.methods:list[CILVar] = []  # Lista de CILMethod
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
                self.attributes.append(CILVar(f'{self.name}_{feature.ID.id}'))
            else:    
                self.methods.append(CILVar(f'{self.name}_{feature.ID.id}')) #Esto apunta a una dirccion de memoria y su tamanno siempre es 4 bytes
    
    def __str__(self) -> str:
        result = f'\n{self.name}: \n'
        for atr in self.attributes:
            result+= f'\t{atr}\n'
        for met in self.methods:
            result+= f'\t{met}()\n'
        return result
    
class CILMethod():
    def __init__(self, cool_meth: Feature.CoolDef):
        super().__init__()
        self.name = f'{cool_meth.father.type}_{cool_meth.ID.id}'
        self.body:list[CILExpr] = []  # Lista de CILExpr, representa el cuerpo del método

class CILAttribute():
    def __init__(self, name):
        super().__init__()
        self.name = name

class CILConstant(CILExpr):
    def __init__(self, value):
        super().__init__()
        self.value = value


class TempExpression(CILExpr):

    _id_counter = 0  # Contador para generar identificadores

    def __init__(self):
        super().__init__()
        self.id = f"expr{TempExpression._id_counter}"  
        TempExpression._id_counter += 1

    def get_id(self):
        return self.id

class CILAssign(CILExpr):

    def __init__(self, dest, source):
        super().__init__()
        self.dest = dest      # Vrle a la que se asigna el valor
        self.source = source  # Expresin que se asigna a la variable

    def __str__(self):
        return f"{self.dest} = {self.source.get_id()};"


class CILArithmeticOp(CILExpr):
    def __init__(self, left, right, operation):
        super().__init__()
        self.left = left       # lado izquierdo
        self.right = right     # lado derecho
        self.operation = operation  #('+', '-', '*', '/')

    def __str__(self):
        return f"{self.get_id()} = {self.left.get_id()} {self.operation} {self.right.get_id()};"

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
