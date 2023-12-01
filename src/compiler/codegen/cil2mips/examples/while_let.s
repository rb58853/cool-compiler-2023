.globl main
    main:
    #Region Let
    addi $sp, $sp, -4
    #Region Let
    addi $sp, $sp, -4
    li $t0 1
    sw $t0, 0($sp)
    lw $t0, 0($sp)
    #Region Let
    addi $sp, $sp, -4
    lw $t1, 4($sp)
    addi $t2, $t1, 2
    sw $t2, 0($sp)
    lw $t1, 0($sp)
    lw $t2, 4($sp)
    add $t3, $t1, $t2
    addi $sp, $sp, 4
    #End Region Let
    add $t1, $t0, $t3
    addi $sp, $sp, 4
    #End Region Let
    addi $t0, $t1, 2
    sw $t0, 0($sp)
    addi $sp, $sp, -4
    li $t0 0
    sw $t0, 0($sp)
    lw $t0, 4($sp)
    addi $t1, $t0, 3
    sw $t1, 4($sp)

    
    loop_0:
    li $t0 5
    lw $t1, 4($sp)
    slt $t2, $t0, $t1
    beq $t2, $zero, end_while_0
    lw $t0, 4($sp)
    addi $t1, $t0, -1
    sw $t1, 4($sp)

    ##imprime $a0##
    move $a0, $t1
    li $v0, 1
    syscall 
    ###############

    j loop_0
    end_while_0:
    lw $t0, 4($sp)
    addi $sp, $sp, 8
    #End Region Let
    
    ##imprime $a0##
    move $a0, $t1
    li $v0, 1
    syscall 
    ###############

    # Salir del programa
    li $v0, 10
    syscall