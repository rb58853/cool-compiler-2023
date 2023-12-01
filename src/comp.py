from compiler.parser.cool_parser import CoolLexer, CoolParser
from compiler.AST.ast import CoolProgram
from compiler.semantic.semantic_ import semantic, Semantic
from compiler.semantic.semantic_visitor import init_classes, init_types, validate_program
import os

INPUT_FILE = 'tests'
OUTPUT_FILE = ''


base_dir = os.getcwd()
base_url = os.path.join(base_dir, "tests/semantic/")

semantic.errors = []
case_error = case[:-3] + '_error.txt'
dir = '/'.join([base_url,case])
dir_error = '/'.join([base_url,case_error])
with open(dir, "r") as f:
    code = f.read()
with open(dir_error, "r") as f:
    error = f.read()
lexer = CoolLexer()
tokens = lexer.tokenize(code)
if len(lexer.errors)>0:
    raise Exception(lexer.errors)

parser = CoolParser(lexer = lexer)
program = parser.parse(tokens)
if len(parser.errors)>0:
    raise Exception(parser.errors)


validate_program(program)