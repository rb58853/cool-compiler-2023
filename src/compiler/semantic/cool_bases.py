from semantic.context import Context, CoolString, IntNode, CoolBool, CoolClass, Feature, CoolID, BinOp, CoolVar, Node
import AST.environment as env

#TODO Hay que cambiar todo este sistema y crear una clase para cada una de las clases base, una clase de COOL no solo de python, dentro de esta clase se le meten todos los features y lo que necesite en una instancia, cada clase hereda de object, y object no hereda de nadie.

def object_class():
    object_class = CoolClass(type= 'object', inherit=None, features= [], is_object=True)
    return object_class

class ObjectClass:
    type = 'object'
    instance: CoolClass = object_class()
    
    def features() -> list[Feature]:
        r_features = []
        r_features.append(ObjectClass.Features.type_name())
        return r_features
    
    def cclass() -> CoolClass:
        object_class = ObjectClass.instance
        object_class.features = ObjectClass.features()
        Node.set_father(object_class, object_class.features)
        return object_class
    
    class Features:
        def type_name():
            return Feature.CoolDef('type_name',StringClass.type, [], CoolString(""))
    
class StringClass:
    type = env.string_type_name
    def features() ->list[Feature]:
        r_features = []
        r_features.append(StringClass.Features.concat())
        r_features.append(StringClass.Features.length())
        return r_features
    
    def cclass() ->CoolClass:
        string_class = CoolClass(type= StringClass.type, inherit=ObjectClass.type, features= StringClass.features())
        return string_class
    
    class Features:
        def concat():
            other = CoolID('other',StringClass.type)
            # self_id = CoolID('self')
            self_id = CoolString("self+")#TODO esto hay que cambiarlo despues
            other_id = CoolID('other')
            return Feature.CoolDef('concat',StringClass.type, [other], BinOp('+',self_id, other_id))

        def length():
            return Feature.CoolDef('length',IntClass.type, [], IntNode(0))

class IntClass:
    type = env.int_type_name
    def features() -> list[Feature]:
        return []
    
    def cclass() ->CoolClass:
        int_class = CoolClass(type= IntClass.type, inherit=ObjectClass.type, features= IntClass.features())
        return int_class
    
    class Features:
        pass        

class BoolClass:
    type = env.bool_type_name
    def features() -> list[Feature]:
        return []
    
    def cclass() ->CoolClass:
        int_class = CoolBool(type= BoolClass.type, inherit=ObjectClass.type, features= BoolClass.features())
        return int_class
    
    class Features:
        pass        

class IOClass:
    type = env.io_type_name
    def features() -> list[Feature]:
        r_features = []
        r_features.append(IOClass.Features.out_string())
        return r_features
    
    def cclass() ->CoolClass:
        int_class = CoolClass(type= IOClass.type, inherit=ObjectClass.type, features= IOClass.features())
        return int_class
    
    class Features:
        def out_string():
            return Feature.CoolDef('out_string',StringClass.type, [CoolID('out',StringClass.type)], CoolString(""))

def base_classes():
    return [ObjectClass.cclass(), IntClass.cclass(), StringClass.cclass(), IOClass.cclass()]

class BaseContext(Context):
    def __init__(self) -> None:
        super().__init__(father= None)
        self.name = 'PROGRAM'
        
class Program:
    context = BaseContext()

    # def set_context(obj):
    #     obj.context = Program.context

# class CoolObject(CoolClass):
#     # instance = Program.context.types['object'].cclass
#     type = 'object'        