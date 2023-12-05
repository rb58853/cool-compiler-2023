.data
str1: .asciiz "1234"
.text
.globl main
main:
	#Region Let
	addi $sp, $sp, -4
	li $a0, 5
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str1
	copy_0:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_0
	move $t0, $v0
	sw $t0, 0($sp)
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t0
	li $v0, 4
	syscall
	li $v0, 10
	syscall
__init_Main__:
	li $a0, 4
	li $v0, 9
	syscall
	move $s1, $v0
	move $a0, $s1
	jr $ra
