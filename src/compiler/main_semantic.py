from parser.cool_parser import CoolLexer, CoolParser
from AST.ast import CoolProgram
from semantic.semantic_visitor import init_classes, init_types
import os

case = 'test1.cl'
#compiler/semantic/test1.cl
base_dir = os.getcwd()
base_url = os.path.join(base_dir, "src/compiler/semantic")
dir = os.path.join(base_url,case)

with open(dir, "r") as f:
    content = f.read()

lexer = CoolLexer()
parser = CoolParser(lexer = lexer)
tokens = lexer.tokenize(content)

if len(lexer.errors) > 0: Exception(str(lexer.errors[0]))

program:CoolProgram = parser.parse(tokens)
if len(parser.errors) > 0: Exception(str(parser.errors[0]))

init_types(program)

program.show_tree(print_context=True)

program.context.print()
# for child in program.childs():
#     context = child.context
#     context.print()

# for cclass in program.childs():
#     for feature in cclass.childs():
#         if feature.name == 'class_func':
#             context = feature.context
#             context.print()
