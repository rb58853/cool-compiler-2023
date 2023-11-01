from sly import Lexer
from cool_error import CoolError

class CoolStringLexer(Lexer):
    def __init__(self, text) -> None:
        self.text = text
    
    tokens = { TEXT, BACKNEWL,
        FORMFEED, TAB, BACKESPACE, NEWLINE
    }

    ignore = r' '
    ignore_newline = r'\n'
    ignore_close = r'"'
    ignore_null = r'\0'
    
    FORMFEED  = r'\\f'
    TAB       = r'\\t'
    BACKESPACE= r'\\b'
    NEWLINE   = r'\\n'

    def __init__(self, lexer ):
        self.lexer = lexer
        self.end_string = False
        self.init_index = lexer.index

        self.pos = 0
        self.len = 0
    
    def ignore_close(self, token):
        self.index = self.len
        self.pos = token.index + 1
        self.end_string = True

    def ignore_newline(self, token):
        self.lexer.index = token.index + self.init_index
        self.lexer.new_line()
        value = "" #TODO
        end = self.lexer.index #TODO

        lex_error = CoolError(
            # token = token,
            value =  value,
            pos = self.lexer.pos, 
            lineno = self.lexer.lineno,
            index= self.lexer.index,
            end = end
            )
        
        lex_error.lexical("Unterminated string constant")
        self.index = end #Cuando encuentre un caracter no valido este sera length=1 
        self.end_string = True
        return lex_error

    def ignore_null(self, token):
        index = self.lexer.index + token.index
        lineno = self.lexer.lineno + self.count_new_line
        self.lexer.cool_error(lineno, index)
        self.lexer.cool_error.add_lexical("String contains null character")
        self.end_string = True
    
    def FORMFEED(self, token):
        token.value = '\f'
        return token
    
    def TAB(self, token):
        token.value = '\t'
        return token
    
    def BACKESPACE(self, token):
        token.value = '\b'
        return token

    def NEWLINE(self, token):
        token.value = '\n'
        return token
    
    def __call__(self):
        text = self.lexer.text[self.lexer.index:]
        self.len = len(text)
        
        self.tokenize(text)
        return text[:self.len]