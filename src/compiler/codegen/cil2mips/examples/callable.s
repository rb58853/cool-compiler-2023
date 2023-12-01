.globl main
main:
#Region Let
addi $sp, $sp, -4
li $t0 4
sw $t0, 0($sp)
addi $sp, $sp, -4
lw $t0, 4($sp)
addi $sp, $sp, -12
li $t1 5
sw $t1, 4($sp)
li $t2 2
sw $t2, 8($sp)
jal __Main_test__
addi $sp, $sp, 12
add $t3, $t0, $a0
sw $t3, 0($sp)
addi $sp, $sp, -12
lw $t0, 12($sp)
sw $t0, 4($sp)
lw $t3, 16($sp)
sw $t3, 8($sp)
jal __Main_test__
addi $sp, $sp, 12
sw $a0, 4($sp)
lw $t4, 4($sp)
addi $sp, $sp, 8
#End Region Let
move $a0, $t4
li $v0, 1
syscall
li $v0, 10
syscall
__Main_test__:
#Region Let
addi $sp, $sp, -4
li $t5 10
sw $t5, 0($sp)
lw $t5, 12($sp)
lw $t6, 8($sp)
add $t7, $t5, $t6
lw $t5, 0($sp)
add $t6, $t7, $t5
sw $t6, 8($sp)
addi $sp, $sp, 4
#End Region Let
move $a0, $t6
jr $ra
