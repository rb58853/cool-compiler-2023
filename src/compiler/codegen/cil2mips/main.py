from codegen.cil2mips.to_mips import MIPS, CIL2MIPS
from codegen.cil2mips.utils import create_file


def mips_code(cil_program, file_name = 'code'):
    mips = MIPS()
    print(cil_program)
    CIL2MIPS(cil= cil_program, mips=mips)
    print(mips.code())
    create_file(mips.code(), file_name)


