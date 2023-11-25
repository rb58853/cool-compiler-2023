from sly import Parser
from error.cool_error import SyntacticError
from lexer.cool_lexer import CoolLexer
from AST.ast import CoolBlockScope, CoolBool, CoolCallable,CoolCase, CoolClass, CoolID, CoolIf, CoolIsVoid, CoolNot,CoolLet, CoolNew, CoolProgram, CoolString, CoolUminus, CoolWhile, Dispatch, Feature, expr, IntNode, BinOp, BetwPar, Logicar, Assign, ArithmeticOP

#TODO Implementar de ser mas atractivo la deteccion de errores en modo de panico, por ejemplo seguir hasta un ';' despues de encontrar un error
    
class CoolParser(Parser):
    tokens = CoolLexer.tokens
    start = 'program'
    precedence = (
        ('right', 'ASSIGN'),        #lv1
        ('left','NOT'),             #lv2
        ('nonassoc', '=','<','LE'), #lv3
        ('left', '+', '-'),         #lv4
        ('left', '*', '/'),         #lv5
        ('left', "ISVOID"),         #lv6
        ('left', '~'),              #lv7 
        ('left', '@'),              #lv8
        # ('right', 'IN'),            #lv9  Se agrega esta precedence extra dado que let se puede declarar sin usar IN, luego hay que dar prioridad cuando este aparece
        ('left', '.'),              #lv10
    )
    
    def __init__(self, all_steps = False, lexer:CoolLexer = None, print_error:bool = False):
        super().__init__()
        self.all_steps = all_steps
        self.errors = []
        self.lexer = lexer
        self.print_errors = print_error
    
    def token_pos(self,token):
            return token.index - self.lexer.init_index_line[token.lineno] + 1
    
    def error(self, token):
        if token:
            synt_error = SyntacticError(
            by= self,
            token = token, 
            pos = self.token_pos(token), 
            lineno = token.lineno,
            index= token.index,
            end = token.end
            )
            synt_error("ERROR at or near")
        
            if self.print_errors:
                print(synt_error)
        else:
            synt_error = SyntacticError(
            by= self,
            value= 'EOF', 
            pos = 0, 
            lineno = 0,
            index= -1,
            end = -1
            )
            synt_error("EOF ERROR")
        
            if self.print_errors:
                print(synt_error)

##########__________________PROGRAM______________________##########    
    @_('class_list')
    def program(self, p): 
        return CoolProgram(p.class_list)
###################################################################

#region class
    @_('CLASS TYPE "{" class_feature "}"')
    def cclass(self, p):
        return CoolClass(type=p.TYPE,features=p.class_feature,token_pos=(p.lineno,self.token_pos(p)))
    @_('CLASS TYPE INHERITS TYPE "{" class_feature "}"')
    def cclass(self, p):
        return CoolClass(type=p[1],inherit=p[3],features=p.class_feature,token_pos=(p.lineno,self.token_pos(p)))
    
    @_('cclass ";"')
    def class_list(self, p):
        return [p.cclass]
    
    @_('cclass ";" class_list')
    def class_list(self, p):
        return [p.cclass] + p.class_list
#endregion

#region features
    @_('def_atr ";" class_feature')
    def class_feature(self, p):
        return [p.def_atr] + p.class_feature
    
    @_('def_func ";" class_feature')
    def class_feature(self, p):
        return [p.def_func] + p.class_feature
    
    @_('')
    def class_feature(self, p):
        return []

    @_('ID ":" TYPE')
    def def_atr(self, p):
        return Feature.CoolAtr(id= p.ID, type= p.TYPE,value= None,token_pos=(p.lineno,self.token_pos(p)))
    @_('ID ":" TYPE ASSIGN expr')
    def def_atr(self, p):
        return Feature.CoolAtr(id= p.ID, type= p.TYPE,value= p.expr,token_pos=(p.lineno,self.token_pos(p)))

    @_('ID "(" param_list ")" ":" TYPE "{" expr "}"')
    def def_func(self, p):
        t = p.ID.index
        return Feature.CoolDef(p.ID,type=p.TYPE, params= p.param_list,scope=p.expr,token_pos=(p.lineno,self.token_pos(p)))
   
    @_('ID "(" ")" ":" TYPE "{" expr "}"')
    def def_func(self, p):
        return Feature.CoolDef(id = p.ID,type=p.TYPE, params= [],scope=p.expr,token_pos=(p.lineno,self.token_pos(p)))
#endregion

#region formal ---------------------------------------------------------------------------------------------------------------------
    #named formal in the manual, here is `param`
    @_('ID ":" TYPE "," param_list')
    def param_list(self, p):
        return [CoolID( id=p.ID,type= p.TYPE,token_pos=(p.lineno,self.token_pos(p)) )] + p.param_list
    
    @_('ID ":" TYPE')
    def param_list(self, p):
        return [CoolID(id=p.ID, type=p.TYPE,token_pos=(p.lineno,self.token_pos(p)) )] 
#endregion   

#region expr ------------------------------------------------------------------------------------------------------------------------
    @_('ID ASSIGN expr')
    def expr(self, p):
        #expr::= ID <- expr
        return Assign('<-', CoolID(p[0]), p[2],token_pos=(p.lineno,self.token_pos(p)))
         
    @_('expr "@" TYPE "." ID "(" expr_list ")"')#, 'expr "@" TYPE "." ID "(" ")"' )
    def expr(self, p):
        ID = CoolCallable(p.ID,p.expr_list)
        return Dispatch(p.expr,p.TYPE,ID, token_pos=(p.lineno,self.token_pos(p)))
    @_('expr "@" TYPE "." ID "(" ")"')
    def expr(self,p):
        ID = CoolCallable(p.ID,[])
        return Dispatch(p.expr,p.TYPE,ID,token_pos=(p.lineno,self.token_pos(p)))
    
    @_('expr "." ID "(" expr_list ")"')
    def expr(self, p):
        ID = CoolCallable(p.ID,p.expr_list)
        return Dispatch(p.expr,None,ID,token_pos=(p.lineno,self.token_pos(p)))
    @_('expr "." ID "(" ")"')
    def expr(self, p):
        ID = CoolCallable(p.ID,[])
        return Dispatch(p.expr,None,ID,token_pos=(p.lineno,self.token_pos(p)))

    @_('ID "(" ")"')
    def expr(self, p):
        #expr:: ID()
        return CoolCallable(p.ID,[],token_pos=(p.lineno,self.token_pos(p)))
    @_('ID "(" expr_list ")"')
    def expr(self, p):
        #expr:: ID(expr, expr, ...expr)
        return CoolCallable(p.ID, p.expr_list,token_pos=(p.lineno,self.token_pos(p)))
            
    @_('IF expr THEN expr ELSE expr FI')
    def expr(self, p):
        #expr:: if expr then expr else expr fi
        if self.all_steps: return expr(CoolIf(if_condition=p[1],then_generation=p[3],else_generation=p[5]))
        return CoolIf(if_condition=p[1],then_generation=p[3],else_generation=p[5],token_pos=(p.lineno,self.token_pos(p)))
        
    @_('WHILE expr LOOP expr POOL')
    def expr(self, p):
        #expr:: while expr loop expr pool
        if self.all_steps: return expr(CoolWhile(while_condition=p[1],loop_scope=p[3]))
        return CoolWhile(while_condition=p[1],loop_scope=p[3],token_pos=(p.lineno,self.token_pos(p)))
        
    @_('"{" block_list "}"')
    def expr(self, p):
        #expr::= {expr; expr; ...expr;}
        return CoolBlockScope(p.block_list,token_pos=(p.lineno,self.token_pos(p)))        
  
    @_('LET let_list IN expr')
    def expr(self, p):
        #expr::= {let ID : TYPE [ <- expr ], let ID : TYPE [ <- expr ]....} in expr
        return CoolLet(let = p.let_list, _in = p.expr,token_pos=(p.lineno,self.token_pos(p)))
        
    @_('CASE expr OF case_list ESAC')
    def expr(self, p):
        return CoolCase(p.expr,p.case_list,token_pos=(p.lineno,self.token_pos(p)))
        
    @_('NEW TYPE')
    def expr(self, p):
        # expr ::= new TYPE
        return CoolNew(p.TYPE,token_pos=(p.lineno,self.token_pos(p)))
        
    @_('ISVOID expr')
    def expr(self, p):
        # expr ::= isvoid expr
        return CoolIsVoid(p.expr,token_pos=(p.lineno,self.token_pos(p)))
        
    @_('expr "+" expr')
    def expr(self, p):
        # expr ::= expr + expr
        return ArithmeticOP('+', p[0], p[2],token_pos=(p.lineno,self.token_pos(p)))
        
    @_('expr "-" expr')
    def expr(self, p):
        # expr ::= expr - expr
        return ArithmeticOP('-', p[0],p[2],token_pos=(p.lineno,self.token_pos(p)))
        
    @_('expr "*" expr')
    def expr(self, p):
        # expr ::= expr * expr
        return ArithmeticOP('*', p[0],p[2],token_pos=(p.lineno,self.token_pos(p)))
        
    @_('expr "/" expr')
    def expr(self, p):
        # expr ::= expr / expr
        return ArithmeticOP('/', p[0],p[2],token_pos=(p.lineno,self.token_pos(p)))
        
    @_('"~" expr')
    def expr(self, p):
        # expr ::= ~exp
        if self.all_steps: return expr(CoolUminus(p.expr))
        return CoolUminus(p.expr,token_pos=(p.lineno,self.token_pos(p)))
        
    @_('expr "<" expr')
    def expr(self, p):
        # expr ::= expr < expr
        return Logicar('<', p[0],p[2],token_pos=(p.lineno,self.token_pos(p)))
        
    @_('expr LE expr')
    def expr(self, p):
        # expr ::= expr <= expr
        return Logicar('<=', p[0],p[2],token_pos=(p.lineno,self.token_pos(p)))
        
    @_('expr "=" expr')
    def expr(self, p):
        # expr ::= expr = expr
        return Logicar('=', p[0],p[2],token_pos=(p.lineno,self.token_pos(p)))
        
    @_('NOT expr')
    def expr(self, p):
        # expr ::= not exp
        if self.all_steps: return expr(CoolNot(p.expr))
        return CoolNot(p.expr,token_pos=(p.lineno,self.token_pos(p)))
        
    @_('"(" expr ")"')
    def expr(self, p):
        # expr ::= integer
        if self.all_steps: return expr(BetwPar(p.expr))
        return p.expr
        
    @_("ID")
    def expr(self, p):
        # expr ::= ID
        if self.all_steps:  return expr(CoolID(p.ID))
        return CoolID(p.ID,token_pos=(p.lineno,self.token_pos(p)))
        
    @_("INT_CONST")
    def expr(self, p):
        # expr ::= integer
        return IntNode(p.INT_CONST,token_pos=(p.lineno,self.token_pos(p)))
        
    @_("STRING")
    def expr(self, p):
        # expr ::= string
        return CoolString(p.STRING,token_pos=(p.lineno,self.token_pos(p)))
        
    @_("TRUE")
    def expr(self, p):
        # expr ::= true
        return CoolBool(p.TRUE,token_pos=(p.lineno,self.token_pos(p)))
        
    @_("FALSE")
    def expr(self, p):
        # expr ::= false
        return CoolBool(p.FALSE,token_pos=(p.lineno,self.token_pos(p)))

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