from AST.ast import Feature, CoolClass, CoolString, CoolVar
class BaseContext:
    def __init__(self, father = None) -> None:
        self.types:dict = {}
        self.functios:dict = {}
        self.variables:dict = {}
        self.father:Context = father
    
    def set_bases(self):
        self.set_string_context()
        self.set_int_context()
        self.set_bool_context()

    def set_string_context(self):
        key = 'string'
        context = Context()
        context.define_func( CoolString.concatenate())
        self.types[key] = context

    def set_int_context(self):
        key = 'int'
        context = Context()
        self.types[key] = context

    def set_bool_context(self):
        key = 'bool'
        context = Context()
        self.types[key] = context

class TypeContext(BaseContext):
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
        if not self.is_defined_func(func.ID.id):
            self.functios[func.ID.id] = func
            return self.create_context_child() #define la funcion y devuelve el nuevo contexto interno de esta, hijo del contexto desde el cual fue definida la funcion, lo cal seria el contexto de una clase
        else:
            return False #ERROR
        
    def is_defined_func(self, id):
        #dependiendo si se acepta o no el override se debe analizar solo el contexto mas cercano o todos los padre, una funcion solo puede ser defina dentro de una clase, luego el contexto que abarca es o bien la clase en la cual es definida, o bien una clase desde la cal se hereda. Notese que pueden existir funciones de igual nombre en clases distintas y no abra conflctos mientras no haya herencia entre estas.
        if self.functios.__contains__(id): return True
        if self.father is None: return False
        else: return self.father.is_defined_func(id)

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

class Context(VariableContext):
    def __init__(self, father = None) -> None:
        BaseContext.__init__(self,father = father)
    

class IValidate:
    def validate(self, id): return True