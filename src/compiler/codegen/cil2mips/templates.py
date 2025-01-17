from compiler.codegen.cool2cil.codegener import NameLabel

class VoidError:
    def code():
        return [
        f'VoidError:',
        '\tla $a0, void_error',  #texto del abort en la seccion de data
        '\tli $v0, 4',      #El 4 es para imprimir string
	    '\tsyscall',        #llamanda al sistema
        '\tli $v0, 10',     #Codigo para cerrar el programa
        '\tsyscall'
        ]  
    
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
        '\tli $v0, 5',
        '\tsyscall',
        '\tmove $a0, $v0',     
        '\tjr $ra'              
        ]

#TODO hay que quitar el caracter new line
class InString:
    name = 'in_string'
    def code():
        label_copy = NameLabel('copy_in').get()
        length =  NameLabel('length_in_string').get()

        return [
        'in_string:',
        'li $v0, 8',
        'la $a0, string_space',
        'li $a1, 1024',
        'syscall',

        '\tmove $t0, $a0',        #mueve a t0 el valor donde esta almacenado el string
        '\taddi $t1, $zero, -1',  #Guarda -1 en t1
        f'\t{length}:',
        '\tlb $t2, 0($t0)',       # Cargar en t2 el caracter actual
        '\taddi $t0, $t0, 1',         #  aunmenta t0 en 1
        '\taddi $t1, $t1, 1',         # aumenta t1 en 1, que seria el contador del len 
        f'\tbnez $t2, {length}',  # lo compara con el caracter nulo, en caso de no serlo repite el ciclo
        '\tmove $t3, $t1',        # mueve a $t3 el valor de $t1, t3 es entonces el valor de length-1        
        
        'addi $t3, $t0, -2',
        'sb $zero, 0($t3)',      #En la posicion de #t3, esta es la posicion del ultimo caracter del string sin contar el nulo
        
        'move $t0, $a0',         #t0 tiene la direccion del string ahora
        'addi $a0, $t1, 1',      # espacio para guardar el string que se entra
        'li $v0, 9',             # Código de sistema para sbrk
        'syscall',               
        'move $t1, $v0',
        f'{label_copy}:',
        'lb $t3, 0($t0)',             #carga byte de t0
        'sb $t3, 0($t1)',              #guarda el byte en t1
        'addi $t0, $t0, 1',              #aumenta t0 en 1
        'addi $t1, $t1, 1',              #aumenta t1 en 1
        f'\tbnez $t3, {label_copy}',  # lo compara con el caracter nulo, en caso de no serlo repite el ciclo
        'move $a0, $v0', 

        '\tjr $ra'              
        ]
  # Leer el string ingresado por el usuario
  
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
        label = NameLabel('loop_copy_instance').get()
        return [
        'copy:',
        '\tlw $t0, 0($sp)',  #intancia que entra al metodo, t0 es la posicion de la instancia
        '\tlw $t1, 4($t0)',  #parte estatica de la instancia de entrada
        '\tlw $t1, 4($t1)',  #en la posicion 4 de la parte estatica esta el espacio que ocupa el tipo de esa instancia
        '\tmove $t4, $t1',   #mueve a t4 El espacio que se reservo, la cantidad
        '\tmove $a0, $t1' ,  #mueve a $a0 el espacio que se debe reservar
        '\tli $v0, 9',       # Código de sistema para sbrk
        '\tsyscall',
        
        '\tli $t2, 0',       #pone valor zero en t2, este sera el contador del espacio que se ha estado llenandoy cargado, comienza en 5 xq el primer ciclo lo cuenta
        '\tmove $t1, $v0',  #mueve a t1 la direccion de memoria que se reservo
        
        f'\t{label}:',          #label para repetir el ciclo y copiar la instancia
        '\tlw $t3, 0($t0)'  ,   #guarda en t3 la palabra en cuestion de la instancia
        '\tsw $t3, 0($t1)'  ,   #mueve t3 a la direccin en cuestion que esta en t1
        '\taddi $t0, $t0, 4',   #auenta t0 en 4
        '\taddi $t1, $t1, 4',   #auenta t1 en 4
        '\taddi $t2, $t2, 4',   #auenta t2 en 4
        f'\tblt $t2, $t4, {label}',       #en t4 esta el espacio el valor del espacio reservado, si el contador es menor que el espacio repetir el ciclo, en otro caso salir
        
        '\tmove $a0, $v0',     #mueve el valor de la direccion que se reservo a a0
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
        '\tli $v0, 9',                # Código de sistema para sbrk
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
    
class ConstantAbort:
    '''Imprime texto con el nombre del tipo de una instancia dada'''
    def __init__(self, type) -> None:
        self.name = f'{type}_abort:'
        self.type = type

    def code(self):
        return [
        f'{self.name}',
        '\tla $a0, abort',  #texto del abort en la seccion de data
        '\tli $v0, 4',      #El 4 es para imprimir string
	    '\tsyscall',        #llamanda al sistema
        f'\tla $a0, {self.type}', #texto del tipo
        '\tli $v0, 4',      #El 4 es para imprimir string
	    '\tsyscall',        #llamanda al sistema
        '\tla $a0, newline',  #salto de linea
        '\tli $v0, 4',      #El 4 es para imprimir string
	    '\tsyscall',        #llamanda al sistema
        
        '\tli $v0, 10',     #Codigo para cerrar el programa
        '\tsyscall'
        ]
    
class ConstantCopy:
    '''Devuelve la misma instancia que se le pasa, esto es asi con las constantes'''
    def __init__(self, type) -> None:
        self.name = f'{type}_copy:'
        self.type = type

    def code(self):
        return [
        f'{self.name}',
        '\tlw $a0, 0($sp)',     #las constantes no necesitan crear espacio en memoria, se usa el mismo puntero
        '\tsyscall'
        ]    
    
methods = [OutString,OutInt,InInt, InString, TypeName,Copy, Abort]
uninherits_methods = [Length, Substring, Concat, VoidError]
 
#TODO usar los nombres de env
contants = [ConstantTypeName("String"),ConstantTypeName("Int"),ConstantTypeName("Bool"),
            ConstantAbort("String"),ConstantAbort("Int"),ConstantAbort("Bool"),
            ConstantCopy("String"),ConstantCopy("Int"),ConstantCopy("Bool")]

class IO:
    '''Crea una instancia de la clase IO, la guarda en memoria y devuelve su putero'''
    def code():
        return [
            '__init_IO__:', 
            '\tli $a0, 8',
            '\tli $v0, 9',
            '\tsyscall', #reserva memoria para una instancia de la clase, solo tendra el self_type
            '\tla $t0, IO',
	        '\tsw $t0, 0($v0)',
            '\tla $t0, StaticIO',
            '\tsw $t0, 4($v0)',
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
            '\tla $t0, Object',
	        '\tsw $t0, 0($v0)',
            '\tla $t0, StaticObject',
            '\tsw $t0, 4($v0) ',
            '\tmove $a0, $v0', #guarda en a la direccion del puntero para devolverlo
            '\tjr $ra'
        ]    
    
init_bases = [IO, Object]

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