from compiler.parser.cool_parser import CoolLexer, CoolParser
from compiler.semantic.semantic_ import semantic
from compiler.semantic.semantic_visitor import validate_program
from compiler.codegen.cil2mips.to_mips import MIPS, CIL2MIPS
from compiler.codegen.cool2cil.codegener import CILProgram
import os

def run(INPUT):
    INPUT_FILE = os.path.join(os.getcwd(), f"src/compiler/codegen/tests/{INPUT}.cl")
    OUTPUT_FILE = os.path.join(os.getcwd(), f"src/compiler/codegen/tests/{INPUT}.mips")

    with open(INPUT_FILE, "r") as f:
        code = f.read()

    lexer = CoolLexer()
    parser = CoolParser(lexer = lexer)
    program = parser.parse(lexer.tokenize(code))
    errors = ""
    if len(parser.errors)>0:
        for e in parser.errors:
            errors+=f'{e}\n'
        raise Exception(errors)

    validate_program(program)
    if len(semantic.errors) > 0:
        for e in semantic.errors:
            errors+=f'{e}\n'
        raise Exception(errors)

    cil_program =CILProgram(program)
    mips = MIPS()
    CIL2MIPS(cil= cil_program, mips=mips)
    code = mips.code() 
    with open(OUTPUT_FILE, "w") as f:
        f.write(code)
        f.close()