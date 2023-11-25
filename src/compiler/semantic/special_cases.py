from error.cool_error import SemanticError
def have_multi_types(type):
    return isinstance(type, list)

def if_case(type, _if):
    '''
        Devuelve True si el scope del `then` o el scope del `else` del `if` heredan o son del tipo `type`
        - nota: para llamar este metodo primero debe ser validado el if lo que necesita el if debe ser validado
    '''
    then_scope = _if.then_scope
    else_scope = _if.else_scope
    
    if type != then_scope.get_type() and not then_scope.inherit_from_type(type):
        SemanticError(
            pos=then_scope.token_pos[1],
            lineno=then_scope.token_pos[0]
            )(f"En el case existe una posible salida que no corresponde al tipo {type}, {then_scope.get_type()}")
        return False
    
    if type != else_scope.get_type() and not else_scope.inherit_from_type(type):
        SemanticError(
            pos=else_scope.token_pos[1],
            lineno=else_scope.token_pos[0]
            )(f"En el case existe una posible salida que no corresponde al tipo {type}, {else_scope.get_type()}")
        return False

    return True
    
def case_case(type,case):
    '''
        Devuelve True si todos los casos en `ccase` heredan o son del tipo `type`
        - nota: para que possible_types contenga lo que necesita el case debe ser validado(inicializa el case y lo valida)
    '''
    for t in case.possible_types:
        if type != t.get_type() and not t.inherit_from_type(type):
            SemanticError(
                pos=case.token_pos[1],
                lineno=case.token_pos[0]
                )(f"En el case existe una posible salida que no corresponde al tipo {type}, {t.get_type()}")
            # raise Exception(f"En el case existe niguna posible salida que no corresponde al tipo {l_type}, {t.get_type()}")
            return False
    return True

def case_multiple_types(expr, type):
    '''
        Devuelve True si todos los tipos en `expr.type` heredan o son del tipo `type`
    '''
    for t in expr.get_type():
        t_class = expr.context.get_context_from_type(t).cclass
        if type != t and not t_class.inherit_from_type(type):
            SemanticError(
                pos=expr.token_pos[1],
                lineno=expr.token_pos[0]
                )(f"TypeError: Inferred type {t_class.last_inherit_not_object()} of initialization of attribute test does not conform to declared type {type}.")
            # raise Exception(f"En el case existe niguna posible salida que no corresponde al tipo {l_type}, {t.get_type()}")
            return False
    return True
