from lexer.cool_lexer import CoolLexer 
from parser.test_gramar import CalcParser

lexer = CoolLexer()
parser = CalcParser()

text = '3 + 5 * 6 -5 + 7 * 8 * 19 + (3 + 5 * 6 -5 + 7 * 8 * 19)'
# text = '3 + 5 * 6'
result = parser.parse(lexer.tokenize(text))
# result.generate_ast()
result.show_tree()
a = 1
