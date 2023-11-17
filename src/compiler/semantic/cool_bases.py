from semantic.context import Context, CoolString, Feature, CoolVar, IntNode

class BaseContext(Context):
    def __init__(self) -> None:
        super().__init__(father= None)
        self.set_bases()

    def set_bases(self):
        self.set_object_context()
        self.set_string_context()
        self.set_int_context()
        self.set_bool_context()

    def set_object_context(self):
        key = 'object'
        context = Context(father=self)
        self.types[key] = context

    def set_string_context(self):
        key = CoolString.type
        
        #-------- DEFINE CONTEXT ----------
        context = Context(father=self)
        func = CoolString.concat()
        context.functions[func.ID.id] = func
        #----------------------------------
        self.types[key] = context

    def set_int_context(self):
        key = 'int'
        context = Context(father=self)
        self.types[key] = context

    def set_bool_context(self):
        key = 'bool'
        context = Context(father=self)
        self.types[key] = context
    
class Program:
    context = BaseContext()
    def set_context(obj):
        obj.context = Program.context

class CoolObject:
    type = 'object'
