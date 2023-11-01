from sly import Lexer

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
        self.pos = 0
        self.count_new_line = 0
        self.len = 0
    
    def ignore_close(self, token):
        self.index = self.len
        self.pos = token.index + 1
        self.end_string = True

    def ignore_newline(self, token):
        index = self.lexer.index + token.index
        lineno = self.lexer.lineno + self.count_new_line
        self.lexer.cool_error(lineno, index)
        self.lexer.cool_error.add_lexical("Unterminated string constant")
        self.index = self.len
        self.pos = token.index 
        self.end_string = True
    
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
        _list = []
        for t in self.tokenize(text):
            _list.append(t.value)

        result = ''.join(_list)
        return result, self.pos, self.count_new_line