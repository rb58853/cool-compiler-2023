#region cool
from compiler.parser.cool_parser import CoolLexer, CoolParser
from compiler.AST.ast import CoolProgram
from compiler.semantic.semantic_ import semantic
from compiler.semantic.semantic_visitor import init_classes, init_types, validate_program
from compiler.codegen.cool2cil.codegener import CILProgram
import os

def cil_program(file):
    dir = os.path.join(os.getcwd(), f"src/compiler/codegen/cil2mips/examples/{file}.cl")
    with open(dir, "r") as f:
            code = f.read()
    lexer = CoolLexer()
    tokens = lexer.tokenize(code)
    if len(lexer.errors)>0: raise Exception(str(lexer.errors(0)))
    parser = CoolParser(lexer = lexer)
    cool_program = parser.parse(tokens)
    if len(parser.errors)>0:raise Exception(str(parser.errors[0]))
    validate_program(cool_program)
    if len(semantic.errors) > 0: raise Exception(str(semantic.errors[0]))
#endregion
    

    cil_program = CILProgram(cool_program)
    return cil_program