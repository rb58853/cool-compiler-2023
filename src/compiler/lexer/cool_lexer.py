from sly import Lexer
from compiler.error.cool_error import LexicalError
from compiler.lexer.string_cool_lexer import StringAnalizer
from compiler.lexer.comment_cool_lexer import CommentAnalizer
from compiler.lexer.tabs_lexer import change_tabs


class CoolLexer(Lexer):
    def __init__(self) -> None:
        super().__init__()
        self.lineno = 0
        self.last_index = 0
        self.end = 0
        self.close_str = True
        self.init_index_line = [0,0]
        self.errors = []

    tokens = {
        CLASS, INHERITS,
        IF, THEN, ELSE, FI,
        LET, IN,
        WHILE, LOOP, POOL,
        CASE, OF, ESAC,
        ISVOID, NEW, NOT,
        TRUE, FALSE,
        ID, INT_CONST, TYPE,
        ASSIGN, DARROW, LE, 
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
    
    ignore_comment = r'\(\*'
    ignore_line = r'--.*\n'


    ID = r'[a-zA-Z][a-zA-Z0-9_]*'
    INT_CONST  = r'\d+'
    ASSIGN = r'<-'
    
    DARROW = r'=>'
    LE = r'<=' #LESS_OR_EQUAL

    STRING  = r'\"'

    def ID(self, token):
        """ Se ejecuta para cualquier cadena de texto que se analiza la cual poseea letras, numeros o _ solamente en su composicion por deficion de expresion regular para el token ID, ergo se analiza si estamos en presencia de una palabra clave o de in identificador"""

        # Por definicion dada, las keywords poseen el mismo nombre, en minusculas, del token que se le debe asociar, si estamos en presencia de un keyword hay que matchear
        # Se usa el .lower() por la definicion de los keywords de Cool #TODO
        if token.value.lower() in self.keyword:
            token.type = token.value.upper()
        elif not token.value[0].islower() and token.value[0] != '_':
            token.type = "TYPE"
        else:
            token.type = "ID"

        self.end = token.end
        return token
        
    def ignore_comment(self,token):
        self.index = token.end
        return CommentAnalizer(self)()
        

    def ignore_line(self, token):
        # self.index = token.index
        self.end = token.end
        self.new_line()
    
    def ignore_newline(self,token):
        self.new_line()
    
    def INT_CONST(self, token):
        token.value = int(token.value)
        self.end = token.end
        return token

    def error(self, token):
        self.end = self.index+1 #Cuando encuentre un caracter no valido este sera length=1 

        lex_error = LexicalError(
            by= self,
            value= token.value[0], 
            pos = self.get_pos(), 
            lineno = self.lineno,
            index= self.index,
            end = self.end
        )
        lex_error(f'ERROR "{token.value[0]}"')
        # lex_error("Invalid Character")

        self.index = self.end 
        
        # print(lex_error)
        # return lex_error

    def STRING(self, token):
        self.index = token.end
        self.end = token.end + 1

        str_lex = StringAnalizer(self)
        return str_lex()

    def new_line(self):
        self.last_index = self.index
        self.lineno +=1
        self.init_index_line.append(self.last_index)

    def get_pos(self, index = None):
        if index is None:
            return self.end - self.last_index
        else:
            return index - self.last_index
        
    def tokenize(self, text, lineno=1, index=0):
        text = change_tabs(text)
        return super().tokenize(text, lineno, index)    
        
        