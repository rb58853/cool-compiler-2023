import AST.environment as env
from error.cool_error import SemanticError
from semantic.special_cases import case_case, if_case, case_multiple_types
from AST.ast import Feature, CoolClass, CoolString, CoolVar, CoolID, BinOp, IntNode, CoolBool, CoolCallable, Dispatch, Assign, Node, CoolLet, CoolCase, CoolIf, expr, CoolWhile, CoolNew

class VariableContext():
    def __init__(self, father) -> None:
        self.types:dict[str:Context] = {}
        self.functions:dict[str:Feature.CoolDef] = {}
        self.variables:dict[str:CoolVar] = {}
        self.father:Context = father
        self.type = env.object_type_name 
        self.name = None
        self.cclass:CoolClass = None

    def define_var(self, vvar:CoolVar, atr_case = False):
        if (atr_case and not self.is_defined_var(vvar.id)) or (not atr_case and not self.variables.__contains__(vvar.id)):
            if vvar.value is None:
                #por ahora las variables se inicializan en None, en futuros pasos se pueden inicializar con el valor default de cada type
                if self.is_defined_type(vvar.type):                
                    self.variables[vvar.id] = vvar
                    return True
                else:
                    SemanticError(
                                pos=vvar.type_pos[1],
                                lineno=vvar.type_pos[0]
                                )(f"TypeError: Class {vvar.type} of attribute c is undefined.")
                    return False
            else:
                if not atr_case:
                    #Esto no se pude hacer durante la inicializacion de los atributos de clase
                    if not vvar.value.validate():return False

                    if isinstance(vvar.value.get_type(), list):
                        l_type = vvar.get_type()
                        return case_multiple_types(vvar.value, l_type)

                    if vvar.value.get_type() == vvar.type or vvar.value.inherit_from_type( vvar.get_type()):
                        self.variables[vvar.id] = vvar
                        return True
                    else:
                        SemanticError(
                                    pos=vvar.value.token_pos[1],
                                    lineno=vvar.value.token_pos[0]
                                    )(f"TypeError: Inferred type {vvar.value.get_type()} of initialization of attribute {vvar.id} does not conform to declared type {vvar.type}.")
                        return False
                else:
                    #si es un atributo
                    self.variables[vvar.id] = vvar
                    return True    
        else:
            if atr_case:
                SemanticError(pos=vvar.token_pos[1],
                            lineno=vvar.token_pos[0]
                            )(f"SemanticError: Attribute {vvar.id} is multiply defined in class.")
            else:
                SemanticError(pos=vvar.token_pos[1],
                            lineno=vvar.token_pos[0]
                            )(f"SemanticError: Formal parameter {vvar.id} is multiply defined.")
            return False #ERROR or Redefine

    def is_defined_var(self, id):
        if self.variables.__contains__(id): return True
        if self.father is None: return False
        else: return self.father.is_defined_var(id)
    
    def get_var(self, id):
        if self.variables.__contains__(id): return self.variables[id]
        if self.father is None: return False
        else: return self.father.get_var(id)

    def initialize_class_atr(self, vvar: CoolVar):
        '''Una vez se utiliza este metodo la variable se define en el contexto'''
        if  vvar.id == 'self' :
            SemanticError(pos=vvar.token_pos[1],
                            lineno=vvar.token_pos[0]
                            )(f"SemanticError: 'self' cannot be the name of an attribute.")
            return False
        return self.define_var(vvar,atr_case= True)
    
    def initialize_let_var(self):
        pass

    def validate_atr(self, vvar:Feature.CoolAtr):
        if vvar.value is None:
            #Por ahora se inicializa en None, mas adelante estas lineas no seran necesarias
            return True
        if not vvar.value.validate():
            return False
        
        if isinstance(vvar.value.get_type(), list):
            l_type = vvar.get_type()
            return case_multiple_types(vvar.value, l_type)
        
        if vvar.value.get_type() == vvar.type or vvar.value.inherit_from_type( vvar.get_type()):
            self.variables[vvar.id] = vvar
            return True
        else:
            SemanticError(
                        pos=vvar.value.token_pos[1],
                        lineno=vvar.value.token_pos[0]
                        )(f"TypeError: Inferred type {vvar.value.get_type()} of initialization of attribute {vvar.id} does not conform to declared type {vvar.type}.")
            return False

class TypeContext(VariableContext):
# class TypeContext(VariableContext):
    def define_type(self, cclass:CoolClass, use_inherit = False):
        '''
        USE: se llama desde `context_in` -contexto en el cual se va a definir la clase, el contexto del program en este caso\n
        INPUT: `self` -La propia clase en cuesion \n
        OUTPUT: `context_out` -devuelve el contexto propio de la clase en funcion hijo de una clase heredada o del program
        \nEJEMPLO:
        `context = father.context(self)`
        '''
        if not self.is_defined_type(cclass.type):
            contex:Context
            if cclass.inherit is not None and use_inherit:
                if not self.is_defined_type(cclass.inherit):

                    return False #La clase desde la cual se quiere heredar no esta definida (Esto hay que cambiarlo en caso de que se pueda, entonces hay que hacer recorrido de clases dos veces)
                else:
                    #Si esta heredando de una clase padre esta clase padre debe tener un padre que es exactamente el contexto self, Dado que una clase solo se declara en program entonces la clase o bien posee el contexto del program como padre o bien posee una clase que posee al contexto de program en algun padre sperior recursivamente. De esta forma se garantiza la herencia de contextos y del contexto padre final. Esto es posible xq en Cool dentro de una clase no se puden definir otras clases.
                    contex = self.get_context_from_type(cclass.inherit).create_context_child()
            else:
                if cclass.type != env.object_type_name :
                    contex = self.get_context_from_type(env.object_type_name ).create_context_child()
                else:
                    contex = self.create_context_child()

            #se crea un contexto propio para la clase que posee como padre un contexto mas amplio, este contexto padre solo tendra clases definidas o variables de una clase desde la cual se hace herencia.
            contex.type = cclass.type
            contex.name = cclass.type
            contex.cclass = cclass
            self.types[cclass.type] = contex
            contex.types[env.self_type_name] = contex #Cada contexto se va a tener a si mismo como SELF_TYPE
            contex.variables[env.self_name] = Feature.CoolAtr(env.self_name,cclass.get_type(),None) #Cada clase tiene el atributo self, que es de su mismo tipo
            cclass.context = contex
            return True
        else:
            if cclass.type in env.base_classes:
                SemanticError(pos=cclass.type_pos[1],
                            lineno=cclass.type_pos[0]
                            )(f'SemanticError: Redefinition of basic class {cclass.type}.')
            else:
                SemanticError(pos=cclass.token_pos[1]+4,
                            lineno=cclass.token_pos[0]
                            )(f'SemanticError: Classes may not be redefined')
            return False #ERROR Ya esta definida esta clase no se puede usar el mismo nombre
    
    def set_inherit(self,type:str):
        if self.type == type:
            SemanticError(pos=self.cclass.inherit_pos[1],
                        lineno=self.cclass.inherit_pos[0]
                        )(f'SemanticError: Class {self.type}, or an ancestor of {self.type}, is involved in an inheritance cycle.')
            return False
        
        # if type != env.object_type_name  and type != None:
        if type != None:
            context_in = self.get_context_from_type(type)
            if context_in != False:
                cclass:CoolClass = context_in.cclass
            else:
                SemanticError(pos=self.cclass.inherit_pos[1],
                        lineno=self.cclass.inherit_pos[0]
                        )(f'TypeError: Class {self.type} inherits from an undefined class {type}.')
                return False #La clase desde la cual se quiere heredar no esta definida (Esto hay que cambiarlo en caso de que se pueda, entonces hay que hacer recorrido de clases dos veces)

            if cclass.have_father(cclass = self.cclass): 
                SemanticError(pos=self.cclass.inherit_pos[1],
                        lineno=self.cclass.inherit_pos[0]
                        )(f'SemanticError: Class {self.type}, or an ancestor of {self.type}, is involved in an inheritance cycle.')
                # raise Exception(f'Circular inherit-> {self.cclass} inherits {cclass}')
                return False
            
            #Si esta heredando de una clase padre esta clase padre debe tener un padre que es exactamente el contexto self, Dado que una clase solo se declara en program entonces la clase o bien posee el contexto del program como padre o bien posee una clase que posee al contexto de program en algun padre sperior recursivamente. De esta forma se garantiza la herencia de contextos y del contexto padre final. Esto es posible xq en Cool dentro de una clase no se puden definir otras clases.
            self.father = self.get_context_from_type(cclass.type)
            self.cclass.set_parent_class(cclass)
            return True

    def is_defined_type(self,type):
        if type == 'SELF_TYPE': return True
        if self.types.__contains__(type): return True
        if self.father is None: return False
        else: return self.father.is_defined_type(type)

    def create_context_child(self, name = None):
        #Estoy ubicado sobre el contexto en el cual se va a definir la clase, lo que sera el program o una clase padre
        context = Context(father = self) 
        if name is None:
            context.name = f"child of {self.name}"
        else:
            context.name = f"{name} <- {self.name}"
        return context

    def get_context_from_type(self, type):
        if self.types.__contains__(type):
            return self.types[type]
        elif self.father is None:
            # raise Exception('No existe el type buscado en ningun contexto accesible')
            return False
        else:
            return self.father.get_context_from_type(type)
        
    def initialize_class(self, cclass: CoolClass, use_inherit = False):
        '''Si devuelve False entonces no es valida esta clase, si no devuelve false entonces la salida es el contexto de la misma, por o tanto el metodo validate que usa este metodo como base debe encargarse de generar el nuevo contexto en caso de ser `not False` la salida desde aqui. Luego quedaria algo como:\n
            ```
            CoolClass.validate():
                context = context.validate_class(self)
                if context == False:
                    return False
                esle:
                    self.context = context
                    return True
            ```
        - nota: si se `use_inherit = True` entonces la clase sera valida si existe de quien heredar declarado, en caso contrario no se tendra en cuenta de quien esta heredando. Esto sirve para hace un primer recorrido sin tener en cuenta la herencia para asi definir los tipos, y luego hacer el recorrido teniendo en cueta la herencia.    
        '''
        if cclass.type == env.self_type_name:
            SemanticError(pos=cclass.type_pos[1],
                            lineno=cclass.type_pos[0]
                            )(f'SemanticError: Cannot defined Class TYPE_NAME')
            return False
        return self.define_type(cclass, use_inherit)
    
    def set_inherits_class(self, cclass_type: str):
        if cclass_type == env.self_type_name:
            SemanticError(pos=self.cclass.type_pos[1],
                            lineno=self.cclass.type_pos[0]
                            )(f'SemanticError: Cannot inherits from TYPE_NAME')
            return False
        return self.set_inherit(cclass_type)

class FunctionContext(TypeContext):
    def define_func(self, func: Feature.CoolDef):
        '''
        USE: se llama desde `context_in` -contexto en el cual se va a definir la funcion, el contexto de la clase padre\n
        INPUT: `self` -La propia funcion en cuesion \n
        OUTPUT: `context_out` -devuelve el contexto propio de la funcion
        \nEJEMPLO:
        `context = father.context(self)`
        '''
        if self.is_function_writable(func):
            if not self.is_defined_type(func.type):
                SemanticError(pos=func.type_pos[1],
                        lineno=func.type_pos[0]
                        )(f'TypeError: Undefined return type {func.type} in method {func.ID.id}.')
                # raise Exception(f'El type {func.type} de la funcion {func} no existe en el contexto')
                return False #Error, el parametro p trata de usar un tipo no defnido    
            
            context:Context = self.create_context_child()
            #Los parametros a la hora de crear una funcion siempre seran validos dado que sintacticamente estan reinstringidos a ser de a fora ID:TYPE
            for param in func.params.exprs:
                p:CoolID = param
                
                if  p.id == 'self' :
                    SemanticError(pos=p.token_pos[1],
                            lineno=p.token_pos[0]
                            )(f"SemanticError: 'self' cannot be the name of a formal parameter.")
                    return False
                
                if self.valid_param(p):
                    context.define_var(p)
                else:
                    SemanticError(pos=p.type_pos[1],
                        lineno=p.type_pos[0]
                        )(f'TypeError: Class {p.type} of formal parameter {p.id} is undefined.')
                    # raise Exception(f'el parametro {p} trata de usar un tipo ({p.type}) no defnido en el contexto ')
                    return False #Error, el parametro p trata de usar un tipo no defnido    
            
            self.functions[func.ID.id] = func
            context.name = str(func)
            return context  #define la funcion y devuelve el nuevo contexto interno de esta, hijo del contexto desde el cual fue definida la funcion, lo cal seria el contexto de una clase
        else:
            return False     
    
    def valid_param(self, param: CoolID):
        return self.is_defined_type(param.type)

    def is_defined_func(self, id):
        #Una funcion solo puede ser defina dentro de una clase, luego el contexto que abarca es o bien la clase en la cual es definida, o bien una clase desde la cal se hereda. Notese que pueden existir funciones de igual nombre en clases distintas y no abra conflctos mientras no haya herencia entre estas, en cuyo caso hay que analizar si es valido el override
        if self.functions.__contains__(id): return True
        if self.father is None: return False
        else: return self.father.is_defined_func(id)
    
    def is_function_writable(self, func:Feature.CoolDef):
        #Hay que hacer lo de override
        if self.functions.__contains__(func.ID.id):
            SemanticError(pos=func.token_pos[1],
                        lineno=func.token_pos[0]
                        )(f'SemanticError: Method {func.ID.id} is multiply defined.')
            return False
        if not self.is_defined_func(func.ID.id):
            return True
        inherit_func:Feature.CoolDef = self.get_func(func.ID.id)

        if len(inherit_func.params.childs()) != len(func.params.childs()):
            SemanticError(pos = func.token_pos[1],
                   lineno = func.token_pos[0]
                   )(f"SemanticError: Incompatible number of formal parameters in redefined method {func.ID.id}.")
            return False
        
        if inherit_func.type != func.type:
            SemanticError(pos = func.type_pos[1],
                   lineno = func.type_pos[0]
                   )(f"SemanticError: In redefined method {func.ID.id}, return type {func.type} is different from original return type {inherit_func.type}.")
            return False

        for inherit_param, new_param in zip (inherit_func.params.childs(), func.params.childs()):
            if inherit_param.type != new_param.type:
                SemanticError(pos = new_param.token_pos[1],
                   lineno = new_param.token_pos[0]
                   )(f"SemanticError: In redefined method {func.ID.id}, parameter type {new_param.type} is different from original type {inherit_param.type}.")
                return False
        return True    

    def get_func(self, id):
        if self.functions.__contains__(id): 
            return self.functions[id]
        if self.father is None: return False
        else: return self.father.get_func(id)

    def initialize_func(self, func: Feature.CoolDef):
        '''Si devuelve False entonces no es valido esta funcion, si no devuelve false entonces la salida es el contexto de esta funcion, por o tanto el metodo validate que usa este metodo como base debe encargarse de generar el nuevo contexto en caso de ser `not False` la salida desde aqui. Luego quedaria algo como:\n
            ```
            Feature.CoolDef.validate():
                context = context.validate_func(self)
                if context == False:
                    return False
                esle:
                    self.context = context
                    return True
            ```
        '''
        return self.define_func(func)    

class LetContext(FunctionContext):
    def define_let_var(self,vvar:CoolVar):
        if  vvar.id == 'self' :
            SemanticError(pos=vvar.token_pos[1],
                            lineno=vvar.token_pos[0]
                            )(f"SemanticError: 'self' cannot be bound in a 'let' expression.")
            return False
        
        #las variables en el let se sobreescriben, por ejemplo let x:Int<-1, x:Int<-2 in x.... x sera 2 y no dara error por usarla dos veces
        if not vvar.validate():
            SemanticError(pos=vvar.type_pos[1],
                        lineno=vvar.type_pos[0]
                        )(f"TypeError: Class {vvar.get_type()} of let-bound identifier {vvar.id} is undefined.")
        if vvar.value is None:
            self.variables[vvar.id] = vvar
            return True
        else:
            if vvar.value.validate() and (vvar.value.get_type() == vvar.type or vvar.value.inherit_from_type(vvar.type)):
                self.variables[vvar.id] = vvar
                return True
            else:
                SemanticError(pos=vvar.value.token_pos[1],
                        lineno=vvar.value.token_pos[0]
                        )(f"TypeError: Inferred type {vvar.value.get_type()} of initialization of b does not conform to identifier's declared type {vvar.type}.")
                return False
            
    def define_let(self, let: CoolLet):
        left = let.let
        scope = let.in_scope
        let.context = self.create_context_child(repr(let))
        for vvar in left:
            let.context.define_let_var(vvar)
        
        return scope.validate()    
    
class CaseContex(LetContext):
    def define_and_validate_case(self, case: CoolCase):
        left:expr = case.case
        cases:dict[CoolID:expr] = case.cases_list
        case.context = self.create_context_child()
        
        if not left.validate(): return False
        for key in cases.keys():
            case.context.define_case_var(key)
                
        for key in case.context.variables:
            vvar:CoolID = cases[case.context.variables[key]]
            if not vvar.validate(): return False
            case.possible_types.append(self.get_context_from_type(vvar.get_type()).cclass)
        return True    
        
    def define_case_var(self,vvar:CoolID):
        #las variables en el case se sobreescriben, ocultan la anterior definicion, por ejemplo case x of a:Int=>expr, a:String=>expr, a sera entonces la ultima declarada 
        if  vvar.id == 'self' :
            SemanticError(pos=vvar.token_pos[1],
                    lineno=vvar.token_pos[0]
                    )(f"SemanticError: 'self' cannot be bound in a 'case' expression.")
            return False
        
        if not self.is_defined_type(vvar.get_type()):
            SemanticError(pos=vvar.type_pos[1],
                        lineno=vvar.type_pos[0]
                        )(f"TypeError: Class {vvar.get_type()} is undefined.")
        #   raise Exception(f"Se esta tratando de usar un tipo que no esta defnido {vvar.get_type()}")
            return False
            
        if not self.contex_have_same_type(vvar.type):
            #En un case no pueden aprecer dos tipos iguales
            self.variables[vvar.id] = vvar
            return True
        else:
            SemanticError(pos=vvar.type_pos[1],
                        lineno=vvar.type_pos[0]
                        )(f"SemanticError: Duplicate branch {vvar.type} in case statement.")
            # raise Exception(f"Se esta tratando de duplicar el tipo {vvar.type} en un mismo case")
            return False
    
    def contex_have_same_type(self,type):
        for v in self.variables:
            if self.variables[v].type == type:
                return True
        return False
        
class PrintContext(CaseContex):
    def print(self):
        print (f'_____________________________________________________________________________________')
        print (f'{self} \n')
        print('---------- TYPES ----------\n')
        if len(self.types) == 0:
            print('<empty>}\n')
        else:
            for type in self.types:
                print(f'{type}: {self.types[type]}\n')
        
        print('\n---------- FUNTIONS ----------\n')
        if len(self.functions) == 0:
            print('<empty>}\n')
        else:
            for func in self.functions:
                print(f'{func}: {self.functions[func]}\n')
        
        print('\n---------- VARIABLES ----------\n')
        if len(self.variables) == 0:
            print('<empty>}\n')
        else:
            for vvar in self.variables:
                print(f'{vvar}: {self.variables[vvar]}\n')
        
        print (f'_____________________________________________________________________________________')

    def __str__(self) -> str:
        if self.name is not None:
            return self.name
        else:
            return str(self.cclass)
        
    def __repr__(self) -> str:
        return self.__str__()
        
    def str_for_node(self, dinstict_context = True):
        if not dinstict_context: return 'same parent context'

        result = self.name
        result += '\n___________________\n'
        if len(self.types) > 0:
            result+='TYPES:\n'
            for type in self.types:
                result+=f' -{type}:...\n'
        
        if len(self.functions) >0:
            result+='\nFUNcTIONS:\n'
            for func in self.functions:
                result+=f'{func}: {self.functions[func]}\n'
        
        if len(self.variables) > 0:
            result+='\nVARIABLES: \n'
            for vvar in self.variables:
                result+=f' -{vvar}: {self.variables[vvar]}\n'
        
        return result

class Context(PrintContext):
    def __init__(self, father = None) -> None:
        VariableContext.__init__(self=self, father=father)

    def validate_string(self, s: CoolString): return True
    def validate_int(self, x: IntNode): return True
    def validate_bool(self, b: CoolBool): return True
    
    def validate_id(self, cool_id: CoolID):
        vvar = self.get_var(cool_id.id)
        if vvar != False:
            cool_id.type = vvar.type #esto le da type al id. 
            # cool_id.value = vvar.value #esto le da valor al id. Valorar quitar esto
            #cool_id = vvar #Esto es lo que me gustaria hacer 
            return True
        else:
            SemanticError(pos=cool_id.token_pos[1],
                        lineno=cool_id.token_pos[0]
                        )(f"NameError: Undeclared identifier {cool_id.id}.")
            return False
    
    def validate_op(self, op: BinOp, e:str = None):
        if op.left.validate() and op.right.validate() and op.valid_types():
            return True
        else:
            return False
    
    def validate_assign(self, assing:Assign):
        if assing.left.id == 'self' :
            SemanticError(pos=assing.op_pos[1],
                            lineno=assing.op_pos[0]
                            )(f"SemanticError: Cannot assign to 'self'.")
            return False
         
        if not assing.left.validate():return False
        if not assing.right.validate():return False
        
        valid_types = assing.valid_types()
        if not valid_types:
            SemanticError(pos=assing.op_pos[1],
                            lineno=assing.op_pos[0]
                            )(f'Se esta intentando hacer una asignacion al id {assing.left.id} un valor de tipo {assing.right.get_type()}')
            return False
        
        return True

    def validate_callable(self, obj: CoolCallable):
        #Cada parametro llama a la funcion validate que esta tiene su propio contexto, es decir en caso de dispach los parametros se evaluara si existen en su contexto
        func:Feature.CoolDef = self.get_func(obj.id.id)
        
        token_pos_0 = obj.token_pos[0]
        token_pos_1 = obj.token_pos[1]

        if func != False:
            obj.id.set_type(func.type)
            # obj.type = func.get_type()
            if len(func.params.childs()) == len(obj.params):
                for param_func, param_call in zip(func.params.childs(), obj.params):
                    if not param_call.validate(): return False #si el parametro no es valido entonces la llamada con este parametro no es valida, es necesario validar cada parametro xq con la validacion del mismo se llega a su tipo en caso de ser un id.               
                    if param_func.get_type() != param_call.get_type() and not param_call.inherit_from_type(param_func.get_type()):
                        SemanticError(pos=param_call.token_pos[1],
                        lineno=param_call.token_pos[0]
                        )(f'TypeError: In call of method alphabet, type {param_call.get_type()} of parameter {param_func.id} does not conform to declared type {param_func.type}.')
             
                        # raise Exception (f'Los parametros {param_func} y {param_call} tienen tipo diferente ')
                        return False
            else: 
                SemanticError(pos=token_pos_1,
                        lineno=token_pos_0
                        )(f'SemanticError: Method {obj.id.id} called with wrong number of arguments.')
                # raise Exception (f'La cantidad de parametros con los cuales se llama {obj.id.id} es invalida ')
                return False            
        else: 
            SemanticError(pos=token_pos_1,
                        lineno=token_pos_0
                        )(f'AttributeError: Dispatch to undefined method {obj.id.id}.')# {self.cclass}')
            # raise Exception (f'El la funcion {obj.id.id} no esta definida en la clase {self.cclass}')
            return False
        return True
    
    def validate_dispatch(self, dispatch: Dispatch):
        #TODO este dispatch funciona bien para la semantica, pero de ser posible: implementarlo para encaminar mejor la generacion de codigo
        name = dispatch.expr.name 

        if not dispatch.expr.validate():
            # SemanticError(pos=dispatch.expr.token_pos[1],
            #             lineno=dispatch.expr.token_pos[0]
            #             )(f'La expresion del dispatch {dispatch.expr} no es valida')
            return False    
        
        type = dispatch.expr.get_type()
        
        if dispatch.type is None:
            dispatch.type = type
        else:
            if dispatch.type != type and not dispatch.expr.inherit_from_type(dispatch.type):
                SemanticError(pos=dispatch.token_pos[1],
                        lineno=dispatch.token_pos[0]
                        )(f'TypeError: Expression type {type} does not conform to declared static dispatch type {dispatch.type}.')
                return False
            

        # if type != dispatch.type: return False #El tipo de la variable es diferente al tipo el cual se asume que debe ser [@TYPE]
        
        context:Context = self.get_context_from_type(dispatch.type)#Si el type es valido, entonces quiero el cotexto
        if context != False:
            #este es exactamente el contexo al que pertenece la funcion que se esta llamando. 
            # return context.validate_callable(dispatch.function)
            return dispatch.function.validate_in_context(context)
        else:
            SemanticError(pos=dispatch.token_pos[1],
                        lineno=dispatch.token_pos[0]
                        )(f'El tipo {type} no esta definido')
            # raise Exception(f'El tipo {type} no esta definido')
            return False
    
    def validate_if(self, _if: CoolIf):
        condition:expr = _if.condition
        then_scope:expr = _if.then_scope
        else_scope:expr = _if.else_scope

        if not condition.validate(): return False
        if condition.get_type() != env.bool_type_name and not condition.inherit_from_type(env.bool_type_name):
            SemanticError(pos=condition.token_pos[1],
                        lineno=condition.token_pos[0]
                        )(f"TypeError: Predicate of 'if' does not have type Bool.")
            return False
        if not then_scope.validate(): 
            return False
        if not else_scope.validate(): 
            return False    
        
        return True
    
    def validate_while(self, _while: CoolWhile):
        condition:expr = _while.condition
        loop_scope:expr = _while.loop_scope

        if not condition.validate(): return False
        if condition.get_type() != env.bool_type_name and not condition.inherit_from_type(env.bool_type_name):
            SemanticError(pos=condition.token_pos[1],
                        lineno=condition.token_pos[0]
                        )(f"TypeError: Loop condition does not have type Bool.")
            return False
        if not loop_scope.validate(): return False
        return True
    
    def validate_new(self, _new:CoolNew):
        if not self.is_defined_type(_new.type):
            SemanticError(pos=_new.type_pos[1],
                        lineno=_new.type_pos[0]
                        )(f"TypeError: 'new' used with undefined class {_new.type}.")
            return False
        else:
            return True
   
def info():
    '''
    IMPLEMENTACIONES
    - En cool todas las clases heradan de `object`, `object` es el hijo unico del contexto program, de esta manera siempre se llegara al `program` desde cualquier objeto, program tiene definido los objetos base de cool con sus funcionalidades correspondientes, como son `lenght()`, `concat()` en caso de strings.
    
    - Cada clase hereda el contexto de su clase padre, cuando una clase no hereda directamente de otra, entonces la misma hereda de `object`. Las clases base como `Int` y `String` heredan su contexto de `Program`
    
    - En las validaciones se asignaan valores a los id de llamadas que estan sueltos, por ejemplo si se declaro: \n
        \t`a:INT = 3;`\n
        \t`print(f(a))` #En este caso el `id(a)` pasa a tener el tipo y el valor que le fue definido anteriormente     

    \n PENDIENTES:
    - Implementar el metodo `is_function_override`
    '''