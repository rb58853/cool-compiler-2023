.text
.globl main
main:
    # Crear instancias de las clases A, B y C
    jal create_A_instance
    move $s0, $v0  # $s0 ahora apunta a la instancia de A

    jal create_B_instance
    move $s1, $v0  # $s1 ahora apunta a la instancia de B

    jal create_C_instance
    move $s2, $v0  # $s2 ahora apunta a la instancia de C

    move $a0, $s1  # Establece el argumento para el mtdo de B Qe la instancia de B
    lw $t0, 4($a0) # Carga la direcc de la vtable de B
    lw $t0, 0($t0) # Carga la direcc del mtdo de B
    jalr $t0       # Llama al método de B

  
    move $a0, $s2
    lw $t0, 4($a0)
    lw $t0, 0($t0)
    jalr $t0

    # Termina
    li $v0, 10
    syscall
