from compiler.AST.ast import CoolProgram

def validate_program(program:CoolProgram):
    init_types(program)
    return program.validate()

def init_types(program:CoolProgram):
    '''Con esta funcion se inicializan todas las clases y fuciones del programa'''
    init_classes(program)
    init_features(program)

def init_classes(program:CoolProgram):
    for child in program.childs():
        child.initialize()
    
    for child in program.childs():
        child.set_inherits()

def init_features(program:CoolProgram):
    for cclass in program.childs():
        cclass.initialize_features()