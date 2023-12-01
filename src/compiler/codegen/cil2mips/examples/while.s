.globl main
main:
    #Region Let
    addi $sp, $sp, -4
    li $t0 20
    sw $t0, 0($sp)
    lw $t0, 0($sp)
    addi $t1, $t0, 3
    sw $t1, 0($sp)
    loop_0:
    li $t0 5
    lw $t1, 0($sp)
    slt $t2, $t0, $t1
    beq $t2, $zero, end_while_0
    lw $t0, 0($sp)
    addi $t1, $t0, -1
    sw $t1, 0($sp)
    
    ##imprime $a0##
    move $a0, $t1
    li $v0, 1
    syscall 
    ###############
    j loop_0
    end_while_0:
    lw $t0, 0($sp)
    addi $sp, $sp, 4
    #End Region Let
    move $a0, $t0
    jr $ra
    
    

    # Salir del programa
    li $v0, 10
    syscall