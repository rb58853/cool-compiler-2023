import compiler.semantic.main as semantic
import compiler.lexer.main as lexer
import compiler.parser.main as parser
import compiler.codegen.cool2cil.main as cil
import compiler.codegen.cil2mips.main as mips
from compiler.codegen.tests import run as codegen

INPUT = f'simple_ast'
codegen(INPUT, show_ast = True)
