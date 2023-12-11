from compiler.parser.cool_parser import CoolLexer, CoolParser
from compiler.semantic.semantic_ import semantic
from compiler.semantic.semantic_visitor import validate_program
from compiler.codegen.cil2mips.to_mips import MIPS, CIL2MIPS
from compiler.codegen.cool2cil.codegener import CILProgram
import os
import sys

import warnings
warnings.filterwarnings("ignore")



# INPUT_FILE = os.path.join(os.getcwd(), "tests/codegen/arith.cl")
# OUTPUT_FILE = os.path.join(os.getcwd(), "tests/codegen/arith.mips")
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
else:
    parser = CoolParser(lexer = lexer)
    program = parser.parse(lexer.tokenize(code))
    if len(parser.errors)>0:
        for e in parser.errors:
            errors+=f'{e}\n'
        print(errors)
        exit(1)
    else:
        validate_program(program)
        if len(semantic.errors) > 0:
            for e in semantic.errors:
                errors+=f'{e}\n'
            print(errors)
            exit(1)
        
        else:
            cil_program =CILProgram(program)
            mips = MIPS()
            CIL2MIPS(cil= cil_program, mips=mips)
            code = mips.code() 
            with open(OUTPUT_FILE, "w") as f:
                f.write(code)
            exit(0)

