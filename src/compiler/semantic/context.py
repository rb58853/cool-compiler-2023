from AST.ast import Feature, CoolClass, CoolString, CoolVar, CoolID, BinOp, IntNode, CoolBool, CoolCallable, Dispatch

# class TypeContext(BaseContext):
class TypeContext:
    def __init__(self) -> None:
        self.father = None
        self.types:dict = {}
        self.functions:dict = {}
        self.variables:dict = {}

    def define_type(self, cclass:CoolClass):
        '''
        USE: se llama desde `context_in` -contexto en el cual se va a definir la clase, el contexto del program en este caso\n
        INPUT: `self` -La propia clase en cuesion \n
        OUTPUT: `context_out` -devuelve el contexto propio de la clase en funcion hijo de una clase heredada o del program
        \nEJEMPLO:
        `context = father.context(self)`
        '''
        if not self.is_defined_type(cclass.type):
            contex:Context
            if cclass.inherit is not None:
                if not self.is_defined_type(cclass.inherit):
                    return False #La clase desde la cual se quiere heredar no esta definida
                else:
                    #Si esta heredando de una clase padre esta clase padre debe tener un padre que es exactamente el contexto self, Dado que una clase solo se declara en program entonces la clase o bien posee el contexto del program como padre o bien posee una clase que posee al contexto de program en algun padre sperior recursivamente. De esta forma se garantiza la herencia de contextos y del contexto padre final. Esto es posible xq en Cool dentro de una clase no se puden definir otras clases.
                    contex = self.get_type(cclass.inherit).self.create_context_child()
            else:
                contex = self.create_context_child()

            #se crea un contexto propio para la clase que posee como padre un contexto mas amplio, este contexto padre solo tendra clases definidas o variables de una clase desde la cual se hace herencia.
            self.types[cclass.type] = contex
            return contex
        else:
            return False #ERROR Ya esta definida esta clase no se puede usar el mismo nombre

    def is_defined_type(self,type):
        if self.types.__contains__(type): return True
        if self.father is None: return False
        else: return self.father.is_defined_type(type)

    def create_context_child(self):
        #Estoy ubicado sobre el contexto en el cual se va a definir la clase, lo que sera el program o una clase padre
        return Context(father = self)

    def get_type(self, type):
        if self.types.__contains__(type):
            return self.types[type]
        elif self.father is None:
            Exception('No existe el type buscado en ningun contexto accesible')
        else:
            return self.father.get_type(type)

class FunctionContext(TypeContext):
    def define_func(self, func: Feature.CoolDef):
        '''
        USE: se llama desde `context_in` -contexto en el cual se va a definir la funcion, el contexto de la clase padre\n
        INPUT: `self` -La propia funcion en cuesion \n
        OUTPUT: `context_out` -devuelve el contexto propio de la funcion
        \nEJEMPLO:
        `context = father.context(self)`
        '''
        if not self.is_defined_func(func.ID.id) or self.is_function_override(func.ID.id):
            self.functions[func.ID.id] = func
            return self.create_context_child() #define la funcion y devuelve el nuevo contexto interno de esta, hijo del contexto desde el cual fue definida la funcion, lo cal seria el contexto de una clase
        else:
            return False #ERROR

    def is_defined_func(self, id):
        #dependiendo si se acepta o no el override se debe analizar solo el contexto mas cercano o todos los padre, una funcion solo puede ser defina dentro de una clase, luego el contexto que abarca es o bien la clase en la cual es definida, o bien una clase desde la cal se hereda. Notese que pueden existir funciones de igual nombre en clases distintas y no abra conflctos mientras no haya herencia entre estas.
        if self.functions.__contains__(id): return True
        if self.father is None: return False
        else: return self.father.is_defined_func(id)
    
    def is_function_override(self, func:Feature.CoolDef):
        return False

    def get_func(self, id):
        if self.variables.__contains__(id): return self.functions[id]
        if self.father is None: return False
        else: return self.father.get_func(id)

class VariableContext(FunctionContext):
    def define_var(self, vvar:CoolVar):
        if not self.is_defined_var(vvar.id):
            self.variables[vvar.id] = vvar
            return self
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


class Context(VariableContext):
    def __init__(self, father = None) -> None:
        self.types:dict = {str: Context}
        self.functions:dict = {str: Feature.CoolDef}
        self.variables:dict = {str: CoolVar}
        self.father:Context = father

    def validate_string(self, s: CoolString): return True
    def validate_int(self, x: IntNode): return True
    def validate_bool(self, b: CoolBool): return True
    
    def validate_id(self, cool_id: CoolID):
        vvar = self.get_var(cool_id.id)
        if vvar != False:
            cool_id.value = vvar.value #esto le da valor al id. 
            cool_id.type = vvar.type #esto le da type al id. 
            #cool_id = vvar #Esto es lo que me gustaria hacer 
            return True
        else:
            return False
    
    def validate_op(self, op: BinOp):
        # return op.left.get_type() == op.right.get_type() 
        if op.left.validate() and op.right.validate and op.left.get_type() == op.right.get_type():
            op.type =  op.left.get_type()
            return True
        else:
            return False    
    
    def validate_callable(self, obj: CoolCallable):
        func:Feature.CoolDef = self.get_func(obj.id)
        if func != False:
            if len(func.params) == len(obj.params):
                for param_func, param_call in zip(func.params, obj.params):
                    if not param_call.validate(): return False #si el parametro no es valido entonces la llamada con este parametro no es valida, es necesario validar cad parametro xq con la validacion del mismo se llega a su tipo en caso de ser un id.               
                    if param_func.type != param_call.get_type():
                        return False
            else: 
                return False            
        else: return False
        return True
    
    def validate_dispatch(self, dispatch: Dispatch):
        name = dispatch.expr.name
        




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