#region cool
from parser.cool_parser import CoolLexer, CoolParser
from AST.ast import CoolProgram
from semantic.semantic_ import semantic
from semantic.semantic_visitor import init_classes, init_types, validate_program
import os

dir = os.path.join(os.getcwd(), "src/compiler/codegen/cool2cil/code.cl")
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

from codegen.cool2cil.codegener import CILProgram

def cil_program():
    cil_program = CILProgram(cool_program)
    return cil_program