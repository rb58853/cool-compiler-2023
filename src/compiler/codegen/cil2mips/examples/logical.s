.data
A: .asciiz "A"
Main: .asciiz "Main"
str8: .asciiz "a = a0 true\n"
str9: .asciiz "a = a0 false\n"
str10: .asciiz "a = new A\n"
str11: .asciiz "a(new) = a0 true\n"
str12: .asciiz "a(new) = a0 false\n"
str2: .asciiz "A:\n"
str3: .asciiz "Nombre: "
str4: .asciiz "\nx = "
str5: .asciiz "\nb = "
str6: .asciiz "true\n"
str7: .asciiz "false\n"
str1: .asciiz "A"
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
	lw $t0, 4($sp)
	sw $t0, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	beq $t0, $t1, compare_0
	addi $t0, $zero, 0
	j end_compare_0
	compare_0:
	addi $t0, $zero, 1
	end_compare_0:
	beq $t0, $zero, else_0
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str8
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
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str9
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
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	jal __init_A__
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $t1, $a0
	sw $t1, 4($sp)
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 12
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str10
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
	lw $t1, 4($sp)
	lw $t2, 0($sp)
	beq $t1, $t2, compare_1
	addi $t1, $zero, 0
	j end_compare_1
	compare_1:
	addi $t1, $zero, 1
	end_compare_1:
	beq $t1, $zero, else_1
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $ra, 8($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	move $t2, $a0
	move $s2, $t2
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $ra, 8($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 19
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str11
	copy_3:
	lb $t2, 0($s3)
	sb $t2, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t2, copy_3
	move $t2, $v0
	sw $t2, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	j endif_1
else_1:
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $ra, 8($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	move $t2, $a0
	move $s2, $t2
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $ra, 8($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 20
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str12
	copy_4:
	lb $t2, 0($s3)
	sb $t2, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t2, copy_4
	move $t2, $v0
	sw $t2, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
endif_1:
	addi $sp, $sp, 8
	#End Region Let
	li $v0, 10
	syscall
A_init:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	jal A_set_name
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 20($sp)
	sw $t0, 4($sp)
	jal A_set_x
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	sw $t0, 4($sp)
	jal A_set_b
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
A_get_name:
	lw $t0, 0($sp)
	lw $t1, 4($t0)
	move $a0, $t1
	jr $ra
A_set_name:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 4($t1)
	move $a0, $t0
	jr $ra
A_set_x:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	move $a0, $t0
	jr $ra
A_set_b:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 12($t1)
	move $a0, $t0
	jr $ra
A_print:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_IO__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	sw $t0, 0($sp)
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 5
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_5:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_5
	move $t0, $v0
	sw $t0, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 9
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str3
	copy_6:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_6
	move $t0, $v0
	sw $t0, 4($sp)
	jal out_string
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
	lw $t1, 4($t0)
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 7
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_7:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_7
	move $t0, $v0
	sw $t0, 4($sp)
	jal out_string
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
	lw $t1, 8($t0)
	sw $t1, 4($sp)
	jal out_int
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 7
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str5
	copy_8:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_8
	move $t0, $v0
	sw $t0, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 4($sp)
	lw $t1, 12($t0)
	beq $t1, $zero, else_2
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $t1, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 7
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str6
	copy_9:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_9
	move $t0, $v0
	sw $t0, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t1, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	j endif_2
else_2:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $t1, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 8
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str7
	copy_10:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_10
	move $t0, $v0
	sw $t0, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t1, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
endif_2:
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
__init_A__:
	li $a0, 16
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, A
	sw $t0, 0($s1)
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str1
	copy_11:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_11
	move $t0, $v0
	sw $t0, 4($s1)
	li $t0 0
	sw $t0, 8($s1)
	li $t0 0
	sw $t0, 12($s1)
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
