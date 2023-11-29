.data
    newline: .asciiz "\n"

.text
.globl main
main:
    #salto de linea
    la $a0, newline
    syscall
    
    # Asignar los dos números a los registros $t0 y $t1
    li $t0, 5
    li $t1, 7

    # Sumar los dos números y guardar el resultado en el registro $s0
    addi $s0, $t1, 8
    add $s0, $s0, $t1

    # Imprimir la suma
    move $a0, $s0
    li $v0, 1
    syscall

    # Salir del programa
    li $v0, 10
    syscall
