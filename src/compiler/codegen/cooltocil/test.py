import unittest
from compiler.codegen.cooltocil.codegener import CILNode, CILProgram, CILType, CILMethod, CILAttribute, CILConstant
class TestCILAST(unittest.TestCase):

    def test_cil_ast_creation(self):
        # Cree un programa CIL
        program = CILProgram()

        # Cree una clase CIL y añadirla al programa
        cil_class = CILType("MyClass")
        program.add_type(cil_class)

        # Cree un mtodo y un atributo y añadirlos a la clase
        method = CILMethod("my_method")
        attribute = CILAttribute("my_attribute")
        cil_class.add_method(method)
        cil_class.add_attribute(attribute)

        # Cree una constante
        constant = CILConstant(42)
        method.body.append(constant)

        # Comprueba la estructura del AST
        self.assertEqual(program.types[0], cil_class)
        self.assertEqual(cil_class.methods[0], method)
        self.assertEqual(cil_class.attributes[0], attribute)
        self.assertEqual(method.body[0], constant)

if __name__ == '__main__':
    unittest.main()
