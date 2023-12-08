from compiler.parser.cool_parser import CoolLexer, CoolParser
from compiler.semantic.semantic_ import semantic
from compiler.semantic.semantic_visitor import validate_program
import os
import sys

INPUT_FILE = f'{sys.argv[1]}'
OUTPUT_FILE = f'{sys.argv[2]}'
# INPUT_FILE = os.path.join(os.getcwd(), "tests/lexer/iis1.cl")

with open(INPUT_FILE, "r", encoding="utf-8") as f:  # Agregado encoding="utf-8"
    code = f.read()

lexer = CoolLexer()
tokens = []
for t in lexer.tokenize(code):
    tokens.append(t)

if len(lexer.errors)>0:
    for e in lexer.errors:
        print(e)
        exit(1)
else:
    parser = CoolParser(lexer = lexer)
    program = parser.parse(tokens)
    if len(parser.errors)>0:
        for e in parser.errors:
            print(e)
        exit(1)
    else:
        validate_program(program)
        if len(semantic.errors) > 0:
            for e in semantic.errors:
                print(e)
            exit(1)
        else:
            exit(0)    
