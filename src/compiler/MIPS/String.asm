.data
long_string: .asciiz "123121312315151515161661661161616116161"

.text
initialize_and_store_string:
    la $t0, long_string       # Cargar la dirección del string definido en .data
    li $t1, 0                 # Inicializar el contador

    # Calcular la longitud del string
    count_string_length:
        lb $t2, 0($t0)        # Cargar un byte del string
        beq $t2, $zero, done_counting  # Si es el byte nulo, terminamos de contar
        addi $t0, $t0, 1      # Mover al siguiente byte
        addi $t1, $t1, 1      # Incrementar el contador
        j count_string_length

    done_counting:
    addi $t1, $t1, 1          # Agregar espacio para el byte nulo

    # Reservar espacio en el heap
    li $v0, 9                 # syscall para reservar memoria
    move $a0, $t1             # Tamaño del string
    syscall
    move $s0, $v0             # Guardar la dirección del heap en $s0

    # Copiar el string al heap
    la $t0, long_string       # Dirección del string original
    move $t1, $s0             # Dirección del espacio reservado en el heap
    move $t2, $zero           # Contador

    copy_loop:
        lb $t3, 0($t0)        # Cargar un byte del string original
        sb $t3, 0($t1)        # Almacenar el byte en el heap
        beq $t3, $zero, done_copying  # Si es el byte nulo, terminamos de copiar
        addi $t0, $t0, 1      # Siguiente byte del string original
        addi $t1, $t1, 1      # Siguiente posición en el heap
        j copy_loop

    done_copying:
    move $v0, $s0             # Devolver la dirección del string en el heap
    jr $ra                    # Retorno
