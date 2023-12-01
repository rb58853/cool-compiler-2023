.globl main
main:
#Region Let
addi $sp, $sp, -4
li $t0 2
sw $t0, 0($sp)
addi $sp, $sp, -4
addi $sp, $sp, -0
addi $sp, $sp, -12
li $t0 5
sw $t0, 4($sp)
li $t1 2
sw $t1, 8($sp)
jal Main_test
addi $sp, $sp, 12
addi $sp, $sp, 0
addi $t2, $a0, 2
sw $t2, 0($sp)
lw $t2, 0($sp)
addi $sp, $sp, 8
#End Region Let
move $a0, $t2
li $v0, 1
syscall
li $v0, 10
syscall
Main_test:
#Region Let
addi $sp, $sp, -4
li $t0 10
sw $t0, 0($sp)
lw $t0, 12($sp)
lw $t1, 8($sp)
add $t2, $t0, $t1
lw $t0, 0($sp)
add $t1, $t2, $t0
sw $t1, 8($sp)
addi $sp, $sp, 4
#End Region Let
move $a0, $t1
jr $ra