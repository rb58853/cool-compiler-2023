from codegen.cil2mips.to_mips import MIPS, CIL2MIPS
def mips_code(cil_program):
    mips = MIPS()
    print(cil_program)
    CIL2MIPS(cil= cil_program, mips=mips)
    print(mips.code())