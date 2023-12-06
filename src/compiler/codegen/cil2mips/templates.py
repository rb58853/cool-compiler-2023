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
        '\tlw $a0, 4($sp)', #mueve a $a0 el valor que se encuentra en la posicion 4 de la pila
	    '\tli $v0, 1',      #El 1 es para imprimir int
	    '\tsyscall',        #llamanda al sistema
        '\tlw $a0, 0($sp)',  #retorna el valor en la posision 0 de la pila, corresponde a self
        '\tjr $ra'           #regresa a la posicion desde dond fue llamado        
        ]
    
class TypeName:
    '''Imprime texto con el nombre del tipo de una instancia dada'''
    def code():
        return [
        'type_name:',
        '\tlw $t0, 0($sp)', #en la posicion 0 de la pila esta self
        '\tlw $t1, 0($t0)', #en la posicion 0 de self esta la direcion de SELF_TYPE que contiene un string
        '\tmove $a0, $t1', #mover self type para la salida 
        '\tjr $ra'
        ]
    def __repr__() -> str:
        return 'TypeName'
    
methods = [IO,OutString,TypeName, OutInt]


class StartMethod:
    '''Primer metodo del programar en mips, llama una instancia del metodo main'''
    def code():
        return[
            '.globl main', #glbalizar main
            'main:', #nombre del primer metodo main
            '\tjal __init_Main__', #inicializa la clase Main
            '\taddi $sp, $sp, -4', #reserva 4 de pila para guardar el self y pasarlo al Main.main()
            '\tsw $a0, 0($sp)', # la instancia devuelta en a0 por el metodo init_main la gaurda en la posicion cero de la pila
            '\tjal Main_main', #salta al metodo Main.main
            '\tli $v0, 10', #codigo para cerrar el programa
            '\tsyscall' #llamada al sistema
        ]