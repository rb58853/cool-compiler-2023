from sly import Parser
from lexer.cool_lexer import CoolLexer
from AST.ast import *

class CoolParser(Parser):
    def __init__(self, all_steps = False):
        super().__init__()
        self.all_steps = all_steps

    tokens = CoolLexer.tokens
    start = 'expr'

    precedence = (
        ('right', 'ASSIGN'),        #lv1
        ('left','NOT'),             #lv2
        ('nonassoc', '=','<','LE'), #lv3
        ('left', '+', '-'),         #lv4
        ('left', '*', '/'),         #lv5
        ('left', "ISVOID"),         #lv6
        ('left', '~'),              #lv7 
        ('left', '@'),              #lv8
        ('right', 'IN'),            #lv9  Se agrega esta precedence extra dado que let se puede declarar sin usar IN, luego hay que dar prioridad cuando este aparece
        ('left', '.'),              #lv10
    )


#region features
    @_('ID ":" TYPE')
    def def_atr(self, p):
        pass
    @_('ID ":" TYPE ARROW expr')
    def def_atr(self, p):
        pass

    @_('ID "(" param_list ")" ":" TYPE "{" expr "}"')
    def def_func(self, p):
        pass
   
    @_('ID "(" ")" ":" TYPE "{" expr "}"')
    def def_func(self, p):
        pass
#endregion

#region formal ---------------------------------------------------------------------------------------------------------------------
    #named formal in the manual, here is `param`
    @_('ID ":" TYPE "," param_list')
    def param_list(self, p):
        return [CoolID( id=p.ID,type= p.TYPE )] + p.param_list
    
    @_('ID ":" TYPE')
    def param_list(self, p):
        return [CoolID(id=p.ID, type=p.TYPE )] 
#endregion   

#region expr ------------------------------------------------------------------------------------------------------------------------
    @_('ID ASSIGN expr')
    def expr(self, p):
        #expr::= ID <- expr
        if self.all_steps: return expr(BinOp('<-', CoolID(p[0]),p[2]))
        return BinOp('<-', CoolID(p[0]), p[2])
        if self.all_steps: return expr(BinOp('<-', p[0],p[2]))
        return BinOp('<-', p[0], p[2])
         
    @_('expr "@" TYPE "." ID "(" expr_list ")"')#, 'expr "@" TYPE "." ID "(" ")"' )
    def expr(self, p):
        ID = CoolCallable(p.ID,p.expr_list)
        return CoolObject.MethodInvoque(p.expr,p.TYPE,ID)
    @_('expr "@" TYPE "." ID "(" ")"')
    def expr(self,p):
        ID = CoolCallable(p.ID,[])
        return CoolObject.MethodInvoque(p.expr,p.TYPE,ID)
    
    @_('expr "." ID "(" expr_list ")"')
    def expr(self, p):
        ID = CoolCallable(p.ID,p.expr_list)
        return CoolObject.MethodInvoque(p.expr,None,ID)
    @_('expr "." ID "(" ")"')
    def expr(self, p):
        ID = CoolCallable(p.ID,[])
        return CoolObject.MethodInvoque(p.expr,None,ID)

    @_('ID "(" ")"')
    def expr(self, p):
        #expr:: ID()
        return CoolCallable(p.ID,[])
    @_('ID "(" expr_list ")"')
    def expr(self, p):
        #expr:: ID(expr, expr, ...expr)
        return CoolCallable(p.ID, p.expr_list)
            
    @_('IF expr THEN expr ELSE expr FI')
    def expr(self, p):
        #expr:: if expr then expr else expr fi
        if self.all_steps: return expr(CoolIf(if_condition=p[1],then_generation=p[3],else_generation=p[5]))
        return CoolIf(if_condition=p[1],then_generation=p[3],else_generation=p[5])
        
    @_('WHILE expr LOOP expr POOL')
    def expr(self, p):
        #expr:: while expr loop expr pool
        if self.all_steps: return expr(CoolWhile(while_condition=p[1],loop_scope=p[3]))
        return CoolWhile(while_condition=p[1],loop_scope=p[3])
        
    @_('"{" block_list "}"')
    def expr(self, p):
        #expr::= {expr; expr; ...expr;}
        return CoolBlockScope(p.block_list)        
  
    @_('LET let_list IN expr')
    def expr(self, p):
        #expr::= {let ID : TYPE [ <- expr ], let ID : TYPE [ <- expr ]....} in expr
        return CoolLet(let = p.let_list, _in = p.expr)
        
    @_('CASE expr OF case_list ESAC')
    def expr(self, p):
        return CoolCase(p.expr,p.case_list)
        
    @_('NEW TYPE')
    def expr(self, p):
        # expr ::= new TYPE
        return CoolNew(p.TYPE)
        
    @_('ISVOID expr')
    def expr(self, p):
        # expr ::= isvoid expr
        return CoolIsVoid(p.expr)
        
    @_('expr "+" expr')
    def expr(self, p):
        # expr ::= expr + expr
        if self.all_steps: return expr(BinOp('+', p[0],p[2]))
        return BinOp('+', p[0], p[2])
        
    @_('expr "-" expr')
    def expr(self, p):
        # expr ::= expr - expr
        if self.all_steps: return expr(BinOp('-', p[0],p[2]))
        return BinOp('-', p[0],p[2])
        
    @_('expr "*" expr')
    def expr(self, p):
        # expr ::= expr * expr
        if self.all_steps: return expr(BinOp('*', p[0],p[2])) 
        return BinOp('*', p[0],p[2])
        
    @_('expr "/" expr')
    def expr(self, p):
        # expr ::= expr / expr
        if self.all_steps: return expr(BinOp('/', p[0],p[2]))
        return BinOp('/', p[0],p[2])
        
    @_('"~" expr')
    def expr(self, p):
        # expr ::= ~exp
        if self.all_steps: return expr(CoolUminus(p.expr))
        return CoolUminus(p.expr)
        
    @_('expr "<" expr')
    def expr(self, p):
        # expr ::= expr < expr
        if self.all_steps: return expr(BinOp('<', p[0],p[2]))
        return BinOp('<', p[0],p[2])
        
    @_('expr LE expr')
    def expr(self, p):
        # expr ::= expr <= expr
        if self.all_steps: return expr(BinOp('<=', p[0],p[2]))
        return BinOp('<=', p[0],p[2])
        
    @_('expr "=" expr')
    def expr(self, p):
        # expr ::= expr = expr
        if self.all_steps: return expr(BinOp('=', p[0],p[2]))
        return BinOp('=', p[0],p[2])
        
    @_('NOT expr')
    def expr(self, p):
        # expr ::= not exp
        if self.all_steps: return expr(CoolNot(p.expr))
        return CoolNot(p.expr)
        
    @_('"(" expr ")"')
    def expr(self, p):
        # expr ::= integer
        if self.all_steps: return expr(BetwPar(p.expr))
        return p.expr
        
    @_("ID")
    def expr(self, p):
        # expr ::= ID
        if self.all_steps:  return expr(CoolID(p.ID))
        return CoolID(p.ID)
        
    @_("INT_CONST")
    def expr(self, p):
        # expr ::= integer
        if self.all_steps:  return expr(IntNode(p.INT_CONST))
        return IntNode(p.INT_CONST)
        
    @_("STRING")
    def expr(self, p):
        # expr ::= string
        if self.all_steps: return expr(CoolString(p.STRING))
        return CoolString(p.STRING)
        
    @_("TRUE")
    def expr(self, p):
        # expr ::= true
        if self.all_steps: return expr(CoolBool(p.TRUE))
        return CoolBool(p.TRUE)
        
    @_("FALSE")
    def expr(self, p):
        # expr ::= false
        if self.all_steps: return expr(CoolBool(p.FALSE))
        return CoolBool(p.FALSE)

#region UTILS------------------------------------------------------------------------------------------------------------------------

    #CREATE SIMPLE_LIST---------------------------------------       
    @_('expr "," expr_list')
    def expr_list(self, p):
        return [p.expr] + p.expr_list
    @_('expr')
    def expr_list(self, p):
        return [p.expr]

    #CREATE BLOCKS_LIST---------------------------------------       
    @_('expr ";" block_list')
    def block_list(self, p):
        return [p.expr] + p.block_list
    @_('expr ";"') # @_('expr ";" epsilon')
    def block_list(self, p):
        return [p.expr]
    
    #CREATE LET_ASSIGN_LIST---------------------------------------       
    @_('let_assign "," let_list')
    def let_list(self, p):
        return [p.let_assign] + p.let_list
    @_('let_assign') # @_('let_assign epsilon')
    def let_list(self, p):
        return [p.let_assign]
        
    @_('ID ":" TYPE ASSIGN expr')
    def let_assign(self, p):
        return CoolLet.new_let(ID= p.ID, type=p.TYPE, exp=p.expr)
    @_('ID ":" TYPE')
    def let_assign(self, p):
        return CoolLet.new_let(ID= p.ID, type=p.TYPE, exp=None)

    #CREATE CASE_LIST---------------------------------------------  
    @_('ID ":" TYPE DARROW expr ";" case_list')
    def case_list(self, p):
        return [CoolCase.new_case(ID= p.ID, type=p.TYPE, exp=p.expr)] + p.case_list
    @_('ID ":" TYPE DARROW expr ";"')
    def case_list(self, p):
        return [CoolCase.new_case(ID= p.ID, type=p.TYPE, exp= p.expr)]
#endregion

#endregion
