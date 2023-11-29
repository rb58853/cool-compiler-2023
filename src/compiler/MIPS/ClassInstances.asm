.text
create_A_instance:
    # Reservar memoria para A
    li $v0, 9                # syscall para reservar memoria
    li $a0, 1036             # Tamaño de A
    syscall
    move $s0, $v0            # Guarda la direcc de la instancia de A en $s0

    # Inicializar atributos de A
    li $t0, 0                # Valor por defecto para int x
    sw $t0, 0($s0)           # Inicializa x
    la $t0, default_string   # Direcc de una cadena por defecto
    sw $t0, 4($s0)           # Inicializa y
    # Continuar inicializndo de otros atributos
    jr $ra

create_B_instance:
    # Reservar memoria para B
    li $v0, 9
    li $a0, 8                # Tamaño de B
    syscall
    move $s1, $v0            # Guarda la direcc de la instancia de B en $s1

    # Inicializar atributos de B
    li $t0, 1                # Valor por defecto para int x
    sw $t0, 0($s1)           # Inicializa x
    jal create_C_instance    # Crea una instancia de C
    move $t0, $v0
    sw $t0, 4($s1)           # Inicializa c con la direcc de la instancia de C
    jr $ra

create_C_instance:
    # Reservar memoria para C
    li $v0, 9
    li $a0, 1024             # Tamaño de C
    syscall
    move $s2, $v0            # Guarda la direcc de la instancia de C en $s2

    # Inicializar atributos de C
    la $t0, C_string         # Direcc de la cadena "c_string"
    sw $t0, 0($s2)           # Inicializa s
    jr $ra
