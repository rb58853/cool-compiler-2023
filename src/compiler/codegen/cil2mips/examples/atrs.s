.data
A: .asciiz "A"
B: .asciiz "B"
Main: .asciiz "Main"
.text
.globl main
main:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_A__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_B__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal B_a
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 0($sp)
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $t0 5
	sw $t0, 4($sp)
	jal A_set_y
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $t0 2
	sw $t0, 4($sp)
	jal A_f
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, 4
	#End Region Let
	li $v0, 10
	syscall
A_f:
	lw $t0, 0($sp)
	lw $t1, 4($t0)
	lw $t0, 4($sp)
	add $t2, $t1, $t0
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	add $t0, $t2, $t1
	sw $t0, 4($sp)
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $t0 10
	sw $t0, 4($sp)
	jal A_set_y
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	lw $t2, 8($t1)
	add $t1, $t0, $t2
	lw $t0, 0($sp)
	sw $t1, 12($t0)
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $t0 2
	sw $t0, 4($sp)
	jal A_test1
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
A_set_y:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	move $a0, $t0
	jr $ra
A_test1:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	lw $t2, 12($t1)
	mul $t1, $t0, $t2
	sw $t1, 4($sp)
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $t0 10
	sw $t0, 4($sp)
	jal A_set_y
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	jal A_test2
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
A_test2:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	lw $t0, 4($sp)
	add $t2, $t1, $t0
	move $a0, $t2
	jr $ra
B_b:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_B__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $a0, $t0
	jr $ra
B_a:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_A__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $a0, $t0
	jr $ra
__init_A__:
	li $a0, 16
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, A
	sw $t0, 0($s1)
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
	la $t0, B
	sw $t0, 0($s1)
	move $a0, $s1
	jr $ra
__init_Main__:
	li $a0, 4
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Main
	sw $t0, 0($s1)
	move $a0, $s1
	jr $ra
__init_IO__:
	li $a0, 4
	li $v0, 9
	syscall
	move $a0, $v0
	jr $ra
out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra