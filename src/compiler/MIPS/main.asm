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


    li $v0, 10     # syscall para terminar el programa
    syscall
