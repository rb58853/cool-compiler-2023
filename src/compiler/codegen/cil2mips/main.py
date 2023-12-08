from compiler.codegen.cil2mips.to_mips import MIPS, CIL2MIPS
from compiler.codegen.cil2mips.utils import create_file


def mips_code(cil_program, file_name = 'code'):
    mips = MIPS()
    print(cil_program)
    CIL2MIPS(cil= cil_program, mips=mips)
    code = mips.code() 
    # print(code)
    create_file(code, file_name)


