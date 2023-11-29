import semantic.main as semantic
import lexer.main as lexer
import parser.main as parser
import codegen.cool2cil.main as cil
import codegen.cil2mips.main as mips

mips.mips_code(cil.cil_program())
# lexer.test_all_cases()
# parser.test_all_cases()
# semantic.test_all_cases()

