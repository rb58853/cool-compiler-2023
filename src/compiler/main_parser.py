from parser.cool_parser import CoolLexer, CoolParser, Node
import os

#select the test case that do you want analize, index could be >= 1
index_test = 5
show_ast = True

#region ############# ---------Code Region--------- ################
lexer = CoolLexer()
parser = CoolParser(lexer = lexer)
base_dir = os.getcwd()
base_url = os.path.join(base_dir, "tests/parser/")
cases = [case for case in os.listdir(base_url) if case.endswith('.cl')] 
cases.sort()
case = cases[index_test-1]
dir = '/'.join([base_url,case])
with open(dir, "r") as f:
    code = f.read()
#endregion

PROGRAM:Node = parser.parse(lexer.tokenize(code))
if len(parser.errors) == 0 and show_ast:
    PROGRAM.show_tree()

print('------------------PARSER ERRORS---------------')
for e in parser.errors:
    print(e)