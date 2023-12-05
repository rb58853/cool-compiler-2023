class IO:
    '''Crea una instancia de la clase IO, la guarda en memoria y devuelve su putero'''
    def code():
        return [
            '__init_IO__:', 
            '\tli $a0, 4',
            '\tli $v0, 9', 
            '\tsyscall', #reserva memoria para una instancia de la clase, solo tendra el self_type
            '\tmove $a0, $v0', #guarda en a la direccion del puntero para devolverlo
            '\tjr $ra'
        ]
class OutString:
    '''Imprime en consola el primer argumento (distinto de self), devuelve una instancia de si mismo'''
    def code():
        return [
        'out_string:',     #etiqueta nombre del metodo
        f'\tlw $a0, 4($sp)', #mueve a $a0 el valor que se encuentra en la posicion 4 de la pila
	    '\tli $v0, 4',      #El 4 es para imprimir string
	    '\tsyscall',        #llamanda al sistema
        '\tlw $a0, 0($sp)',  #retorna el valor en la posision 0 de la pila, corresponde a self
        '\tjr $ra'           #regresa a la posicion desde dond fue llamado        
        ]
        
class OutInt:
    '''Imprime en consola el primer argumento (distinto de self), devuelve una instancia de si mismo'''
    def code():
        return [
        'out_int:',     #etiqueta nombre del metodo
        f'\tlw $a0, 4($sp)', #mueve a $a0 el valor que se encuentra en la posicion 4 de la pila
	    '\tli $v0, 1',      #El 1 es para imprimir int
	    '\tsyscall',        #llamanda al sistema
        '\tlw $a0, 0($sp)',  #retorna el valor en la posision 0 de la pila, corresponde a self
        '\tjr $ra'           #regresa a la posicion desde dond fue llamado        
        ]    
    
methods = [IO,OutString, OutInt]