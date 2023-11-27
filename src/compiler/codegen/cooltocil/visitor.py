from codegener import CILType, CILMethod
class CoolToCILVisitor:
    def __init__(self):
        # Aquí puedes inicializar estructuras necesarias para el visitante
        pass

    def visit(self, node):
        method_name = 'visit_' + type(node).__name__
        visitor = getattr(self, method_name, self.generic_visit)
        return visitor(node)

    def generic_visit(self, node):# nodos no implementadks
        print(f"No visit_{type(node).__name__} method defined.")
        raise NotImplementedError


    def visit_CoolClass(self, cool_class_node):
        cil_class = CILType(name=cool_class_node.type)
        # miis
        for feature in cool_class_node.features:
            self.visit(feature)
        return cil_class

    def visit_CoolMethod(self, cool_method_node):
        # Transforma un método Cool a CIL
        cil_method = CILMethod(name=cool_method_node.name)
        # falta
        cil_method.body = self.visit(cool_method_node.body)
        return cil_method

    def visit_CoolVar(self, cool_var_node):
        # Transforma una variable Cool a CIL falt aimplementar visita
        pass

