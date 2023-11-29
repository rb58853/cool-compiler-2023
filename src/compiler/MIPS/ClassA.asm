# Class A Structure
# int x = 0; (4 bytes)
# string y = ""; (1024 bytes)
# B b; (4 bytes, puntero a B)
# C c = new C; (4 bytes, puntero a C)

# Tamaño total: 1036 bytes (4 + 1024 + 4 + 4)

.data
A_vtable: .word A_set_x, A_get_x, A_update_y, A_use_B_C  # Act de la tabla de mtdos virtuales (disptac)

.text
A_set_x:
    # Argumentos:
    # $a0 - Dirección de la instancia de la clase A
    # $a1 - Valor entero a asignar a x

    sw $a1, 0($a0)  # Establece x al valor proporcionado en $a1
    jr $ra          


A_get_x:
    lw $v0, 0($a0)  # Carga el valor de x en $v0
    jr $ra          # Retorna con el valor en $v0


A_update_y:
    # $a0 - Direc de la instancia de la clase A
    # $a1 - Direc del nuevo string para asignar a y

    sw $a1, 4($a0)  # Actualiza y con la nueva direccion del string
    jr $ra       


A_use_B_C:
    # Argumentos:
    # $a0 - Direccion de la instancia de la clase A

    lw $t0, 8($a0)  # Carga la direcc de la instancia de B
    # Supongamos que B tiene un mtodo B_method que queremos llamar
    lw $t1, 0($t0)  # Carga la direc del mtdo B_method
    jalr $t1        # Llama a B_method

    #si queremos usar el resultado de B_method en un mtdo de C
    move $a1, $v0   # Mueve el resultado a $a1
    lw $t0, 12($a0) # Carga la direcc de la instancia de C
    # Supongamos que C tiene un mtdo C_method que toma un argumento
    lw $t1, 0($t0)  # Carga la direcc del mtdo C_method
    jalr $t1        # Llama a C_method con el resultado de B_method

    jr $ra       
