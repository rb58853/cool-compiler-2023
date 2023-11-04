import cool_lexer

case_ = "string_1.txt"
# case_ = "string_test.txt"

dir = '/'.join(["src/compiler/lexer/test_cases",case_])
with open(dir, "r") as f:
    content = f.read()
print(content, end="\n\n")

lexer = cool_lexer.CoolLexer()
for token in lexer.tokenize(content):
    print(token)