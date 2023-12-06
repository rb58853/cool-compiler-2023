.data
Main: .asciiz "Main"
Complex: .asciiz "Complex"
str1: .asciiz "=)\n"
str2: .asciiz "=(\n"
str3: .asciiz "+"
str4: .asciiz "I"
.text
.globl main
main:
	jal __init_Main__
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	jal Main_main
	li $v0, 10
	syscall
Main_main:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_Complex__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0 1
	sw $t0, 4($sp)
	li $t0 1
	sw $t0, 8($sp)
	jal Complex_init
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 0($sp)
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal Complex_reflect_X
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $s2, $a0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal Complex_reflect_Y
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal Complex_reflect_0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	beq $a0, $a0, compare_0
	addi $t0, $zero, 0
	j end_compare_0
	compare_0:
	addi $t0, $zero, 1
	end_compare_0:
	beq $t0, $zero, else_0
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 5
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str1
	copy_0:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_0
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	j endif_0
else_0:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 5
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_1:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_1
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
endif_0:
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
Complex_init:
	lw $t0, 0($sp)
	lw $t1, 4($t0)
	lw $t0, 4($sp)
	beq $t1, $t0, compare_1
	addi $t0, $zero, 0
	j end_compare_1
	compare_1:
	addi $t0, $zero, 1
	end_compare_1:
	lw $t1, 0($sp)
	lw $t2, 8($t1)
	lw $t1, 8($sp)
	beq $t2, $t1, compare_2
	addi $t1, $zero, 0
	j end_compare_2
	compare_2:
	addi $t1, $zero, 1
	end_compare_2:
	lw $t2, 0($sp)
	move $a0, $t2
	jr $ra
Complex_print:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	li $t0 0
	beq $t1, $t0, compare_3
	addi $t0, $zero, 0
	j end_compare_3
	compare_3:
	addi $t0, $zero, 1
	end_compare_3:
	beq $t0, $zero, else_1
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 16($sp)
	lw $t2, 4($t1)
	sw $t2, 4($sp)
	jal out_int
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	j endif_1
else_1:
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 16($sp)
	lw $t2, 4($t1)
	sw $t2, 4($sp)
	jal out_int
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $s2, $a0
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str3
	copy_2:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_2
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $s2, $a0
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 16($sp)
	lw $t2, 8($t1)
	sw $t2, 4($sp)
	jal out_int
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $s2, $a0
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_3:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_3
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
endif_1:
	jr $ra
Complex_reflect_0:
	lw $t0, 0($sp)
	lw $t1, 4($t0)
	beq $t1, $t1, compare_4
	addi $t0, $zero, 0
	j end_compare_4
	compare_4:
	addi $t0, $zero, 1
	end_compare_4:
	lw $t1, 0($sp)
	lw $t2, 8($t1)
	beq $t2, $t2, compare_5
	addi $t1, $zero, 0
	j end_compare_5
	compare_5:
	addi $t1, $zero, 1
	end_compare_5:
	lw $t2, 0($sp)
	move $a0, $t2
	jr $ra
Complex_reflect_X:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	beq $t1, $t1, compare_6
	addi $t0, $zero, 0
	j end_compare_6
	compare_6:
	addi $t0, $zero, 1
	end_compare_6:
	lw $t1, 0($sp)
	move $a0, $t1
	jr $ra
Complex_reflect_Y:
	lw $t0, 0($sp)
	lw $t1, 4($t0)
	beq $t1, $t1, compare_7
	addi $t0, $zero, 0
	j end_compare_7
	compare_7:
	addi $t0, $zero, 1
	end_compare_7:
	lw $t1, 0($sp)
	move $a0, $t1
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
__init_Complex__:
	li $a0, 12
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Complex
	sw $t0, 0($s1)
	li $t0 0
	sw $t0, 4($s1)
	li $t0 0
	sw $t0, 8($s1)
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
