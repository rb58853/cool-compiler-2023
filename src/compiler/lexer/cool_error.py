from sly.lex import Token

class CoolError (Token):
    ERRORS = []
    def __init__(self, token = None, pos = 0, lineno = 0 , value = None, index = 0, end = 0) -> None:
        if token is not None:
            self.value = token.value[0]
        else:
            self.value = value
        
        self.end = None
        self.index = None
        self.pos = pos
        self.lineno = lineno
                
            
    def lexical(self, text):
        self.type = "LexicographicError"
        self.text = text
        CoolError.ERRORS.append(self)
    
    def __str__(self):
        return f"ERROR({self.type}({self.lineno},{self.pos}): {self.text}='{self.value}'"