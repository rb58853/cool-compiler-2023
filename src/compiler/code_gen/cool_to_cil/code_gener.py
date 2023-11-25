# Importa las clases necesarias de tu AST
from AST.ast import CoolClass, Assign, Feature, BinOp, CoolVar, CoolWhile, CoolProgram


def generate_type_hierarchy(program):
    types_section = ".TYPES\n"
    for cclass in program.classes:
        types_section += f"type {cclass.type} {{\n"
        for feature in cclass.features:
            if isinstance(feature, Feature.CoolAtr):
                types_section += f"    attribute {feature.id};\n"
            elif isinstance(feature, Feature.CoolDef):
                types_section += f"    method {feature.ID.id} : {feature.ID.id}_method;\n"
        types_section += "}\n\n"
    return types_section

# Variables globales para llevar la cuenta de los identificadores y etiquetas nicos
unique_id_counter = 0
unique_label_counter = 0

def some_unique_id_generator():
    global unique_id_counter
    unique_id_counter += 1
    return unique_id_counter

def some_unique_label_generator():
    global unique_label_counter
    unique_label_counter += 1
    return unique_label_counter

# para crear variables temporales y etiquetas
def create_new_temp_var():
    # Incrementa un contador o genera un nombre unico para una nueva variable temporal
    return "temp_" + str(some_unique_id_generator())

def create_new_label():
    return "label_" + str(some_unique_label_generator())


# operaciones binarias
def generate_code_binop(binop_node: BinOp):
    left_code = generate_code(binop_node.left) # Genera el codigo para el lado izquierdo
    right_code = generate_code(binop_node.right) # Genera el codigo para el lado derecho
    result_var = create_new_temp_var() # varlbe temporal para almacenar el resultado

    operation_code = f"{result_var} = {left_code} {binop_node.op} {right_code};\n"
    return operation_code

def generate_code_assign(assign_node: Assign):
    right_code = generate_code(assign_node.right)
    return f"{assign_node.left.id} = {right_code};\n"

def generate_code_coolvar(var_node: CoolVar):
    if hasattr(var_node, 'is_definition') and var_node.is_definition:
        return f"LOCAL {var_node.id};\n"
    else:
        return var_node.id


# CoolWhile
def generate_code_coolwhile(while_node):
    condition_code = generate_code(while_node.condition)
    body_code = generate_code(while_node.body)
    start_label = create_new_label()
    end_label = create_new_label()

    code = f"LABEL {start_label};\n"
    code += f"{condition_code}\n"
    code += f"IF {condition_code} GOTO {end_label};\n"
    code += f"{body_code}\n"
    code += f"GOTO {start_label};\n"
    code += f"LABEL {end_label};\n"
    return code



def generate_cil_code(program: CoolProgram):
    cil_code = generate_type_hierarchy(program)  # Genera jerarquia de tipos
    cil_code += ".CODE\n"  

    for cclass in program.classes:
        for feature in cclass.features:
            if isinstance(feature, Feature.CoolDef):  # Solo mtodos
                cil_code += generate_method_code(feature, cclass)

    return cil_code

def generate_method_code(method, cclass):
    method_code = f"function {cclass.type}_{method.ID.id} {{\n"
    method_code += generate_code(method.scope)  # cuerpo del método
    method_code += "}\n\n"
    return method_code

def generate_code(node):
    if isinstance(node, BinOp):
        return generate_code_binop(node)
    elif isinstance(node, CoolVar):
        return generate_code_coolvar(node)
    elif isinstance(node, Assign):
        return generate_code_assign(node)
    else:
        return ""
