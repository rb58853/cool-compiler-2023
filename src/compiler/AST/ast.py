import matplotlib.pyplot as plt
        # from semantic.context import Context, CoolObject

'''TODO
    1- Refactorizar Node.__init__(self,...) por Node.__init__(self,self.childs())en cada node, cambiar nombre, quizas
    2- Crear una estructura(class) para los let y los case, de ser posible usar la misma para classAtr
''' 
class PlotNode():
    HEIGTH = 2.5
    WIDTH = 2
    SEPARATION = 0.1
    
    def __init__(self) -> None:
        self.draw_pos = (0,0)
        self.width = None
        self.pos_plt = 'm' #mid 
  
    def get_width (self):
        if self.width is not None:
            return self.width
        
        if len(self.childs()) ==0 or self.childs == None:
            return PlotNode.WIDTH
        else:
            w = 0
            for child in self.childs():
                w+=child.get_width() + PlotNode.SEPARATION
            return w
        
    def set_childs_pos(self):
        if len(self.childs()) != 0:
            if len(self.childs()) == 1:
                self.childs()[0].draw_pos = (self.draw_pos[0], self.draw_pos[1] - PlotNode.HEIGTH)
                self.childs()[0].set_childs_pos()
            else: 
                mid = len(self.childs())//2
                index = int(mid)#rigth side
                base_acumulate = 0
                
                if len(self.childs()) %2 == 1:
                    # mid = len(self.childs())//2
                    base_acumulate = self.childs()[mid].get_width()/2 + PlotNode.SEPARATION
                    self.childs()[mid].draw_pos = (self.draw_pos[0], self.draw_pos[1] - PlotNode.HEIGTH)
                    index+=1 

                acumulate = base_acumulate
                for i in range(int(mid)-1, -1, -1):
                    child = self.childs()[i]
                    acumulate += child.get_width()/2 + PlotNode.SEPARATION
                    child.draw_pos = (self.draw_pos[0] -acumulate, self.draw_pos[1] - PlotNode.HEIGTH)
                    acumulate += child.get_width()/2 + PlotNode.SEPARATION

                acumulate = base_acumulate
                for i in range(index, len(self.childs())):
                    child = self.childs()[i]
                    acumulate += child.get_width()/2 + PlotNode.SEPARATION
                    child.draw_pos = (self.draw_pos[0] + acumulate, self.draw_pos[1] - PlotNode.HEIGTH)
                    acumulate += child.get_width()/2 + PlotNode.SEPARATION

                for child in self.childs():
                    child.set_childs_pos()

    def show_tree(self, only_root = False):
        if self.father is not None and only_root:
            self.father.show_tree()
        else:
            self.set_childs_pos()

            fig, ax = plt.subplots()
            self.print_node(fig, ax)
            plt.show()

    def print_node(self,fig, ax):
        # Crear un nodo en la posición draw_pos
        ax.add_patch(plt.Circle(self.draw_pos, 1, fill=True, zorder=2))
        ax.text(self.draw_pos[0], self.draw_pos[1], str(self), ha='center', va='center')

        for child in self.childs():
            #Crear una arista entre los dos nodos
            ax.plot([self.draw_pos[0], child.draw_pos[0]], [self.draw_pos[1], child.draw_pos[1]], color='black', zorder=1)

        for child in self.childs():
            child.print_node(fig, ax)
    
class Node(PlotNode):
    def __init__(self, value = None, values:list = []) -> None:
        super().__init__()
        self.type = 'object'
        self.context = None
        self.father = None
        self.name = 'empty'
        
        if len(values) > 0:
            for val in values:
                try: val.father = self 
                except: pass
        else:
            try: value.father = self 
            except: pass
    
    def get_type(self):
        return self.type

    def validate(self): #override this
        return True

    def childs(self):
        return [self.value]
   
    def __str__(self) -> str:
        return str(self.value)
    
    def __repr__(self) -> str:
        return self.name + ': ' + str(self.value)
    
    #region delete and generate AST
    def delete(self):
        if self.father is None:
            # self = self.childs()[0]
            Exception('NO se puede eliminar el node raiz por ahora, se debe cambiar valores')
        else:
            self.father.delete_child(self)
            self.father = None

    def delete_child(self, child):
        #simple node, override this def in mutichlilds nodes
        self.value = child.value
        self.value.father = self

    def generate_ast(self):
        for child in self.childs():
            child.generate_ast()
        
        if self.delete_condition():
            self.delete()

    def delete_condition(self):
        return len(self.childs()) == 1
    #endregion

#region expr    
class expr(Node):
    def __init__(self, value) -> None:
        self.value =  value
        self.name = 'expr'
        Node.__init__(self,self.value)
    
    def __str__(self) -> str:
        return 'expr\n<-' + str(self.value)    

class CoolVar(expr):
    def __init__(self, id:str,type, value) -> None:
        self.id = id
        self.typ = type
        self.value = value
        Node.__init__(self,value= self.value)
        
        def childs(self):
            return [self.value]
        def delete_condition(self):
            return False
        def __str__(self) -> str:
            return f'{self.ID} = {self.value}'        
        def __repr__(self) -> str:
            return f'{self.ID} = {self.value}'       

class BinOp(expr):
    def __init__(self, op, left:expr, right:expr):
        self.op = op
        self.name = op #debug
        self.left:expr = left
        self.right:expr = right
        Node.__init__(self,self.left)
        Node.__init__(self,self.right)

    def childs(self):
        return [self.left, self.right] 
    
    def delete_child(self, child): #override in mutichlilds nodes
        if child == self.left:
            self.left = child.value
            self.left.father = self
        
        elif child == self.right:
            self.right = child.value
            self.right.father = self
        
        else: Exception('Ocurrio un error al intentar elimnar un nodo')    

    def __str__(self) -> str:
        # return str(self.left) + ' ' + self.op + ' '+ str(self.right)
        return str(self.op)
    
    def __repr__(self) -> str:
        return 'operation: ' + str(self.left.__repr__()) + ' ' + self.op + ' '+ str(self.right.__repr__())
    
    # def get_width (self):
    #     return max(self.left.get_width(),self.right.get_width())*2

class BetwPar(expr):
    def __init__(self, expr) -> None:
        self.value = expr
        Node.__init__(self,self.value)
    
    def __str__(self) -> str:
        return '()'
    
    def __repr__(self) -> str:
        return 'parents: ' + '('+ str(self.value) +')'

class CoolIf(expr):
    def __init__(self, if_condition, then_generation, else_generation = None) -> None:
        self.condition = if_condition
        self.then_generation = then_generation
        self.else_generation = else_generation
        Node.__init__(self, values=[self.condition,self.then_generation,self.else_generation])
    
    def childs(self):
        return [self.condition,self.then_generation,self.else_generation]
    
    def delete_child(self, child): #override in mutichlilds nodes
        if child == self.condition:
            self.condition = child.value
            self.condition.father = self
        
        elif child == self.then_generation:
            self.then_generation = child.value
            self.then_generation.father = self
        
        elif child == self.else_generation:
            self.else_generation = child.value
            self.else_generation.father = self

        else: Exception('Ocurrio un error al intentar eliminar un nodo')    
    
    def __str__(self) -> str:
        return 'if - then - else'
    
    def __repr__(self) -> str:
        return f'if {self.condition}: {self.then_generation} \telse: {self.else_generation}'

class CoolWhile(expr):
    def __init__(self, while_condition, loop_scope) -> None:
        self.condition = while_condition
        self.loop_scope = loop_scope
        Node.__init__(self, values=[self.condition,self.loop_scope])
    
    def childs(self):
        return [self.condition,self.loop_scope]
    
    def delete_child(self, child): #override in mutichlilds nodes
        if child == self.condition:
            self.condition = child.value
            self.condition.father = self
        
        elif child == self.loop_scope:
            self.loop_scope = child.value
            self.loop_scope.father = self
        
        else: Exception('Ocurrio un error al intentar eliminar un nodo')    
    
    def __str__(self) -> str:
        return 'While - Loop'
    
    def __repr__(self) -> str:
        return f'while {self.condition}: {self.loop_scope}'

class CoolCallable(expr):
    def __init__(self, id, exprs) -> None:
        self.id = id
        self.params = exprs
        Node.__init__(self,values= self.params)
    
    def childs(self):
        return self.params
    
    def __str__(self) -> str:
        return f'{self.id}()'
    
    def __repr__(self) -> str:
        return f'not {self.value}'
    
    def delete_condition(self):
        return False

class CoolNot(expr):
    def __init__(self, value) -> None:
        self.value =  value
        Node.__init__(self,self.value)

    def __str__(self) -> str:
        return 'not'
    
    def __repr__(self) -> str:
        return f'not {self.value}'
    
    def delete_condition(self):
        return False

class CoolUminus(expr):
    def __init__(self, value) -> None:
        self.value =  value
        # self.name = 'not'
        # super().__init__(value)
        Node.__init__(self,self.value)

    def __str__(self) -> str:
        return '~'
    
    def __repr__(self) -> str:
        return f'~{self.value}'
    
    def delete_condition(self):
        return False

class CoolIsVoid(expr):
    def __init__(self, value) -> None:
        self.value =  value
        Node.__init__(self,self.value)

    def __str__(self) -> str:
        return 'isVoid'
    
    def __repr__(self) -> str:
        return f'isVoid {self.value}'
    
    def delete_condition(self):
        return False

class CoolNew(expr):
    def __init__(self, type) -> None:
        self.type =  type
        self.name = 'new'
        Node.__init__(self, self.type)

    def __str__(self) -> str:
        return f'new {self.type}'
    
    def __repr__(self) -> str:
        return f'new {self.type}'
    
    def delete_condition(self):
        return False
    
    def childs(self):
        return []
    
class CoolCase(expr): #TODO raificar o no los hijos segun la necesidad para semantica y codegen
    def __init__(self, case, cases_list) -> None:
        self.case = case
        self.cases_list = cases_list
        self.width = Node.WIDTH
        self.father = None
        self.draw_pos = (0,0)

    def childs(self):
        return []
    
    def __repr__(self) -> str:
        return 'case of'
    
    def __str__(self) -> str:
        result = f'case {self.case} of [\n'
        for case in self.cases_list:
            result+= f'{case["ID"]}: {case["Type"]} => {case["expr"]}\n'    
        return result + ']'
    
    def delete_condition(self):
        return False
    
    def new_case(ID, type, exp):
        return {'ID': ID, 'Type':type, 'expr':exp}

class CoolLet(expr): #TODO raificar o no los hijos segun la necesidad para semantica y codegen 
    def __init__(self, let, _in) -> None:
        self.let = let
        self.in_scope = _in    
        Node.__init__(self,value=self.in_scope)
    
    def childs(self):
        return [self.in_scope]

    def __repr__(self) -> str:
        return 'let in'
    
    def __str__(self) -> str:
        result = 'let \n'
        for assign in self.let:
            if assign['expr'] is None:
                result+= f'{assign["ID"]}: {assign["Type"]}\n'
            else:
                result+= f'{assign["ID"]}: {assign["Type"]} <- {assign["expr"]}\n'    
        return result + ' in:'
    
    def delete_condition(self):
        return False
    
    def new_let(ID, type, exp):
        return {'ID': ID, 'Type':type, 'expr':exp}

class CoolBlockScope(expr):
    def __init__(self, exprs) -> None:
        self.exprs = exprs
        Node.__init__(self,values=self.exprs)
    
    def childs(self):
        return self.exprs
    
    def __str__(self) -> str:
        return '{expr; expr; ...'+'}'
    
    def __repr__(self) -> str:
        result = "{"
        for ex in self.exprs:
            result+= str(ex)+'; '
        return result+'}'
    
    def delete_condition(self):
        return False    

class CoolID(CoolVar):
    def __init__(self, id, type = None) -> None:
        self.name = 'id'
        self.id = id
        self.type = type
        self.width = Node.WIDTH
        self.father = None
    
    def __str__(self) -> str:
        if self.type is not None:
            return f'{self.id}: {self.type}'
        else:
            return f'{self.id}'
        
    def set_type(self, type):
        self.type= type
    
    def __repr__(self) -> str:
        return str(self)
    
    def childs(self):
        return [] 

class Dispatch(expr): #Dispatch
    def __init__(self, exp, type, function: CoolCallable) -> None:
        self.name = 'dispatch'
        self.expr:expr = exp #Es un ID, NEW, string o IO, en otro caso es error semantico
        self.type = type
        self.function = function
        Node.__init__(self,value=self.function)
    def childs(self):
        return [self.function]
    def __str__(self) -> str:
        return f'{self.expr}:{self.type}.{self.function}'
    def __repr__(self) -> str:
        return str(self)
    def delete_condition(self):
        return False
           
class CoolConstant(expr):
    def __init__(self, value, name) -> None:
        self.value =  value
        self.width = Node.WIDTH
        self.type = name
        self.father = None

    def __str__(self) -> str:
        return f'{self.name}'+ '{' +f'{self.value}' +'}'
    
    def __repr__(self) -> str:
        return str(self)
    
    def childs(self):
        return []    

class IntNode(CoolConstant):
    def __init__(self, value) -> None:
        super().__init__(value,'int')
    
class CoolString(CoolConstant):
    type = 'string'
    def __init__(self, value) -> None:
        super().__init__(value,CoolString.type)

    def concat():    
        type = CoolString.type
        self = CoolID('self',type)
        other = CoolID('other',type)
        return Feature.CoolDef('concat',type, CoolParamsScope([self,other]), BinOp('+',self,other))

class CoolBool(CoolConstant):
    def __init__(self, value) -> None:
        super().__init__(value,'bool')        
#endregion

#region Features
class CoolParamsScope(Node):
        def __init__(self, exprs:list[CoolID] = None) -> None:
            self.exprs = exprs
            Node.__init__(self,values=self.exprs)

        def childs(self):
            return self.exprs

        def __str__(self) -> str:
            return '(param, param, ...)'

        def __repr__(self) -> str:
            result = "("
            for p in self.params:
                result+= str(p)+', '
            return result+')'

        def delete_condition(self):
            return False  

class Feature():
    class CoolAtr(CoolVar):
        def __init__(self, id, type, value = None) -> None:
            self.ID = CoolID(id=id, type=type)
            self.id = id
            self.type = type
            self.value = value
            Node.__init__(self,values= self.childs())
        
        # def set_class(self, _class:CoolClass):
        #     self.father = _class 
        def childs(self):
            if self.value is None:
                return []
            return [self.value]
        def delete_condition(self):
            return False
        def __str__(self) -> str:
            return f'{self.ID} = {self.value}'        
        def __repr__(self) -> str:
            return f'{self.ID} = {self.value}'        

    class CoolDef(Node):
        def __init__(self, id, type, params, scope) -> None:
            self.ID = CoolID(id=id, type='Function')
            self.type = type
            self.scope = scope
            self.params = CoolParamsScope(params)
            Node.__init__(self,values= [params, scope])
        
        # def set_class(self, _class:CoolClass):
        #     self.father = _class

        def childs(self):
            return [self.params,self.scope]
        
        def delete_condition(self):
            return False
        def __str__(self) -> str:
            return f'{self.ID}():{self.type}'        
        def __repr__(self) -> str:
            return f'{self.ID}({self.params}):{self.type}'
#endregion

class CoolClass(Node):
    def __init__(self,type, inherit:str = 'object', features:list = None) -> None:
        self.type = type
        self.inherit = inherit #type in str format
        self.features = features
        Node.__init__(self,values=self.childs())

    def childs(self):
        return self.features
    
    def __str__(self) -> str:
        if self.inherit is None:
            return f'class {self.type}:'
        return f'class {self.type}({self.inherit}):'

    def __repr__(self) -> str:
        return str(self)

    def delete_condition(self):
        return False  

class CoolProgram(Node):
    def __init__(self, cclass_list:list[CoolClass]) -> None:
        self.classes = cclass_list 
        Node.__init__(self,values=self.childs())

    def childs(self):
        return self.classes
    
    def __str__(self) -> str:
        return f'PROGRAM'

    def __repr__(self) -> str:
        return str(self)

    def delete_condition(self):
        return False  
