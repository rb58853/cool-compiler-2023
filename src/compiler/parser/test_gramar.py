from sly import Parser
from lexer.cool_lexer import CoolLexer 
from parser.ast import Node, BinOp, BetwPar, IntNode


class expr(Node):
    def __init__(self, value) -> None:
        self.value =  value
        self.name = 'expr'
        Node.__init__(self,self.value)
    
    def __str__(self) -> str:
        return "expr\n<-" + str(self.value)

class term(Node):
    def __init__(self, value) -> None:
        self.value =  value
        self.name = 'term'
        Node.__init__(self,self.value)
    def __str__(self) -> str:
        return "term\n<-" + str(self.value)

class factor(Node):
    def __init__(self, value) -> None:
        self.value =  value
        self.name = 'factor'
        Node.__init__(self,self.value)

    def __str__(self) -> str:
        return "factor\n<-" + str(self.value)
    
    def childs(self):
        return [self.value]


class CalcParser(Parser):
    # Get the token list from the lexer (required)
    tokens = CoolLexer.tokens

    # Grammar rules and actions
    @_('expr "+" term')
    def expr(self, p):
        return BinOp('+', p.expr, p.term)

    @_('expr "-" term')
    def expr(self, p):
        return BinOp('-', p.expr, p.term)

    @_('term')
    def expr(self, p):
        return expr(p.term)

    @_('term "*" factor')
    def term(self, p):
        return BinOp('*', p.term, p.factor)

    @_('term "/" factor')
    def term(self, p):
        return BinOp('/', p.term, p.factor)

    @_('factor')
    def term(self, p):
        return term(p.factor)

    @_('INT_CONST')
    def factor(self, p):
        return factor(IntNode( p.INT_CONST))

    @_('"(" expr ")"')
    def factor(self, p):
        return p.expr

