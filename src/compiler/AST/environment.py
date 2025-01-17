object_type_name = 'Object'
string_type_name = 'String'
bool_type_name = 'Bool'
int_type_name = 'Int'
io_type_name = 'IO'
void_type_name = 'Void'
self_type_name = 'SELF_TYPE'
self_name = 'self'
not_inherit_types = [int_type_name, string_type_name, bool_type_name]
basic_types = [int_type_name, string_type_name, bool_type_name]
base_classes = [int_type_name, string_type_name, bool_type_name, io_type_name, object_type_name]
unredefine_classes = [int_type_name, string_type_name, bool_type_name, io_type_name,object_type_name] 
base_methods = ['out_string', 'out_int', 'in_string', 'in_int', 'copy', 'abort','type_name']
static_methods = ['length', 'concat', 'substr']