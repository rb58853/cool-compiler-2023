from AST.ast import CoolProgram

def init_types(program:CoolProgram):
    init_classes(program)
    init_features(program)

def init_classes(program:CoolProgram):
    for child in program.childs():
        child.validate()
    
    for child in program.childs():
        child.set_inherits()

def init_features(program:CoolProgram):
    for cclass in program.childs():
        for feature in cclass.childs():
            feature.validate()