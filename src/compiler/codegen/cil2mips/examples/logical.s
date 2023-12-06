.data
A: .asciiz "A"
Main: .asciiz "Main"
str2: .asciiz "A:\n"
str3: .asciiz "Nombre: "
str4: .asciiz "\nx = "
str5: .asciiz "\nb = "
str6: .asciiz "true\n"
str7: .asciiz "false\n"
str8: .asciiz "test_name_A "
str9: .asciiz "3 = 3 true\n"
str10: .asciiz "3 = 3 false\n"
str11: .asciiz "3 <= 3 true\n"
str12: .asciiz "3 <= 3 false\n"
str13: .asciiz "3 < 3 true\n"
str14: .asciiz "3 < 3 false\n"
str15: .asciiz "3 < 4 true\n"
str16: .asciiz "3 < 4 false\n"
str17: .asciiz "asd"
str18: .asciiz "asd"
str19: .asciiz "'asd' = 'asd' true\n"
str20: .asciiz "'asd' = 'asd' false\n"
str21: .asciiz "asda"
str22: .asciiz "asd"
str23: .asciiz "'asda' = 'asd' true\n"
str24: .asciiz "'asda' = 'asd' false\n"
str25: .asciiz "assa"
str26: .asciiz "asd"
str27: .asciiz "'assa' = 'asd' true\n"
str28: .asciiz "'assa' = 'asd' false\n"
str29: .asciiz "a = a0 true\n"
str30: .asciiz "a = a0 false\n"
str31: .asciiz "a = new A\n"
str32: .asciiz "a(new) = a0 true\n"
str33: .asciiz "a(new) = a0 false\n"
str1: .asciiz "A"
.text
.globl main
main:
	jal __init_Main__
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	jal Main_main
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
	copy_0:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_0
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
	copy_1:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_1
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
	copy_2:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_2
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
	copy_3:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_3
	move $t0, $v0
	sw $t0, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 4($sp)
	lw $t1, 12($t0)
	beq $t1, $zero, else_0
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
	copy_4:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_4
	move $t0, $v0
	sw $t0, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t1, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	j endif_0
else_0:
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
	lw $t1, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
endif_0:
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
Main_main:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_A__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	sw $t0, 0($sp)
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -16
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str8
	copy_6:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_6
	move $t0, $v0
	sw $t0, 4($sp)
	li $t0 1
	sw $t0, 8($sp)
	li $t0 1
	sw $t0, 12($sp)
	jal A_init
	addi $sp, $sp, 16
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal A_print
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, 4
	#End Region Let
	li $t0 3
	li $t1 3
	beq $t0, $t1, compare_0
	addi $t0, $zero, 0
	j end_compare_3
	compare_0:
	addi $t0, $zero, 1
	end_compare_3:
	beq $t0, $zero, else_1
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
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str9
	copy_7:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_7
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	j endif_1
else_1:
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
	la $s3, str10
	copy_8:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_8
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
endif_1:
	li $t1 3
	li $t2 3
	slt $t3, $t2, $t1
	li $t2, 1
	slt $t3, $t3, $t2
	beq $t3, $zero, else_2
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $ra, 8($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $ra, 8($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str11
	copy_9:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_9
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	j endif_2
else_2:
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $ra, 8($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $ra, 8($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str12
	copy_10:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_10
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
endif_2:
	li $t1 3
	li $t2 3
	slt $t4, $t1, $t2
	beq $t4, $zero, else_3
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $ra, 12($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $ra, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str13
	copy_11:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_11
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	j endif_3
else_3:
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $ra, 12($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $ra, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str14
	copy_12:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_12
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
endif_3:
	li $t1 3
	li $t2 4
	slt $t5, $t1, $t2
	beq $t5, $zero, else_4
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str15
	copy_13:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_13
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	j endif_4
else_4:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str16
	copy_14:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_14
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
endif_4:
	la $t1, str17
	la $t2, str18
	loop_compare_0:
	lb $s5, 0($t1)
	lb $s6, 0($t2)
	addiu $t1, $t1, 1
	addiu $t2, $t2, 1
	bne $s5, $s6, end_not_equals_0
	bnez $s5, loop_compare_0
	li $t1, 1
	j end_compare_0
	end_not_equals_0:
	li $t1, 0
	end_compare_0:
	beq $t1, $zero, else_5
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 21
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str19
	copy_15:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_15
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	j endif_5
else_5:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 22
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str20
	copy_16:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_16
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
endif_5:
	la $t1, str21
	la $t2, str22
	loop_compare_1:
	lb $s5, 0($t1)
	lb $s6, 0($t2)
	addiu $t1, $t1, 1
	addiu $t2, $t2, 1
	bne $s5, $s6, end_not_equals_1
	bnez $s5, loop_compare_1
	li $t1, 1
	j end_compare_1
	end_not_equals_1:
	li $t1, 0
	end_compare_1:
	beq $t1, $zero, else_6
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 22
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str23
	copy_17:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_17
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	j endif_6
else_6:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 23
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str24
	copy_18:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_18
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
endif_6:
	la $t1, str25
	la $t2, str26
	loop_compare_2:
	lb $s5, 0($t1)
	lb $s6, 0($t2)
	addiu $t1, $t1, 1
	addiu $t2, $t2, 1
	bne $s5, $s6, end_not_equals_2
	bnez $s5, loop_compare_2
	li $t1, 1
	j end_compare_2
	end_not_equals_2:
	li $t1, 0
	end_compare_2:
	beq $t1, $zero, else_7
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 22
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str27
	copy_19:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_19
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	j endif_7
else_7:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 23
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str28
	copy_20:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_20
	move $t1, $v0
	sw $t1, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
endif_7:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	jal __init_A__
	lw $t0, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	move $t1, $a0
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	lw $t1, 4($sp)
	sw $t1, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 0($sp)
	beq $t1, $t2, compare_1
	addi $t1, $zero, 0
	j end_compare_4
	compare_1:
	addi $t1, $zero, 1
	end_compare_4:
	beq $t1, $zero, else_8
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t3, 8($sp)
	sw $t4, 12($sp)
	sw $t5, 16($sp)
	sw $ra, 20($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t3, 8($sp)
	lw $t4, 12($sp)
	lw $t5, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	move $t2, $a0
	move $s2, $t2
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t3, 8($sp)
	sw $t4, 12($sp)
	sw $t5, 16($sp)
	sw $ra, 20($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str29
	copy_21:
	lb $t2, 0($s3)
	sb $t2, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t2, copy_21
	move $t2, $v0
	sw $t2, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t3, 8($sp)
	lw $t4, 12($sp)
	lw $t5, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	j endif_8
else_8:
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t3, 8($sp)
	sw $t4, 12($sp)
	sw $t5, 16($sp)
	sw $ra, 20($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t3, 8($sp)
	lw $t4, 12($sp)
	lw $t5, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	move $t2, $a0
	move $s2, $t2
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t3, 8($sp)
	sw $t4, 12($sp)
	sw $t5, 16($sp)
	sw $ra, 20($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str30
	copy_22:
	lb $t2, 0($s3)
	sb $t2, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t2, copy_22
	move $t2, $v0
	sw $t2, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t3, 8($sp)
	lw $t4, 12($sp)
	lw $t5, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, 24
endif_8:
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t3, 8($sp)
	sw $t4, 12($sp)
	sw $t5, 16($sp)
	sw $ra, 20($sp)
	jal __init_A__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t3, 8($sp)
	lw $t4, 12($sp)
	lw $t5, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	move $t2, $a0
	sw $t2, 4($sp)
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t3, 8($sp)
	sw $t4, 12($sp)
	sw $t5, 16($sp)
	sw $ra, 20($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t3, 8($sp)
	lw $t4, 12($sp)
	lw $t5, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	move $t2, $a0
	move $s2, $t2
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t3, 8($sp)
	sw $t4, 12($sp)
	sw $t5, 16($sp)
	sw $ra, 20($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 12
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str31
	copy_23:
	lb $t2, 0($s3)
	sb $t2, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t2, copy_23
	move $t2, $v0
	sw $t2, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t3, 8($sp)
	lw $t4, 12($sp)
	lw $t5, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	lw $t2, 4($sp)
	lw $t6, 0($sp)
	beq $t2, $t6, compare_2
	addi $t2, $zero, 0
	j end_compare_5
	compare_2:
	addi $t2, $zero, 1
	end_compare_5:
	beq $t2, $zero, else_9
	addi $sp, $sp, -28
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $ra, 24($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $ra, 24($sp)
	addi $sp, $sp, 28
	move $t6, $a0
	move $s2, $t6
	addi $sp, $sp, -28
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $ra, 24($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 19
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str32
	copy_24:
	lb $t6, 0($s3)
	sb $t6, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t6, copy_24
	move $t6, $v0
	sw $t6, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $ra, 24($sp)
	addi $sp, $sp, 28
	j endif_9
else_9:
	addi $sp, $sp, -28
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $ra, 24($sp)
	jal __init_IO__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $ra, 24($sp)
	addi $sp, $sp, 28
	move $t6, $a0
	move $s2, $t6
	addi $sp, $sp, -28
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $ra, 24($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 20
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str33
	copy_25:
	lb $t6, 0($s3)
	sb $t6, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t6, copy_25
	move $t6, $v0
	sw $t6, 4($sp)
	jal out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $ra, 24($sp)
	addi $sp, $sp, 28
endif_9:
	addi $sp, $sp, 8
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
	copy_26:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_26
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
