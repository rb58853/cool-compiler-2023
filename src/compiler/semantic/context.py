from AST.ast import Feature, CoolClass, CoolString, CoolVar, CoolID, BinOp, IntNode, CoolBool, CoolCallable, Dispatch, Assign, Node

class VariableContext():
    def __init__(self, father) -> None:
        self.types:dict[str:Context] = {}
        self.functions:dict[str:Feature.CoolDef] = {}
        self.variables:dict[str:CoolVar] = {}
        self.father:Context = father
        self.type = 'object'
        self.name = None
        self.cclass:CoolClass = None

    def define_var(self, vvar:CoolVar, atr_case = False):
        #Las variables pueden repetirse en contextos hijos-padre en caso de no ser un atributo de una clase(en dicho caso no queda claro), en caso de no ser asi usar la linea comentada y comentar la condicion que se usa actualmente
        # if (atr_case and not self.is_defined_var(vvar.id)) or (not atr_case and not self.variables.__contains__(vvar.id)):
        if not self.variables.__contains__(vvar.id):
            if vvar.value is None:
                #por ahora las variables se inicializan en None, en futuros pasos se pueden inicializar con el valor default de cada type
                self.variables[vvar.id] = vvar
                return True
            else:
                if (vvar.value.validate() and vvar.value.get_type() == vvar.type):
                    self.variables[vvar.id] = vvar
                    return True
        else:
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
        return self.define_var(vvar,atr_case= True)
    
    def initialize_let_var(self):
        pass

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
                if cclass.type != 'object':
                    contex = self.get_context_from_type('object').create_context_child()
                else:
                    contex = self.create_context_child()

            #se crea un contexto propio para la clase que posee como padre un contexto mas amplio, este contexto padre solo tendra clases definidas o variables de una clase desde la cual se hace herencia.
            print ("Agrego el tipo "+cclass.type)
            contex.type = cclass.type
            contex.name = cclass.type
            contex.cclass = cclass
            self.types[cclass.type] = contex
            cclass.context = contex
            return contex
        else:
            raise Exception(f'No se pueden definir clases con el mismo nombre, la clase {cclass.type} ya existe')
            return False #ERROR Ya esta definida esta clase no se puede usar el mismo nombre
    
    def set_inherit(self,type:str):
        if type != 'object' and type != None:
            context_in = self.get_context_from_type(type)
            if context_in != False:
                cclass:CoolClass = context_in.cclass
            else:
                print ('error: No existe la clase desde la cual se quiere heredar') 
                return False #La clase desde la cual se quiere heredar no esta definida (Esto hay que cambiarlo en caso de que se pueda, entonces hay que hacer recorrido de clases dos veces)

            if cclass.have_father(cclass = self.cclass): 
                raise Exception(f'Circular inherit-> {self.cclass} inherits {cclass}')
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

    def create_context_child(self):
        #Estoy ubicado sobre el contexto en el cual se va a definir la clase, lo que sera el program o una clase padre
        return Context(father = self)

    def get_context_from_type(self, type):
        if self.types.__contains__(type):
            return self.types[type]
        elif self.father is None:
            Exception('No existe el type buscado en ningun contexto accesible')
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
        return self.define_type(cclass, use_inherit)
    
    def set_inherits_class(self, cclass_type: str):
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
                raise Exception(f'El type {func.type} de la funcion {func} no existe en el contexto')
                return False #Error, el parametro p trata de usar un tipo no defnido    
            
            self.functions[func.ID.id] = func
            context:Context = self.create_context_child()
            #Los parametros a la hora de crear una funcion siempre seran validos dado que sintacticamente estan reinstringidos a ser de a fora ID:TYPE
            for param in func.params.exprs:
                p:CoolID = param
                if self.valid_param(p):
                    context.define_var(p)
                else:
                    raise Exception(f'el parametro {p} trata de usar un tipo ({p.type}) no defnido en el contexto ')
                    return False #Error, el parametro p trata de usar un tipo no defnido    
            context.name = str(func)
            return context  #define la funcion y devuelve el nuevo contexto interno de esta, hijo del contexto desde el cual fue definida la funcion, lo cal seria el contexto de una clase
        else:
            raise Exception(f'El nombre {func.ID.id} ya es utilizado por otra funcion en el contexto, Cool no admite sobrecarga de metodos')
            return False #Error: El type de la funcion no existe en el contexto    
    
    def valid_param(self, param: CoolID):
        return self.is_defined_type(param.type)

    def is_defined_func(self, id):
        #Una funcion solo puede ser defina dentro de una clase, luego el contexto que abarca es o bien la clase en la cual es definida, o bien una clase desde la cal se hereda. Notese que pueden existir funciones de igual nombre en clases distintas y no abra conflctos mientras no haya herencia entre estas, en cuyo caso hay que analizar si es valido el override
        if self.functions.__contains__(id): return True
        if self.father is None: return False
        else: return self.father.is_defined_func(id)
    
    def is_function_writable(self, func:Feature.CoolDef):
        #Hay que hacer lo de override
        return not self.is_defined_func(func.ID.id)

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
    
class PrintContext(FunctionContext):
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
            cool_id.value = vvar.value #esto le da valor al id. Valorar quitar esto
            #cool_id = vvar #Esto es lo que me gustaria hacer 
            return True
        else:
            raise Exception(f"El id {cool_id.id} no esta definido")
            return False
    
    def validate_op(self, op: BinOp, e:str = None):
        
        if op.left.validate() and op.right.validate() and op.valid_types():
            return True
        else:
            if not op.valid_types():
                raise Exception(f'No se puede usar el operador {op.op} para valores de tipo {op.left.get_type()} y {op.right.get_type()}')
    
    def validate_assign(self, assing:Assign):
        valid_types = assing.valid_types()
        if not valid_types:
            raise Exception(f'Se esta intentando hacer una asignacion al id {assing.left.id} un valor de tipo {assing.right.get_type()}')
        
        return assing.left.validate() and assing.right.validate() and valid_types
    

    def validate_callable(self, obj: CoolCallable):
        #Cada parametro llama a la funcion validate que esta tiene su propio contexto, es decir en caso de dispach los parametros se evaluara si existen en su contexto
        func:Feature.CoolDef = self.get_func(obj.id.id)
        obj.id.set_type(func.type)
        
        if func != False:
            obj.type = func.get_type()
            if len(func.params.childs()) == len(obj.params):
                for param_func, param_call in zip(func.params.childs(), obj.params):
                    if not param_call.validate(): return False #si el parametro no es valido entonces la llamada con este parametro no es valida, es necesario validar cada parametro xq con la validacion del mismo se llega a su tipo en caso de ser un id.               
                    if param_func.get_type() != param_call.get_type():
                        raise Exception (f'Los parametros {param_func} y {param_call} tienen tipo diferente ')
                        return False
            else: 
                raise Exception (f'La cantidad de parametros con los cuales se llama {obj.id.id} es invalida ')
                return False            
        else: 
            raise Exception (f'El la funcion {obj.id.id} no esta definida en la clase {self.cclass}')
            return False
        return True
    
    def validate_dispatch(self, dispatch: Dispatch):
        #TODO este dispatch funciona bien para la semantica, pero de ser posible: implementarlo para encaminar mejor la generacion de codigo
        name = dispatch.expr.name 

        if not dispatch.expr.validate():
            raise Exception(f'La expresion del dispatch {dispatch.expr} no es valida')
            return False    
        
        type = dispatch.expr.get_type()
        
        if dispatch.type is None:
            dispatch.type = type

        if type != dispatch.type: return False #El tipo de la variable es diferente al tipo el cual se asume que debe ser [@TYPE]
        
        context:Context = self.get_context_from_type(type)#Si el type es valido, entonces quiero el cotexto
        if context != False:
            #este es exactamente el contexo al que pertenece la funcion que se esta llamando. 
            # return context.validate_callable(dispatch.function)
            return dispatch.function.validate_in_context(context)
        else:
            raise Exception(f'El tipo {type} no esta definido')
            return False
    
    
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
    - Implementar el `dispatch` para todos los tipos base como `IO` y `string`
    - Implementar el trato de `@` en el dispatch
    '''