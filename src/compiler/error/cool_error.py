from sly.lex import Token
from compiler.semantic.semantic_ import semantic

class CoolError (Token):
    ERRORS = []
    def __init__(self, by, token = None, pos = None, lineno = None , value = None, index = None, end = None) -> None:
        if token is not None and value is None:
            self.value = token.value
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

    def description(self):
        if len(self.value)>11 and self.text != "String contains null character":
            return f"ERROR({self.type}({self.lineno},{self.pos}): {self.text}='...{self.value[-10:]}')"
        else:
            return f"ERROR({self.type}({self.lineno},{self.pos}): {self.text}='{self.value}')"
    
    def __str__(self):
        return f"({self.lineno}, {self.pos}) - LexicographicError: {self.text}"
    
class SyntacticError(CoolError):
    def __init__(self, by , token=None, pos=0, lineno=0, value=None, index=0, end=0) -> None:
        super().__init__(by, token, pos, lineno, value, index, end)

    def __call__(self, text = ""):
        self.type = "SyntacticError"
        self.text = text
        CoolError.ERRORS.append(self)

    def __str__(self):
        return f'({self.lineno}, {self.pos}) - SyntacticError: ERROR at or near "{self.value}"'
    
class SemanticError(CoolError):
    def __init__(self, by = semantic, pos=0, lineno=0, value=None) -> None:
        super().__init__(by,pos= pos, lineno=lineno, value=value)

    def __call__(self, text = ""):
        self.type = "SemanticError"
        self.text = text
        CoolError.ERRORS.append(self)

    def __str__(self):
        return f'({self.lineno}, {self.pos}) - {self.text}'
    
