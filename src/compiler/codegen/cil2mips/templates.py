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
    
class Copy: #TODO
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
    name = 'substr'
    def code():
        return [
        'substr:',
        ########################## length #############
        '\tlw $t0, 0($sp)',      #mueve a t0 valor 0 de la pila, este una direcicon con un string almacenado
        '\taddi $t1, $zero, -1', #Guarda -1 en t1
        '\tloop_len_full:',
        '\tlb $t2, 0($t0)',       # Cargar en t2 el caracter actual
        '\taddi $t0, $t0, 1',         #  aunmenta t0 en 1
        '\taddi $t1, $t1, 1',         # aumenta t1 en 1, que seria el contador del len 
        '\tbnez $t2, loop_len_full',  # lo compara con el caracter nulo, en caso de no serlo repite el ciclo
        '\tmove $t6, $t1',       # mueve a $t6 el valor de $t1, que es el length del string completo        

        ######################## Cargar valores en pila y comparar para lanzar errores
        '\tlw $t0, 0($sp)',         #mueve a t0 valor 0 de la pila, este una direcicon con un string almacenado
        '\tlw $t5, 4($sp)',         #mueve a t5 valor 4 de la pila, esto es donde comienza el string
        '\tadd $t0, $t0, $t5',       #aumenta t0 en el valor index donde debe comenzar el substring, desde aqui se cargan bytes
        '\tlw $t1, 8($sp)',         #mueve a t1 valor 8 de la pila, esto es el length
        '\tslt $t4, $t5, $zero',    #$t4 = 1 si $t5 < $zero, de lo contrario $t4 = 0
        '\tbnez $t4, s_error', #compara el valor de $t4 con cero, si es diferente entonce salta al error,ya que el index es menor que 0
        '\tadd $t5, $t5, $t1',      #aumenta $t5 en el length que debe tener el substring
        '\tslt $t4, $t6, $t5',      # $t4 = 1 si $t6(len del string original) < $t5, de lo contrario $t4 = 0
        '\tbnez $t4, s_error', #compara el valor de $t4 con cero, si es diferente entonce salta al error, el len pedido se va de rango

        ########################### Reservar Memoria
        '\taddi $t4, $t1, 1',         #Guarda en $t4 el tamanno que debe tener el nuevo substring +1 (caracter nulo)
        '\tadd $a0, $zero, $t4',      # Reservar espacio igual a $t1 + 1 que es el length del nuevo substring
        '\tli $v0, 9',               # Código de sistema para sbrk
        '\tsyscall',  
        '\tmove $t3, $v0',            #Guarda en 3 la direccion de memoria donde se va a guardar el nuevo substring
        
        ########################## ciclo para escribir le nuevo substring
        '\tli $t4, 0',
        '\tloop_substring:',
        '\tlb $t2, 0($t0)',           # Cargar en t2 el caracter actual
        '\tsb $t2, 0($t3)',           # guarda el caracter actual en t3
        '\taddi $t0, $t0, 1',         #  aunmenta t0 en 1
        '\taddi $t3, $t3, 1',         #  aunmenta t3 en 1
        '\taddi $t4, $t4, 1',         #  aunmenta t4 en 1, este es el lengthcount
        '\tslt $t6, $t4, $t1',        # $t6 = 1 si $t4(contador) < $t1(nuevo len), de lo contrario $t6 = 0
        '\tbnez $t6, loop_substring', #compara $t6 con cero, si es diferente entonces salta a loop_sub...
        
        ######################### retorno de la funcion
        '\tmove $a0, $v0',           # mueve a $a0 el valor de $v0, donde comienza el nuevo string substring        
        '\tjr $ra',                  # regresa a la posicion desde dond fue llamado        
        
        ######################## zona de error
        '\ts_error:',                # etiqueta en caso de error
        '\tla $a0, substring_error', # carga el texto de error desde data en $a0
        '\tli $v0, 4',               #El 4 es para imprimir string(error)
	    '\tsyscall',                 #llamanda al sistema
        '\tli $v0, 10',              #Codigo para cerrar el programa
        '\tsyscall'
        ]
         
class Concat:
    name = 'concat'
    def code():
        return [
        'concat:',
        ########################## length #############
        '\tlw $t0, 0($sp)',      #mueve a t0 valor 0 de la pila, este una direcicon con un string almacenado
        '\taddi $t1, $zero, -1', #Guarda -1 en t1
        '\tloop_len_concat_one:',
        '\tlb $t2, 0($t0)',       # Cargar en t2 el caracter actual
        '\taddi $t0, $t0, 1',         #  aunmenta t0 en 1
        '\taddi $t1, $t1, 1',         # aumenta t1 en 1, que seria el contador del len 
        '\tbnez $t2, loop_len_concat_one',  # lo compara con el caracter nulo, en caso de no serlo repite el ciclo
        
        '\tlw $t0, 4($sp)',       #carga en t0 el valor del string que se le pasa
        '\tloop_len_concat_two:',
        '\tlb $t2, 0($t0)',       # Cargar en t2 el caracter actual
        '\taddi $t0, $t0, 1',         #  aunmenta t0 en 1
        '\taddi $t1, $t1, 1',         # aumenta t1 en 1, que seria el contador del len 
        '\tbnez $t2, loop_len_concat_two',  # lo compara con el caracter nulo, en caso de no serlo repite el ciclo
        

        '\tmove $t3, $t1',       # mueve a $t3 el valor de $t1, que es el length sumado de ambos string  
        '\taddi $t3, $t3, 1',       # suma 1 para el caracter nulo, este es el nuevo length

        '\tadd $a0, $zero, $t3',      # Reservar espacio igual length del nuevo string
        '\tli $v0, 9',               # Código de sistema para sbrk
        '\tsyscall',  
        '\tmove $t4, $v0',            #Guarda en 3 la direccion de memoria donde se va a guardar el nuevo substring
        
        '\tlw $t0, 0($sp)',      #mueve a t0 valor 0 de la pila, este una direcicon con un string almacenado
        '\tconcat_copy_one:',
        '\tlb $t2, 0($t0)',       # Cargar en t2 el caracter actual
        '\tbeq $t2, $zero, end_concat_one',  # lo compara con el caracter nulo, en caso de serlo sale del ciclo sin escribirlo
        '\tsb $t2, 0($t4)',       # Guarda en t4 el caracter actual
        '\taddi $t0, $t0, 1',         #  aunmenta t0 en 1
        '\taddi $t4, $t4, 1',         # aumenta t4 en 1, que seria donde esta escribiendo 
        '\tbnez $t2, concat_copy_one',  # lo compara con el caracter nulo, en caso de no serlo repite el ciclo
        
        '\tend_concat_one:'
        
        '\tlw $t0, 4($sp)',      #mueve a t0 valor 4 de la pila, este una direcicon con el strng pasado por parametro
        '\tconcat_copy_two:',
        '\tlb $t2, 0($t0)',       # Cargar en t2 el caracter actual
        '\tsb $t2, 0($t4)',       # guarda en t4 el caracter actual
        '\taddi $t0, $t0, 1',         #  aunmenta t0 en 1
        '\taddi $t4, $t4, 1',         # aumenta t4 en 1, que seria donde esta escribiendo 
        '\tbnez $t2, concat_copy_two',  # lo compara con el caracter nulo, en caso de no serlo repite el ciclo
        
        '\tmove $a0, $v0', #mueve la direccion de inicio del nueov string a $a0
        '\tjr $ra'
        ]        
    
class ConstantTypeName:
    '''Imprime texto con el nombre del tipo de una instancia dada'''
    def __init__(self, type) -> None:
        self.name = f'{type}_type_name:'
        self.type = type

    def code(self):
        return [
        self.name,
        f'\tla $a0, {self.type}', #mover el string del type_name de la clase constante a $a0
        '\tjr $ra'
        ]    
    
methods = [OutString,OutInt,InInt, InString, TypeName,Copy, Abort]
uninherits_methods = [Length, Substring, Concat]
contants = [ConstantTypeName("String"),ConstantTypeName("Int"),ConstantTypeName("Bool")] #TODO usar los nombres de env

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