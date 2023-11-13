from sly import Parser
from lexer.cool_lexer import CoolLexer
from parser.ast import *

class CoolParser(Parser):
    tokens = CoolLexer.tokens
    # start = 'program' TODO

    precedence = (
        ('right', 'ASSING'),        #lv1
        ('left','NOT'),             #lv2
        ('nonassoc', '=','<','LE'), #lv3
        ('left', '+', '-'),         #lv4
        ('left', '*', '/'),         #lv5
        # ('right', 'UMINUS'),      #lv6  Unary minus operator [example]: expr * -int 
        ('left', "ISVOID"),         #lv6
        ('left', '~'),              #lv7
        ('left', '@'),              #lv8
        # ('right', 'IN'),          #lv TODO
        ('left', '.'),              #lv9
    )

    @_('"-" expr %prec UMINUS')
    def expr(p):
        return -p.expr
    


    '''expr can have the following forms'''
    #region expr
    @_('ID ARROW expr')
    def expr(self, p):
        pass
        
    @_('expr "@" TYPE "." ID "(" expr_list ")"', 'expr "@" TYPE "." ID "(" ")"' )
    def expr(self, p):
        pass
        
    @_('expr "." ID "(" expr_list ")"', 'expr "." ID "(" ")"')
    def expr(self, p):
        pass
        
    @_('ID "(" expr_list ")"', 'ID "(" ")"')
    def expr(self, p):
        pass
            
    @_('expr "," expr_list')
    def expr_list(self, p):
        pass
        
    @_('expr')
    def expr_list(self, p):
        pass
        
    @_('IF expr THEN expr ELSE expr FI')
    def expr(self, p):
        pass
        
    @_('WHILE expr LOOP expr POOL')
    def expr(self, p):
        pass
        
    @_('"{" block_list "}"')
    def expr(self, p):
        pass
        
    @_('expr ";" block_list')
    def block_list(self, p):
        pass
        
    @_('expr ";" epsilon')
    def block_list(self, p):
        pass
        
    @_('LET let_list IN expr')
    def expr(self, p):
        pass
        
    @_('let_assign "," let_list')
    def let_list(self, p):
        pass
        
    @_('let_assign epsilon')
    def let_list(self, p):
        pass
        
    @_('ID ":" TYPE ARROW expr')
    def let_assign(self, p):
        pass
        
    @_('ID ":" TYPE')
    def let_assign(self, p):
        pass
        
    @_('CASE expr OF case_list ESAC')
    def expr(self, p):
        pass
        
    @_('ID ":" TYPE LOGICAR expr ";" case_list')
    def case_list(self, p):
        pass
        
    @_('ID ":" TYPE LOGICAR expr ";"')
    def case_list(self, p):
        pass
        
    @_('NEW TYPE')
    def expr(self, p):
        pass
        
    @_('ISVOID expr')
    def expr(self, p):
        pass
        
    @_('expr "+" expr')
    def expr(self, p):
        # expr ::= expr + expr
        return BinOp('+', p.expr, p.expr)
        
    @_('expr "-" expr')
    def expr(self, p):
        pass
        
    @_('expr "*" expr')
    def expr(self, p):
        pass
        
    @_('expr "/" expr')
    def expr(self, p):
        pass
        
    @_('"~" expr')
    def expr(self, p):
        pass
        
    @_('expr "<" expr')
    def expr(self, p):
        pass
        
    @_('expr LESS_OR expr')
    def expr(self, p):
        pass
        
    @_('expr "=" expr')
    def expr(self, p):
        pass
        
    @_('NOT expr')
    def expr(self, p):
        pass
        
    @_('"(" expr ")"')
    def expr(self, p):
        pass
        
    @_("ID")
    def expr(self, p):
        pass
        
    @_("INT_CONST")
    def expr(self, p):
        return expr(IntNode( p.INT_CONST))
        
    @_("STRING")
    def expr(self, p):
        pass
        
    @_("TRUE")
    def expr(self, p):
        pass
        
    @_("FALSE")
    def expr(self, p):
        pass
    #endregion