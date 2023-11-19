from semantic.context import Context, CoolString, IntNode, CoolBool, CoolClass, Feature

class FeaturesObject:
    def features() -> list[Feature]:
        return []

class BaseContext(Context):
    def __init__(self) -> None:
        super().__init__(father= None)
        self.set_bases()
        self.name = 'PROGRAM'

    def set_bases(self):
        self.set_object_context()
        self.set_string_context()
        self.set_int_context()
        self.set_bool_context()

    def set_object_context(self):
        key = 'object'
        context = Context(father=self)
        context.type = key
        context.name = 'OBJECT'
        context.cclass = CoolClass(type='object',inherit=None,features=FeaturesObject.features(),is_object=True)
        self.types[key] = context

    def set_string_context(self):
        key = CoolString.type
        
        #-------- DEFINE CONTEXT ----------
        context = Context(father=self)
        func = CoolString.concat()
        context.functions[func.ID.id] = func
        #----------------------------------
        context.type = key
        context.name = 'STRING'
        self.types[key] = context

    def set_int_context(self):
        key = IntNode.type
        context = Context(father=self)
        context.type = key
        context.name = 'INT'
        self.types[key] = context

    def set_bool_context(self):
        key = CoolBool.type
        context = Context(father=self)
        context.type = key
        context.name = 'BOOL'
        self.types[key] = context
    
class Program:
    context = BaseContext()
    def set_context(obj):
        obj.context = Program.context

class CoolObject(CoolClass):
    instance = Program.context.types['object'].cclass
    type = 'object'        