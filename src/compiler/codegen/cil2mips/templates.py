class OutString:
    '''Imprime en consola el primer argumento (distinto de self), devuelve una instancia de si mismo'''
    name = 'out_string'
    def code():
        return [
        'out_string:',     #etiqueta nombre del metodo
        '\tlw $a0, 4($sp)', #mueve a $a0 el valor que se encuentra en la posicion 4 de la pila
	    '\tli $v0, 4',      #El 4 es para imprimir string
	    '\tsyscall',        #llamanda al sistema
        '\tlw $a0, 0($sp)',  #retorna el valor en la posision 0 de la pila, corresponde a self
        '\tjr $ra'           #regresa a la posicion desde dond fue llamado        
        ]
        
class OutInt:
    '''Imprime en consola el primer argumento (distinto de self), devuelve una instancia de si mismo'''
    name = 'out_int'
    def code():
        return [
        'out_int:',     #etiqueta nombre del metodo
        '\tlw $a0, 4($sp)', #mueve a $a0 el valor que se encuentra en la posicion 4 de la pila
	    '\tli $v0, 1',      #El 1 es para imprimir int
	    '\tsyscall',        #llamanda al sistema
        '\tlw $a0, 0($sp)',  #retorna el valor en la posision 0 de la pila, corresponde a self
        '\tjr $ra'           #regresa a la posicion desde dond fue llamado        
        ]

class InInt:
    name = 'in_int'
    def code():
        return [
        'in_int:',     
        '\tjr $ra'              
        ]
class InString:
    name = 'in_string'
    def code():
        return [
        'in_string:',     
        '\tjr $ra'              
        ]
    
class TypeName:
    '''Imprime texto con el nombre del tipo de una instancia dada'''
    name = 'type_name'
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
    
class Abort:
    name = 'abort'
    def code():
        return [
        'abort:',
        '\tla $a0, abort',  #texto del abort en la seccion de data
        '\tli $v0, 4',      #El 4 es para imprimir string
	    '\tsyscall',        #llamanda al sistema
        '\tlw $t0, 0($sp)', #en la posicion 0 de la pila esta self
        '\tlw $a0, 0($t0)', #en la posicion 0 de self esta la direcion de SELF_TYPE que contiene un string
        '\tli $v0, 4',      #El 4 es para imprimir string
	    '\tsyscall',        #llamanda al sistema
        '\tli $v0, 10',     #Codigo para cerrar el programa
        '\tsyscall'
        ]
    
class Copy:
    name = 'copy'
    def code():
        return [
        'copy:',
        '\tjr $ra'
        ]        

class Length:
    name = 'length'
    def code():
        return [
        'length:',
        '\tlw $t0, 0($sp)',      #mueve a t0 valor 0 de la pila, este una direcicon con un string almacenado
        '\taddi $t1, $zero, -1', #Guarda -1 en t1
        '\tloop_len:',
        '\tlb $t2, 0($t0)',       # Cargar en t2 el caracter actual
        '\taddi $t0, $t0, 1',         #  aunmenta t0 en 1
        '\taddi $t1, $t1, 1',         # aumenta t1 en 1, que seria el contador del len 
        '\tbnez $t2, loop_len',  # lo compara con el caracter nulo, en caso de no serlo repite el ciclo
        '\tmove $a0, $t1',       # mueve a $a0 el valor de $t1        
        '\tjr $ra'               # regresa a la posicion desde dond fue llamado        
        ]

class Substring:
    name = 'substring'
    def code():
        return [
        'length:',
        '\tjr $ra'
        ]   
         
'''
            f'{self.label_loop}:',
            f'lb {temp1}, 0({dir1})',         # Cargar el caracter actual en temporal
            f'lb {temp2}, 0({dir2})',         # Cargar el caracter actual en temporal
            f'addiu {dir1}, {dir1}, 1',       # Avanzar a la siguiente posición en la memoria
            f'addiu {dir2}, {dir2}, 1',       # Avanzar a la siguiente posición en la memoria
            f'bne {temp1}, {temp2}, {self.label_not_equals}', #si son distintos ir a la etiqueta de `no son iguales`, en otro caso sigue.
            f'bnez {temp1}, {self.label_loop}',    # Si llega a aqui entonces ambos temporales tienen igual vaor xq no aslto arriba, luego basta comparar uno con zero, si es distinto de cero, repite el ciclo, en caso de ser cero, se llego al caracter final con todos iguales, por lo tanto son iguales los string
            f'li {dest}, 1', #Si llega a aqui xq el ciclo termino sin desigualdad entonces son iguales, se le asigna 1 al valor de salida
            f'j {self.label_end}', #salta hasta el final sin asignar 0
            f'{self.label_not_equals}:',
            f'li {dest}, 0', #asigna 0 al resultado final
            f'{self.label_end}:', #etiqueta final
'''

class concat:
    name = 'concat'
    def code():
        return [
        'length:',
        '\tjr $ra'
        ]        
    
methods = [OutString,OutInt,InInt, InString, TypeName,Copy, Abort]
uninherits_methods = [Length]

class IO:
    '''Crea una instancia de la clase IO, la guarda en memoria y devuelve su putero'''
    def code():
        return [
            '__init_IO__:', 
            '\tli $a0, 8',
            '\tli $v0, 9',
            '\tsyscall', #reserva memoria para una instancia de la clase, solo tendra el self_type
            '\tla $t0, StaticIO',
            '\tsw $t0, 4($v0) ',
            '\tmove $a0, $v0', #guarda en a la direccion del puntero para devolverlo
            '\tjr $ra'
        ]
    
class Object:
    '''Crea una instancia de la clase Object, la guarda en memoria y devuelve su putero'''
    def code():
        return [
            '__init_Object__:', 
            '\tli $a0, 8',
            '\tli $v0, 9',
            '\tsyscall', #reserva memoria para una instancia de la clase, solo tendra el self_type
            '\tla $t0, StaticObject',
            '\tsw $t0, 4($v0) ',
            '\tmove $a0, $v0', #guarda en a la direccion del puntero para devolverlo
            '\tjr $ra'
        ]    
    
init_bases = [IO]

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