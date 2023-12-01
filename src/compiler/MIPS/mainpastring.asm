.include "String.asm"

.text
.globl main
main:
    # Llamar a initialize_and_store_string para probar la funcin
    jal initialize_and_store_string
    move $s0, $v0  # Guardar la direcc del string en $s0


    li $v0, 10     # terminar
    syscall
