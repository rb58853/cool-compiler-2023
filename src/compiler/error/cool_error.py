from sly.lex import Token

class CoolError (Token):
    ERRORS = []
    def __init__(self, token = None, pos = 0, lineno = 0 , value = None) -> None:
        if token is not None:
            self.value = token.value[0]
        else:
            self.value = value

        self.pos = token.pos
        self.lineno = token.lineno
                
            
    def lexical(self, text):
        self.type = "LexicographicError"
        self.text = text
        CoolError.ERRORS.append(self)
    
    def __str__(self):
        return f"{self.type}({self.lineno},{self.pos}): {self.text}- {self.value}"