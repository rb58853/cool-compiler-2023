from sly import Lexer
from cool_error import LexicalError, Token

class CoolStringLexer(Lexer):
    def __init__(self, text) -> None:
        self.text = text
    
    tokens = {FORMFEED, TAB, BACKESPACE, NEWLINE}

    ignore = r' '
    ignore_newline = r'\n'
    ignore_close = r'"'
    ignore_null = r'\0'
    
    FORMFEED = r'\\f'
    TAB = r'\\t'
    BACKESPACE = r'\\b'
    NEWLINE = r'\\n'

    def __init__(self, lexer ):
        self.lexer = lexer
        self.init_index = lexer.index
        self.end_str = Token()
        self.error = None
    
    def ignore_close(self, token):
        if self.error is not None:
            return
        self.lexer.end = token.end + self.init_index
        
        self.end_str.value = self.lexer.text[:token.index]
        self.end_str.index = self.init_index
        self.end_str.end = self.lexer.end
        self.end_str.type = 'STRING'
        self.end_str.lineno = self.lexer.lineno

    def ignore_newline(self, token):
        self.error = self.create_error(token,"Unterminated string constant")
        self.lexer.new_line()

    def ignore_null(self, token):
        self.error = self.create_error(token,"null string")
        
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
        if self.error is not None:
            return
        
        token.value = '\n'
        self.lexer.end = token.end + self.init_index
        self.lexer.new_line()
        return token
    
    def __call__(self):
        text = self.lexer.text[self.lexer.index:]
        str_was_end = False
        for char, i in zip (text, range(len(text))):
            if char == '"':
                text = text[:i]
                str_was_end = True
                break

        end_token = self.tokenize(text)[-1]

        if self.error is None:
            if str_was_end:
                return self.end_str
            else:
                return self.create_error(end_token,"No cierra el string nunk")
        else:
            return self.error    
    
    def create_error(self, token, text):
        if self.error is not None:
            return self.error
        self.lexer.index = token.index + self.init_index
        self.lexer.end = token.end + self.init_index
        value = self.lexer.text[:token.end]
        end = self.lexer.end

        lex_error = LexicalError(
            value =  value,
            pos = self.lexer.pos, 
            lineno = self.lexer.lineno,
            index= self.lexer.index,
            end = end
            )
        lex_error(text)
        return lex_error