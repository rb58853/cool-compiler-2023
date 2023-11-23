from parser.cool_parser import CoolLexer, CoolParser, CoolProgram
from code_gen.cool_to_cil.test import generate_type_hierarchy
lexer = CoolLexer()
parser = CoolParser(False)

code = '2+3 * 8 - (4 *(2 +1))'
lexer = CoolLexer()
parser = CoolParser(lexer = lexer)
tokens = lexer.tokenize(code)

if len(lexer.errors) > 0: raise Exception(str(lexer.errors[0]))

program:CoolProgram = parser.parse(tokens)
if len(parser.errors) > 0: raise Exception(str(parser.errors[0]))

generate_type_hierarchy(program)