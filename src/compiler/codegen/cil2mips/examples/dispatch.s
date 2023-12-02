.globl main
main:
jal __init_B__
move $t0 $a0
move $s2 $t0
addi $sp, $sp, -4
sw $t0, 0($sp)
addi $sp, $sp, -4
sw $s2, 0($sp)
jal B_a
addi $sp, $sp, 4
lw $t0, 0($sp)
addi $sp, $sp, 4
move $s2 $a0
addi $sp, $sp, -4
sw $t0, 0($sp)
addi $sp, $sp, -8
sw $s2, 0($sp)
li $t1 2
sw $t1, 4($sp)
jal A_f
addi $sp, $sp, 8
lw $t0, 0($sp)
addi $sp, $sp, 4
move $a0, $a0
li $v0, 1
syscall
li $v0, 10
syscall
A_f:
lw $t0, 4($sp)
lw $t1, 0($sp)
lw $t2, 4($t1)
add $t1, $t0, $t2
move $a0, $t1
jr $ra
B_a:
jal __init_A__
move $t0 $a0
move $a0, $t0
jr $ra
__init_A__:
li $a0, 16
li $v0, 9
syscall
move $s1, $v0
li $t0 13
sw $t0, 4($s1)
li $t0 0
sw $t0, 8($s1)
li $t0 0
sw $t0, 12($s1)
move $a0, $s1
jr $ra
__init_B__:
li $a0, 4
li $v0, 9
syscall
move $s1, $v0
move $a0, $s1
jr $ra
__init_Main__:
li $a0, 4
li $v0, 9
syscall
move $s1, $v0
move $a0, $s1
jr $ra
