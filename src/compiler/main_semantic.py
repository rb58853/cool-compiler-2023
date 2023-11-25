from parser.count_characters import count_chars
from parser.cool_parser import CoolLexer, CoolParser
from AST.ast import CoolProgram
from semantic.semantic_ import semantic
from semantic.semantic_visitor import init_classes, init_types, validate_program
import os

case = 'case1.cl'
#compiler/semantic/test1.cl
base_dir = os.getcwd()
base_url = os.path.join(base_dir, "src/compiler/semantic")
dir = os.path.join(base_url,case)

with open(dir, "r") as f:
    content = f.read()

# indexs = count_chars(content)
# for i in range(len(indexs)):
#     print(f'{i+1}: {indexs[i]}' ) 


lexer = CoolLexer()
parser = CoolParser(lexer = lexer)
tokens = lexer.tokenize(content)

if len(lexer.errors) > 0: raise Exception(str(lexer.errors[0]))

program:CoolProgram = parser.parse(tokens)
if len(parser.errors) > 0: raise Exception(str(parser.errors[0]))

validate_program(program)

for error in semantic.errors:
    print(error)
# program.show_tree(print_context=False)
# program.show_tree(print_context=True)