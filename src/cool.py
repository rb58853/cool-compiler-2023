# from compiler.parser.cool_parser import CoolLexer, CoolParser
from compiler.lexer.cool_lexer import CoolLexer
# from compiler.semantic.semantic_ import semantic
# from compiler.semantic.semantic_visitor import validate_program
import os
import sys

import warnings
warnings.filterwarnings("ignore")



# INPUT_FILE = os.path.join(os.getcwd(), "tests/lexer/iis1.cl")
INPUT_FILE = f'{sys.argv[1]}'
OUTPUT_FILE = f'{sys.argv[2]}'

# raise Exception("Error adrede")

with open(INPUT_FILE, "r") as f:
    code = f.read()

lexer = CoolLexer()
tokens = []
for t in lexer.tokenize(code):
    tokens.append(t)

errors = ""
if len(lexer.errors)>0:
    for e in lexer.errors:
        errors+=f'{e}\n'
    print(errors)
    exit(1)
# else:
#     parser = CoolParser(lexer = lexer)
#     program = parser.parse(tokens)
#     if len(parser.errors)>0:
#         for e in parser.errors:
#             errors+=f'{e}\n'
#         print(errors)
#         exit(1)
#     else:
#         validate_program(program)
#         if len(semantic.errors) > 0:
#             for e in semantic.errors:
#                 errors+=f'{e}\n'
#             print(errors)
#             exit(1)
#         else:
#             exit(0)
