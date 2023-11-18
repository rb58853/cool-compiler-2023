from AST.ast import CoolProgram

def set_classes_context(program:CoolProgram):
    for child in program.childs():
        child.validate()

# def bfs_set_context(program:CoolProgram):
#     for child in program.childs()