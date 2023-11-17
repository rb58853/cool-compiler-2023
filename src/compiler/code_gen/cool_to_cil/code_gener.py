from ...AST.ast import BinOp, CoolIf, CoolWhile, IntNode
#tester
try:
    # Intenta crear una instancia o realizar alguna operación
    test_node = BinOp("+", IntNode(1), IntNode(2))
    print("Instancia de BinOp creada:", test_node)
    # Agrega más pruebas si es necesario
    print("Las importaciones parecen estar funcionando correctamente.")
except Exception as e:
    print("Hubo un error al importar o utilizar las clases de AST:", e)

# func de generacion de codigo para cada tipo de nodo
def generate_code_for_binop(node):
    left_code = generate_code(node.left)
    right_code = generate_code(node.right)
    return f"({left_code} {node.op} {right_code})"

def generate_code_for_coolif(node):
    condition_code = generate_code(node.condition)
    then_code = generate_code(node.then_generation)
    else_code = generate_code(node.else_generation) if node.else_generation else "nop"
    return f"if {condition_code} then {then_code} else {else_code}"

def generate_code_for_coolwhile(node):
    condition_code = generate_code(node.condition)
    loop_code = generate_code(node.loop_scope)
    return f"while {condition_code} do {loop_code}"

def generate_code_for_int(node):
    return str(node.value)


#.
#.
#.


# Funcion general para la generacion de codigo
def generate_code(node):
    if isinstance(node, BinOp):
        return generate_code_for_binop(node)
    elif isinstance(node, CoolIf):
        return generate_code_for_coolif(node)
    elif isinstance(node, CoolWhile):
        return generate_code_for_coolwhile(node)
    elif isinstance(node, IntNode):
        return generate_code_for_int(node)
   
    else:
        raise NotImplementedError(f"Generacion de codigo no implementada para el nodo: {type(node)}")
