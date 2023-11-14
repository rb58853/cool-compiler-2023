from parser.cool_parser import CoolLexer, CoolParser
from code_gen.cool_to_cil.test import CoolToCil
lexer = CoolLexer()
parser = CoolParser(False)

code = '2+3 * 8 - (4 *(2 +1))'
ast = parser.parse(lexer.tokenize(code))
# ast.show_tree() #Descomentar para visualiazar el AST, no es visible durante el debug, hay que ejecutar completo

#Usa el AST para generar codigo, asume que no hay errores, es decir solo usa codigo correcto.
cil = CoolToCil(ast)()

'''
    El archivo .py donde puedes empezar a trabajar es /src/compiler/code_gen/cool_to_cil/test.py
'''