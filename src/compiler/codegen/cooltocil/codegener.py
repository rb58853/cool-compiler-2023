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
