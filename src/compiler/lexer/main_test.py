import cool_lexer

case_ = "lexer_test1.txt"
# case_ = "string_test.txt"

dir = '/'.join(["src/compiler/lexer/test_cases",case_])
with open(dir, "r") as f:
    content = f.read()
print(content)

lexer = cool_lexer.CoolLexer()
for token in lexer.tokenize(content):
    print(token)