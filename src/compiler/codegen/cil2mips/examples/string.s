.data
str1: .asciiz "1234"
.text
.globl main
main:
	li $a0, 5
	li $v0, 9
	syscall
	move $s1, $v0
	la $s3, str1
	copy_0:
	lb $t0, 0($s3)
	sb $t0, 0($s1)
	addiu $s3, $s3, 1
	addiu $s1, $s1, 1
	bnez $t0, copy_0
	move $t0, $v0
	move $a0, $t0
	
	li $v0, 4
	syscall
	li $v0, 10
	syscall