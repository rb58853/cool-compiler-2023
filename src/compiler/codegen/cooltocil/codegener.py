class CILNode:
    """
    Clase base para todos los nodos
    """

    def __init__(self):
        self.line = 0  

    def accept(self, visitor):
        """
        Método para aceptar un visitante
        """
        return visitor.visit(self)

class CILProgram(CILNode):
    def __init__(self):
        super().__init__()
        self.types = []  # Lista de CILType

    def add_type(self, cil_type):
        self.types.append(cil_type)

class CILType(CILNode):
    def __init__(self, name):
        super().__init__()
        self.name = name
        self.methods = []  # Lista de CILMethod
        self.attributes = []  # Lista de CILAttribute

    def add_method(self, method):
        self.methods.append(method)

    def add_attribute(self, attribute):
        self.attributes.append(attribute)

class CILMethod(CILNode):
    def __init__(self, name):
        super().__init__()
        self.name = name
        self.body = []  # Lista de CILNode, representa el cuerpo del método

class CILAttribute(CILNode):
    def __init__(self, name):
        super().__init__()
        self.name = name

class CILConstant(CILNode):
    def __init__(self, value):
        super().__init__()
        self.value = value


class CILExpression(CILNode):

    _id_counter = 0  # Contador para generar identificadores

    def __init__(self):
        super().__init__()
        self.id = f"expr{CILExpression._id_counter}"  
        CILExpression._id_counter += 1

    def get_id(self):
        return self.id

class CILAssign(CILExpression):

    def __init__(self, dest, source):
        super().__init__()
        self.dest = dest      # Vrle a la que se asigna el valor
        self.source = source  # Expresin que se asigna a la variable

    def __str__(self):
        return f"{self.dest} = {self.source.get_id()};"


class CILArithmeticOp(CILExpression):
    def __init__(self, left, right, operation):
        super().__init__()
        self.left = left       # lado izquierdo
        self.right = right     # lado derecho
        self.operation = operation  #('+', '-', '*', '/')

    def __str__(self):
        return f"{self.get_id()} = {self.left.get_id()} {self.operation} {self.right.get_id()};"


class CILLogicalOp(CILExpression):
  
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

class CILIf(CILExpression):

    def __init__(self, condition, then_body, else_body=None):
        super().__init__()
        self.condition = condition  # Expresión de condición
        self.then_body = then_body  # Lista de CILNode para el cuerpo del then
        self.else_body = else_body  # """"""""""""""""""""""""""""""""""  else 

    def __str__(self):
        then_str = " ".join(str(node) for node in self.then_body)
        else_str = " ".join(str(node) for node in self.else_body) if self.else_body else ""
        return f"if {self.condition.get_id()} then {then_str} else {else_str} fi"
