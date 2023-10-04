from sly import Lexer

class CoolLexer(Lexer):
    def __init__(self, error=None) -> None:
        super().__init__()
        self.cool_error = error

    tokens = {
        CLASS, INHERITS,
        IF, THEN, ELSE, FI,
        LET, IN,
        WHILE, LOOP, POOL,
        CASE, OF, ESAC,
        ISVOID, NEW, NOT,
        TRUE, FALSE,
        ID, NUMBER, TYPE,
        ARROW, LOGICAR, LESS_OR, 
        STRING
    }

    literals = {
        '{','}', '@', '.', ',', ';',
        '=', '<', '~', '+', '-',
        '*', '/', '(', ')', ':',
    }

    keyword = [ 'class', 'inherits',
                'if', 'then', 'else', 'fi',
                'let', 'in',
                'while', 'loop', 'pool',
                'case', 'of' , 'esac',
                'isvoid', 'new', 'not',
                'true','false'
    ]

    ignore = r' '
    ignore_newline = r'\n'

    ID = r'[a-zA-Z][a-zA-Z0-9_]*'
    NUMBER  = r'\d+'


    def ID(self, token):
        """ Se ejecuta para cualquier cadena de texto que se analiza la cual poseea letras o numeros solamente en su composicion por deficion de expresion regular para el token ID, ergo se analiza si estamos en presencia de una palabra clave o de in identificador"""

        #Por definicion dada, las keywords poseen el mismo nombre, en minusculas, del token que se le debe asociar, si estamos en presencia de un keyword hay que matchear
        if token.value in self.keyword:
            token.type = token.value.upper()

        return  token
        
    def ignore_newline(self,token):
        self.lineno += 1
    
    def tokenize(self, text, lineno=1, index=0):
        return super().tokenize(text, lineno, index)    

lexer = CoolLexer()
for token in lexer.tokenize("cLasS inherits"):
    print(token)
