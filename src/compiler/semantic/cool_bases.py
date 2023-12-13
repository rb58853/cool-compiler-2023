from compiler.semantic.context import Context, CoolString, IntNode, CoolBool, CoolClass, Feature, CoolID, BinOp, CoolVar, Node, CoolNew
import compiler.AST.environment as env

#TODO Hay que cambiar todo este sistema y crear una clase para cada una de las clases base, una clase de COOL no solo de python, dentro de esta clase se le meten todos los features y lo que necesite en una instancia, cada clase hereda de object, y object no hereda de nadie.

def object_class():
    object_class = CoolClass(type= env.object_type_name , inherit=None, features= [], is_object=True, token_pos=(0,0))
    return object_class

class ObjectClass:
    type = env.object_type_name 
    instance: CoolClass = object_class()
    
    def features() -> list[Feature]:
        r_features = []
        r_features.append(ObjectClass.Features.type_name())
        r_features.append(ObjectClass.Features.abort())
        r_features.append(ObjectClass.Features.copy())
        
        return r_features
    
    def cclass() -> CoolClass:
        ObjectClass.instance = object_class()
        ObjectClass.instance.features = ObjectClass.features()
        Node.set_father(ObjectClass.instance, ObjectClass.instance.features)
        return ObjectClass.instance
    
    class Features:
        def type_name():
            return Feature.CoolDef('type_name',
                                    StringClass.type, 
                                    [], 
                                    CoolString(),
                                    token_pos=(0,0)
                                    )
        def abort():
            # abort() : Object
            return Feature.CoolDef('abort',env.object_type_name, [], CoolNew(env.object_type_name), token_pos=(0,0))
        def copy():
            #copy() : SELF_TYPE
            return Feature.CoolDef('copy',env.self_type_name, [], CoolID(env.self_name,env.self_type_name), token_pos=(0,0))
    
class StringClass:
    type = env.string_type_name
    def features() ->list[Feature]:
        r_features = []
        r_features.append(StringClass.Features.concat())
        r_features.append(StringClass.Features.length())
        r_features.append(StringClass.Features.substr())
        return r_features
    
    def cclass() ->CoolClass:
        string_class = CoolClass(type= StringClass.type, inherit=env.object_type_name , features= StringClass.features(),token_pos=(0,0))
        return string_class
    
    class Features:
        def concat():
            #concat(s : String) : String
            return Feature.CoolDef('concat',StringClass.type, [CoolID('s',env.string_type_name)], CoolString(), token_pos=(0,0))

        def length():
            #length() : Int
            return Feature.CoolDef('length',IntClass.type, [], IntNode(), token_pos=(0,0))
        
        def substr():
            #substr(i : Int, l : Int) : String
            return Feature.CoolDef('substr',env.string_type_name, [CoolID('i',env.int_type_name),CoolID('l',env.int_type_name)], CoolString(), token_pos=(0,0))

class IntClass:
    type = env.int_type_name
    def features() -> list[Feature]:
        return []
    
    def cclass() ->CoolClass:
        int_class = CoolClass(type= IntClass.type, inherit=env.object_type_name , features= IntClass.features(), token_pos=(0,0))
        return int_class
    
    class Features:
        pass        

class BoolClass:
    type = env.bool_type_name
    def features() -> list[Feature]:
        return []
    
    def cclass() ->CoolClass:
        return CoolClass(type= env.bool_type_name, inherit=env.object_type_name, features= BoolClass.features(), token_pos=(0,0))
    
    class Features:
        pass        

class IOClass:
    type = env.io_type_name
    def features() -> list[Feature]:
        r_features = []
        r_features.append(IOClass.Features.out_string())
        r_features.append(IOClass.Features.out_int())
        r_features.append(IOClass.Features.in_string())
        r_features.append(IOClass.Features.in_int())
        return r_features
    
    def cclass() ->CoolClass:
        int_class = CoolClass(type= IOClass.type, inherit=env.object_type_name , features= IOClass.features(), token_pos=(0,0))
        return int_class
    
    class Features:
        def out_string():
            # out_string(x : String) : SELF_TYPE
            return Feature.CoolDef('out_string',env.self_type_name, [CoolID('x',StringClass.type)], CoolNew(env.self_type_name), token_pos=(0,0))
        def out_int():
            #out_int(x : Int) : SELF_TYPE
            return Feature.CoolDef('out_int', env.self_type_name,[CoolID('x', env.int_type_name)], CoolNew(env.self_type_name), token_pos=(0,0))
        def in_string():
            #in_string() : String
            return Feature.CoolDef('in_string', env.string_type_name,[], CoolString(), token_pos=(0,0))
        def in_int():
            #in_int() : Int
            return Feature.CoolDef('in_int', env.int_type_name,[], IntNode(), token_pos=(0,0))
        

def base_classes():
    return [ObjectClass.cclass(), IntClass.cclass(), StringClass.cclass(), IOClass.cclass(), BoolClass.cclass()]

class BaseContext(Context):
    def __init__(self) -> None:
        super().__init__(father= None)
        self.name = 'PROGRAM'