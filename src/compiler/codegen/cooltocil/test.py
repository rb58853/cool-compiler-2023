import unittest
from codegener import CILProgram, CILType, CILMethod, CILAttribute, CILConstant, CILArithmeticOp, CILAssign, CILIf, CILExpression, CILLogicalOp, CILAllocate, CILBlock, CILFree, CILWhile, CILCall

class TestCILAST(unittest.TestCase):

    def test_cil_ast_creation(self):
        # Cree un programa CIL
        program = CILProgram()

        # Cree una clase CIL y añadirla al programa
        cil_class = CILType("MyClass")
        program.add_type(cil_class)

        # Cree un método y un atributo y añadirlos a la clase
        method = CILMethod("my_method")
        attribute = CILAttribute("my_attribute")
        cil_class.add_method(method)
        cil_class.add_attribute(attribute)

        # Cree una constante y añadirla al método
        constant = CILConstant(42)
        method.body.append(constant)

        # Comprueba la estructura del AST
        self.assertEqual(program.types[0], cil_class)
        self.assertEqual(cil_class.methods[0], method)
        self.assertEqual(cil_class.attributes[0], attribute)
        self.assertEqual(method.body[0], constant)

    def test_cil_expression(self):
        expr = CILExpression()
        self.assertIsNotNone(expr)

    def test_cil_assign(self):
        assign = CILAssign("x", CILExpression())
        self.assertEqual(assign.dest, "x")

    def test_cil_arithmetic_op(self):
        left_expr = CILExpression()
        right_expr = CILExpression()
        arith_op = CILArithmeticOp(left_expr, right_expr, "+")
        self.assertEqual(arith_op.operation, "+")

    def test_cil_logical_op(self):
        left_expr = CILExpression()
        right_expr = CILExpression()
        logical_op = CILLogicalOp("and", left_expr, right_expr)
        self.assertEqual(logical_op.operation, "and")

    def test_cil_if(self):
        condition = CILExpression()
        then_body = [CILExpression()]
        else_body = [CILExpression()]
        cil_if = CILIf(condition, then_body, else_body)
        self.assertIsNotNone(cil_if.condition)

    def test_cil_while(self):
        """ Prueba para la clase CILWhile. """
        condition = CILExpression()  
        body = [CILExpression()]     
        cil_while = CILWhile(condition, body)
        self.assertEqual(cil_while.condition, condition)
        self.assertEqual(len(cil_while.body), 1)

    def test_cil_call(self):
        """ Prueba para la clase CILCall. """
        instance = CILExpression()  # Usamos una expr gener
        method = "my_method"
        arguments = [CILExpression()]  
        cil_call = CILCall(instance, method, arguments)
        self.assertEqual(cil_call.instance, instance)
        self.assertEqual(cil_call.method, method)
        self.assertEqual(len(cil_call.arguments), 1)

    def test_cil_allocate(self):
        """ Prueba para la clase CILAllocate. """
        allocate = CILAllocate("MyClass")
        self.assertEqual(allocate.type_name, "MyClass")

    def test_cil_free(self):
        """ Prueba para la clase CILFree. """
        instance = CILConstant(42)  
        free = CILFree(instance)
        self.assertEqual(free.instance, instance)

    def test_cil_block(self):
        """ Prueba para la clase CILBlock. """
        instructions = [CILConstant(42), CILConstant(43)]
        block = CILBlock(instructions)
        self.assertEqual(len(block.instructions), 2)
        self.assertIsInstance(block.instructions[0], CILConstant)
        self.assertIsInstance(block.instructions[1], CILConstant)

if __name__ == '__main__':
    unittest.main()