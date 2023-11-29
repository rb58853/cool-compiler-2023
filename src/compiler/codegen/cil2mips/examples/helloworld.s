.data
    hello: .asciiz "Hola Mundo"
    newline: .asciiz "\n"

.text
.globl main
main:
    #salto de linea
    la $a0, newline
    syscall
    
    # Imprimir "Hola Mundo"
    li $v0, 4
    la $a0, hello
    syscall
    
    #salto de linea
    la $a0, newline
    syscall

    # Salir del programa
    li $v0, 10
    syscall
