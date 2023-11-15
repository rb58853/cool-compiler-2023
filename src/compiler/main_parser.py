from parser.cool_parser import CoolLexer, CoolParser

lexer = CoolLexer()
parser = CoolParser()

############ ---------------------------------------------expr------------------------------------------------------------############
_while = 'while (3 + 5) * 6 < 17 + 18 * (false - true) loop if not if true then 1 else 0 fi then false else 18 fi pool'
_if = 'if not if true then ~(1 + 4 * 2) else 0 fi then false else 18 fi'
_let = 'let a:STRING <- "asd", b:STRING <- "qwe", c:STRING <- "zxc" in {New INT; a + b * c;}'
_id_call = 'x(a,b,c, 3+4)'
_block = '{New INT; a + b * c; let a:STRING <- "asd" in a; case x of a:STRING => 1; b:STRING => 1; c:STRING => 1; esac; }'
_case = 'case x of a:STRING => 1; b:STRING => 1; c:STRING => 1; esac'
_full_block = '{'+ f'{_if}; {_let}; {_block}; {_case}; {_while};' + '}'
_assign = 'a <- 4'
_object_method = '{ c.a(); c@INT.a();c@INT.a(x, 2, 6*8);}'
############ ------------------------------------------program class-------------------------------------------------------############
scope = '{a<-1; b<-2; c<-a+b; case x of a:INT => 1; b:INT => 1; c:INT => 1; esac; }'
_def = 'f(q:INT, w:INT):INT {'+ scope +'}'
_class1 = 'class MyClass1 { a:INT <- 1; f(x:INT):INT { print(x) }; }'
_class2 = 'class MyClass2 { b:INT <- 2; f(y:INT):INT { {y<-y+1; print(y + 3);} }; }'
_program = f'{_class1};{_class2};'
#-------------------------------------------------------------------------------------------------------------------------------------#

result = parser.parse(lexer.tokenize(_program))
result.show_tree()