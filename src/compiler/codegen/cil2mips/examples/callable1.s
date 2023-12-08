.globl main
main:
#Region Let
addi $sp, $sp, -4
li $t0 2
sw $t0, 0($sp)
addi $sp, $sp, -4
lw $t0, 4($sp)
addi $sp, $sp, -4
sw $t0, 0($sp)
addi $sp, $sp, -12
addi $sp, $sp, -4
sw $t0, 0($sp)
addi $sp, $sp, -12
addi $sp, $sp, -4
sw $t0, 0($sp)
addi $sp, $sp, -12
li $t1 10
sw $t1, 4($sp)
li $t2 10
sw $t2, 8($sp)
jal Main_test
addi $sp, $sp, 12
lw $t0, 0($sp)
addi $sp, $sp, 4
sw $a0, 4($sp)
lw $t3, 36($sp)
sw $t3, 8($sp)
jal Main_test
addi $sp, $sp, 12
lw $t0, 0($sp)
addi $sp, $sp, 4
sw $a0, 4($sp)
li $t4 2
sw $t4, 8($sp)
jal Main_test
addi $sp, $sp, 12
lw $t0, 0($sp)
addi $sp, $sp, 4
add $t5, $t0, $a0
sw $t5, 0($sp)
lw $t0, 0($sp)
addi $sp, $sp, 8
#End Region Let
move $a0, $t0
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
__init_Main__:
li $a0, 4
li $v0, 9
syscall
move $s1, $v0
move $a0, $s1
jr $ra
