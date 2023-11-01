from sly import Lexer
from cool_error import CoolError

class CoolLexer(Lexer):
    def __init__(self) -> None:
        super().__init__()
        self.lineno = 0
        self.last_index = 0
        self.end = 0

    tokens = {
        CLASS, INHERITS,
        IF, THEN, ELSE, FI,
        LET, IN,
        WHILE, LOOP, POOL,
        CASE, OF, ESAC,
        ISVOID, NEW, NOT,
        TRUE, FALSE,
        ID, INT_CONST, TYPE,
        ASSIGN, MORE_EQUAL, LESS_EQUAL, 
        STRING
    }

    literals = {
        '{','}', '@', '.', ',', ';',
        '=', '<','>','~', '+', '-',
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
    ignore_tab = r'\t'
    ignore_newline = r'\n'

    ID = r'[a-zA-Z][a-zA-Z0-9_]*'
    INT_CONST  = r'\d+'
    ASSIGN = r'<-'
    
    MORE_EQUAL = r'=>'
    LESS_EQUAL = r'<='

    STRING  = r'\"'

    def ID(self, token):
        """ Se ejecuta para cualquier cadena de texto que se analiza la cual poseea letras, numeros o _ solamente en su composicion por deficion de expresion regular para el token ID, ergo se analiza si estamos en presencia de una palabra clave o de in identificador"""

        # Por definicion dada, las keywords poseen el mismo nombre, en minusculas, del token que se le debe asociar, si estamos en presencia de un keyword hay que matchear
        # Se usa el .lower() por la definicion de los keywords de Cool #TODO
        if token.value.lower() in self.keyword:
            token.type = token.value.upper()
        elif not token.value[0].islower() and token.value[0] != '_':
            token.type = "TYPEID"
        else:
            token.type = "OBJECTID"

        self.end = token.end
        return token
        
    def ignore_newline(self,token):
        self.new_line()
    
    def INT_CONST(self, token):
        token.value = int(token.value)
        self.end = token.end
        return token

    def error(self, token):
        self.end = self.index+1 #Cuando encuentre un caracter no valido este sera length=1 

        lex_error = CoolError(
            token = token, 
            pos = self.get_pos(), 
            lineno = self.lineno,
            index= self.index,
            end = self.end
            )
        
        lex_error.lexical("Invalid Character")
        self.index = self.end 
        return lex_error

    def STRING(self, token):
        return token
    
    def new_line(self):
        self.last_index = self.index
        self.lineno +=1

    def get_pos(self, index = None):
        if index is None:
            return self.end - self.last_index
        else:
            return index - self.last_index