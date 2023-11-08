from sly.lex import Token

class CoolError (Token):
    ERRORS = []
    def __init__(self, by, token = None, pos = None, lineno = None , value = None, index = None, end = None) -> None:
        if token is not None and value is None:
            self.value = token.value[0]
        else:
            self.value = value
        
        self.end = end
        self.index = index
        self.pos = pos
        self.lineno = lineno
        by.errors.append(self)

    
    def __str__(self):
        return f"ERROR({self.type}({self.lineno},{self.pos}): {self.text}='{self.value}')"
                
class LexicalError(CoolError):
    def __init__(self, by, token=None, pos=0, lineno=0, value=None, index=0, end=0) -> None:
        super().__init__(by, token, pos, lineno, value, index, end)

    def __call__(self, text):
        self.type = "LexicographicError"
        self.text = text
        CoolError.ERRORS.append(self)
    
    