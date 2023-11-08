import cool_lexer
from cool_error import CoolError

case_ = "string_4.txt"
# case_ = "string_test.txt"

dir = '/'.join(["src/compiler/lexer/test_cases",case_])
with open(dir, "r") as f:
    content = f.read()
print(content, end="\n\n")

lexer = cool_lexer.CoolLexer()
for token in lexer.tokenize(content):
    print(token)

print("\n-----------------ERRORS-----------------")
for e in CoolError.ERRORS:
    print(e)