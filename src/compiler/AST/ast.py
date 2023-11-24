import matplotlib.pyplot as plt
import AST.environment as env
# from semantic.context import Context

'''TODO
    1- Crear una estructura(class) para los let y los case, de ser posible usar la misma para classAtr
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

    def show_tree(self, only_root = False , print_context = False):
        if self.father is not None and only_root:
            self.father.show_tree()
        else:
            self.set_childs_pos()

            fig, ax = plt.subplots()
            self.print_node(fig, ax, print_context)
            plt.show()

    def print_node(self,fig, ax, print_context):
        # Crear un nodo en la posición draw_pos
        if print_context:
            ax.add_patch(plt.Circle(self.draw_pos, 1, fill=True, zorder=2))
            ax.text(self.draw_pos[0]-0.6, self.draw_pos[1], self.context_str(), ha='left', va='center')
        else:
            ax.add_patch(plt.Circle(self.draw_pos, 1, fill=True, zorder=2))
            ax.text(self.draw_pos[0], self.draw_pos[1], str(self), ha='center', va='center')

        for child in self.childs():
            #Crear una arista entre los dos nodos
            ax.plot([self.draw_pos[0], child.draw_pos[0]], [self.draw_pos[1], child.draw_pos[1]], color='black', zorder=1)

        for child in self.childs():
            child.print_node(fig, ax, print_context)

class Node(PlotNode):
    def __init__(self) -> None:
        super().__init__()
        self.type:str
        self.context:Context = None
        self.father:Node = None
        self.name = 'empty'
        self.is_valid = False
    
    def set_father(parent, childs:list):
        for child in childs:
            child.father = parent
            # child.context = parent.context
    
    def get_contex_from_father(self):
        self.context =  self.father.context

    def inherit_from_type(self,type):
        # if self.type == type:return True
        cclass = self.get_type_as_class()
        if cclass is None:
            return False         
        return cclass.inherit_from_type(type)

    def get_type_as_class(self):
        temp_cotext = self.context.get_context_from_type(self.type)
        if temp_cotext == False:
            return None
        else:
            return temp_cotext.cclass
    
    def get_type(self):
        return self.type

    def validate(self): #override this
        self.is_valid = True
        return True

    def childs(self):
        return [self.value]
    
    def context_str(self):
        if self.context is not None:
            return self.context.str_for_node()    
        else:
            return self.name

    def __str__(self) -> str:
        return str(self.value)

    def __repr__(self) -> str:
        return str(self)

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
        Node.__init__(self)
        self.value =  value
        self.name = 'expr'
        Node.set_father(self,self.childs())

    def __str__(self) -> str:
        return 'expr\n<-' + str(self.value)

class CoolVar(expr):
    def __init__(self, id:str,type, value) -> None:
        Node.__init__(self)
        self.id = id
        self.type = type
        self.value:expr = value
        if self.value is not None:
            Node.set_father(self,self.childs())

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
        Node.__init__(self)
        self.op = op
        self.name = op #debug
        self.left:expr = left
        self.right:expr = right
        self.valid_types_check = False
        Node.set_father(self,self.childs())

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

    def valid_types(self):
        if self.valid_types_check: return True

        l_type:str = self.left.get_type()
        r_type:str = self.right.get_type()
        if  l_type == r_type or  self.left.inherit_from_type(r_type) or self.right.inherit_from_type(l_type):
            self.type = l_type
            self.valid_types_check = True
            return True
        else:
            return False    
    
    def get_type(self):
        if self.valid_types():
            return self.type
        else:
            Exception('Invalid Operation')
            return None    
        
    def validate(self):
        self.get_contex_from_father()
        return self.context.validate_op(self)    
    
class Logicar(BinOp):    
    def __init__(self,op:str, left:expr, right:expr):
        Node.__init__(self)
        self.name = 'logicar' #debug
        self.op = op
        self.left:CoolID = left
        self.right:expr = right
        self.valid_types_check = False
        self.type = env.bool_type_name
        Node.set_father(self,self.childs())
    
    def get_type(self):
        return self.type
    
    def valid_types(self):
        if self.valid_types_check: return True

        l_type:str = self.left.get_type()
        r_type:str = self.right.get_type()
        if  l_type == r_type or  self.left.inherit_from_type(r_type) or self.right.inherit_from_type(l_type):
            self.valid_types_check = True
            return True
        else:
            return False
    
class Assign(BinOp):
    def __init__(self,op, left:expr, right:expr):
        Node.__init__(self)
        self.name = 'assign' #debug
        self.op = op
        self.left:CoolID = left
        self.right:expr = right
        self.valid_types_check = False
        self.type = env.void_type_name
        Node.set_father(self,self.childs())
    
    def get_type(self):
        return self.type
    
    def valid_types(self):
        if self.valid_types_check: return True

        l_type:str = self.left.get_type()
        r_type:str = self.right.get_type()
        if  l_type == r_type or self.right.inherit_from_type(l_type):
            self.valid_types_check = True
            return True
        else:
            return False   

class BetwPar(expr):
    def __init__(self, expr) -> None:
        Node.__init__(self)
        self.value = expr
        Node.set_father(self,self.childs())

    def __str__(self) -> str:
        return '()'

    def __repr__(self) -> str:
        return 'parents: ' + '('+ str(self.value) +')'

class CoolIf(expr):
    def __init__(self, if_condition, then_generation, else_generation = None) -> None:
        Node.__init__(self)
        self.condition = if_condition
        self.then_scope = then_generation
        self.else_scope = else_generation
        Node.set_father(self,self.childs())


    def childs(self):
        return [self.condition,self.then_scope,self.else_scope]

    def delete_child(self, child): #override in mutichlilds nodes
        if child == self.condition:
            self.condition = child.value
            self.condition.father = self

        elif child == self.then_scope:
            self.then_scope = child.value
            self.then_scope.father = self

        elif child == self.else_scope:
            self.else_scope = child.value
            self.else_scope.father = self

        else: Exception('Ocurrio un error al intentar eliminar un nodo')

    def __str__(self) -> str:
        return 'if - then - else'

    def __repr__(self) -> str:
        return f'if {self.condition}: {self.then_scope} \telse: {self.else_scope}'

class CoolWhile(expr):
    def __init__(self, while_condition, loop_scope) -> None:
        Node.__init__(self)
        self.condition = while_condition
        self.loop_scope = loop_scope
        Node.set_father(self,self.childs())

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
        Node.__init__(self)
        self.id:CoolID = CoolID(id)
        self.params:list[expr] = exprs
        Node.set_father(self,self.childs())
        Node.set_father(self,[self.id])


    def get_type(self):
        self.type = self.id.get_type()
        return self.type

    def childs(self):
        return self.params

    def __str__(self) -> str:
        return f'{self.id}()'

    def __repr__(self) -> str:
        return f'{self.id}({self.params})'

    def delete_condition(self):
        return False
    
    def validate(self):
        self.get_contex_from_father()
        return self.context.validate_callable(self)
    
    def validate_in_context(self, context):
        self.get_contex_from_father()
        return context.validate_callable(self)

class CoolNot(expr):
    def __init__(self, value) -> None:
        Node.__init__(self)
        self.value =  value
        Node.set_father(self,self.childs())

    def __str__(self) -> str:
        return 'not'

    def __repr__(self) -> str:
        return f'not {self.value}'

    def delete_condition(self):
        return False

class CoolUminus(expr):
    def __init__(self, value) -> None:
        Node.__init__(self)
        self.value =  value
        Node.set_father(self,self.childs())

    def __str__(self) -> str:
        return '~'

    def __repr__(self) -> str:
        return f'~{self.value}'

    def delete_condition(self):
        return False

class CoolIsVoid(expr):
    def __init__(self, value) -> None:
        Node.__init__(self)
        self.value =  value
        Node.set_father(self,self.childs())

    def __str__(self) -> str:
        return 'isVoid'

    def __repr__(self) -> str:
        return f'isVoid {self.value}'

    def delete_condition(self):
        return False

class CoolNew(expr):
    def __init__(self, type) -> None:
        Node.__init__(self)
        self.type =  type
        self.name = 'new'
        # self.value = CoolVar(id = None, type = type, value= None)
        Node.set_father(self,self.childs())

    def __str__(self) -> str:
        return f'new {self.type}'

    def __repr__(self) -> str:
        return f'new {self.type}'

    def delete_condition(self):
        return False

    def childs(self):
        return []
    
    def validate(self):
        self.get_contex_from_father()
        return self.context.is_defined_type(self.type)
    
class CoolCase(expr): #TODO raificar o no los hijos segun la necesidad para semantica y codegen
    def __init__(self, case, cases_list) -> None:
        self.case = case
        self.cases_list = self.convert_to_cases(cases_list)
        self.width = Node.WIDTH
        self.father = None
        self.draw_pos = (0,0)
        Node.set_father(self, self.childs())
        Node.set_father(self, [case])
    

    def convert_to_cases(self,cases_list):
        cases:list[(CoolID,expr)] = []
        for case in cases_list:
            cases.append((CoolID(case['ID'], case['Type']), case['expr']))
        return cases
    
    def childs(self):
        return self.cases_list

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
        Node.__init__(self)
        self.type = None #En este caso no va void, sino que es None por evaluar
        self.let = self.convert_to_vars(let)
        self.in_scope:expr = _in
        Node.set_father(self,self.childs())

    def convert_to_vars(self, let_list):
        vvars = []
        for let in let_list:
            vvars.append(CoolVar(let['ID'],let['Type'],let['expr']))
        Node.set_father(self,vvars)    
        return vvars
        
    def childs(self):
        return [self.in_scope]

    def __repr__(self) -> str:
        return 'let in'

    def __str__(self) -> str:
        result = 'let \n'
        for assign in self.let:
            if assign.value is None:
                result+= f'{assign.id}: {assign.type}\n'
            else:
                result+= f'{assign.id}: {assign.type} <- {assign.value}\n'
        return result + ' in:'

    def delete_condition(self):
        return False

    def new_let(ID, type, exp):
        return {'ID': ID, 'Type':type, 'expr':exp}
    
    def validate(self):
        return self.initialize()
    
    def initialize(self):
        self.get_contex_from_father()
        return self.context.define_let(self)
    
    def get_type(self):
        if self.type is not None:
            return self.type
        self.type = self.in_scope.get_type()
        return self.type

class CoolBlockScope(expr):
    def __init__(self, exprs:list[expr]) -> None:
        Node.__init__(self)
        self.exprs:list[expr] = exprs
        Node.set_father(self,self.childs())

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
    
    def validate(self):
        self.get_contex_from_father()
        result = True
        for exp in self.childs():
            if not exp.validate():
                result = False
        return result

class CoolID(CoolVar):
    def __init__(self, id, type = None) -> None:
        Node.__init__(self)
        self.name = 'id'
        self.id = id
        self.type = type
        self.width = Node.WIDTH
        self.value:expr = None
        self.father = None

    def __str__(self) -> str:
        return f'{self.id}: {self.type}'

    # def context_str(self):
    #     return self.name
    def get_type(self):
        if self.type == None:
            try:
                self.type = self.context.get_var(self.id)
            except:pass
            try:
                self.type = self.context.get_func(self.id)
            except:pass
        return self.type

    def set_type(self, type):
        self.type= type

    def __repr__(self) -> str:
        return str(self)

    def childs(self):
        return []
    
    def validate(self):
        self.get_contex_from_father()
        return self.context.validate_id(self)

class Dispatch(expr): #Dispatch
    def __init__(self, exp, type, function: CoolCallable) -> None:
        Node.__init__(self)
        self.name = 'dispatch'
        self.expr:expr = exp 
        self.type = type
        self.return_type = None
        self.function:CoolCallable = function
        Node.set_father(self,self.childs())

    def childs(self):
        return [self.expr,self.function]
    
    def __str__(self) -> str:
        return f'{self.expr}:{self.type}.{self.function}'
    def __repr__(self) -> str:
        return str(self)
    def delete_condition(self):
        return False
    
    def get_type(self):
        self.return_type = self.function.get_type()
        return self.return_type

    def validate(self):
        self.get_contex_from_father()
        return self.context.validate_dispatch(self)

class CoolConstant(expr):
    def __init__(self, value, name) -> None:
        self.value =  value
        self.width = Node.WIDTH
        self.type = name
        self.name = name
        self.father = None
        
    def context_str(self):
        return self.name    

    def __str__(self) -> str:
        return f'{self.name}'+ '{' +f'{self.value}' +'}'

    def __repr__(self) -> str:
        return str(self)

    def childs(self):
        return []

class IntNode(CoolConstant):
    def __init__(self, value) -> None:
        super().__init__(value,IntClass.type)

class CoolString(CoolConstant):
    def __init__(self, value) -> None:
        super().__init__(value,StringClass.type)

class CoolBool(CoolConstant):
    def __init__(self, value) -> None:
        super().__init__(value,BoolClass.type)
#endregion

#region Features
class CoolParamsScope(Node):
    def __init__(self, exprs:list[CoolID] = None) -> None:
        Node.__init__(self)
        self.exprs = exprs
        Node.set_father(self,self.childs())
    
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
            Node.__init__(self)
            self.ID = CoolID(id=id, type=type)
            self.id = id
            self.type = type
            self.value = value
            self.name = 'class_atr'
            Node.set_father(self,self.childs())

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
        
        def initialize(self):
            self.get_contex_from_father()
            return self.context.initialize_class_atr(self)
        
        def validate(self):
            #La valizacion de la variable se realiza en el proceso de inicializcion
            return True

    class CoolDef(Node):
        def __init__(self, id, type = 'SELF_TYPE', params=[], scope= None) -> None:
            Node.__init__(self)
            self.ID = CoolID(id=id, type='Function')
            self.type = type
            self.scope:expr = scope
            self.params = CoolParamsScope(params)
            Node.set_father(self,self.childs())

            self.name = 'class_func'

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
        
        def initialize(self):
            context = self.father.context.initialize_func(func= self)
            if context == False:
                self.context = None
                #Crear error semantico
                return False
            else:
                self.context = context
                return True
            
        def validate(self):
            return self.scope.validate()
#endregion

class CoolClass(Node):
    def __init__(self,type, inherit:str = 'object', features:list = None, is_object = False) -> None:
        Node.__init__(self)
        self.features = features
        self.type = type
        self.inherit = inherit #type in str format
        if not is_object:
            self.inherit_class:CoolClass = ObjectClass.instance
        else:
            self.inherit_class:CoolClass = None

        self.features_was_initialized = False
        Node.set_father(self,self.childs())

    def inherit_from_type(self,type):
        '''Devuelve true si alguna clase padre es de tipo type, deuelve false si ninguna de estas es tipo type'''
        return self.have_father(cclass_type= type)
            
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
    
    def validate(self):
        result = True
        for feature in self.childs():
            if not feature.validate():
                result = False
        return result    

    def initialize_features(self):
        if self.features_was_initialized: return True #si trata de inicializar nuevamente los features.
        if self.inherit_class is not None and self.inherit_class != ObjectClass.instance:
           #Si hereda de una clase primero debe ser inicializada la clase padre, para usar los features de la misma, por ejemplo, para el caso de override funciones
           self.inherit_class.initialize_features()
        
        for child in self.childs():
            child.initialize()
            #En esta linea de la condicional el feature se inicializa, si da error al inicializarse devuelve False
            # if not child.initialize():
            #     return False

        self.features_was_initialized = True
        
    def initialize(self):
        self.father.context.initialize_class(cclass = self)
        a=1
        # context = self.father.context.initialize_class(cclass = self)
        # if context == False:
        #     self.context = None
        #     #Crear error semantico
        #     return False
        # else:
        #     self.context = context
        #     return True
    
    def set_parent_class(self, inherit):
        self.inherit_class = inherit

    def set_inherits(self):
        return self.context.set_inherits_class(self.inherit)
    
    def have_father(self,cclass = None, cclass_type = None):
        if cclass is not None and self.inherit_class == cclass: return True
        if cclass_type is not None and self.inherit == cclass_type: return True
        
        if self.inherit_class == None or self.inherit == 'object' : return False
        return self.inherit_class.have_father(cclass,cclass_type)
    
class CoolProgram(Node):
    def __init__(self, cclass_list:list[CoolClass]) -> None:
        self.type:str= 'program'
        self.context:Context = Program.context
        self.father:Node = None
        self.name = 'program'
        self.draw_pos = (0,0)

        self.classes = self.set_classes(cclass_list)
        Node.set_father(self,self.childs())

    def set_classes(self, input_classes):
        classes = [cclass for cclass in base_classes()]
        for cclass in input_classes: classes.append(cclass)
        return classes

        
    def childs(self):
        return self.classes

    def __str__(self) -> str:
        return f'PROGRAM'

    def __repr__(self) -> str:
        return str(self)

    def delete_condition(self):
        return False
    
    def validate(self):
        result = True
        for cclass in self.childs():
            if not cclass.validate():
                result = False
        return result    

from semantic.cool_bases import Context,ObjectClass,IntClass, StringClass,BoolClass, Program, base_classes