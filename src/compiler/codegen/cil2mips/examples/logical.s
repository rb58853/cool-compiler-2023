.data
abort: .asciiz "error abort from "
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
StaticVoid: .asciiz "Void"

StaticIO: .word StaticObject, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int

StaticObject: .word StaticVoid, 8, Object_type_name, Object_abort, Object_copy

StaticA: .word StaticObject, 20, A_type_name, A_abort, A_copy, A_init, A_get_name, A_set_name, A_set_x, A_set_b, A_print

StaticMain: .word StaticIO, 8, Main_type_name, Main_abort, Main_copy, Main_out_string, Main_out_int, Main_in_string, Main_in_int, Main_main

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
	lw $t1, 8($t0)
	move $a0, $t1
	jr $ra
A_set_name:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	move $a0, $t0
	jr $ra
A_set_x:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 12($t1)
	move $a0, $t0
	jr $ra
A_set_b:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 16($t1)
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
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 9
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str3
	copy_1:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_1
	move $t1, $v0
	sw $t1, 4($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 20($t1)
	jal $t1
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	lw $t2, 0($sp)
	move $s2, $t2
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $ra, 8($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t2, 24($sp)
	lw $t3, 8($t2)
	sw $t3, 4($sp)
	move $t2, $s2
	lw $t2, 4($t2)
	lw $t2, 20($t2)
	jal $t2
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $ra, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 7
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_2:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_2
	move $t3, $v0
	sw $t3, 4($sp)
	move $t3, $s2
	lw $t3, 4($t3)
	lw $t3, 20($t3)
	jal $t3
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	lw $t4, 0($sp)
	move $s2, $t4
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $ra, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t4, 32($sp)
	lw $t5, 12($t4)
	sw $t5, 4($sp)
	move $t4, $s2
	lw $t4, 4($t4)
	lw $t4, 24($t4)
	jal $t4
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	lw $t5, 0($sp)
	move $s2, $t5
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $ra, 20($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 7
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str5
	copy_3:
	lb $t5, 0($s3)
	sb $t5, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t5, copy_3
	move $t5, $v0
	sw $t5, 4($sp)
	move $t5, $s2
	lw $t5, 4($t5)
	lw $t5, 20($t5)
	jal $t5
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	lw $t6, 4($sp)
	lw $t7, 16($t6)
	beq $t7, $zero, else_0
	lw $t6, 0($sp)
	move $s2, $t6
	addi $sp, $sp, -32
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t7, 24($sp)
	sw $ra, 28($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 7
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str6
	copy_4:
	lb $t6, 0($s3)
	sb $t6, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t6, copy_4
	move $t6, $v0
	sw $t6, 4($sp)
	move $t6, $s2
	lw $t6, 4($t6)
	lw $t6, 20($t6)
	jal $t6
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t7, 24($sp)
	lw $ra, 28($sp)
	addi $sp, $sp, 32
	j endif_0
else_0:
	lw $t8, 0($sp)
	move $s2, $t8
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $ra, 32($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 8
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str7
	copy_5:
	lb $t8, 0($s3)
	sb $t8, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t8, copy_5
	move $t8, $v0
	sw $t8, 4($sp)
	move $t8, $s2
	lw $t8, 4($t8)
	lw $t8, 20($t8)
	jal $t8
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $ra, 32($sp)
	addi $sp, $sp, 36
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
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jal $t0
	addi $sp, $sp, 16
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 40($t1)
	jal $t1
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	li $t2 3
	li $t3 3
	beq $t2, $t3, compare_0
	addi $t2, $zero, 0
	j end_compare_3
	compare_0:
	addi $t2, $zero, 1
	end_compare_3:
	beq $t2, $zero, else_1
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $ra, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str9
	copy_7:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_7
	move $t3, $v0
	sw $t3, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	j endif_1
else_1:
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $ra, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str10
	copy_8:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_8
	move $t3, $v0
	sw $t3, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
endif_1:
	li $t3 3
	li $t4 3
	slt $t5, $t4, $t3
	li $t4, 1
	slt $t5, $t5, $t4
	beq $t5, $zero, else_2
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str11
	copy_9:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_9
	move $t3, $v0
	sw $t3, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	j endif_2
else_2:
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t5, 12($sp)
	sw $ra, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str12
	copy_10:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_10
	move $t3, $v0
	sw $t3, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t5, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
endif_2:
	li $t3 3
	li $t4 3
	slt $t6, $t3, $t4
	beq $t6, $zero, else_3
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t5, 12($sp)
	sw $t6, 16($sp)
	sw $ra, 20($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str13
	copy_11:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_11
	move $t3, $v0
	sw $t3, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t5, 12($sp)
	lw $t6, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	j endif_3
else_3:
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t5, 12($sp)
	sw $t6, 16($sp)
	sw $ra, 20($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str14
	copy_12:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_12
	move $t3, $v0
	sw $t3, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t5, 12($sp)
	lw $t6, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, 24
endif_3:
	li $t3 3
	li $t4 4
	slt $t7, $t3, $t4
	beq $t7, $zero, else_4
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -28
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t5, 12($sp)
	sw $t6, 16($sp)
	sw $t7, 20($sp)
	sw $ra, 24($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str15
	copy_13:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_13
	move $t3, $v0
	sw $t3, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t5, 12($sp)
	lw $t6, 16($sp)
	lw $t7, 20($sp)
	lw $ra, 24($sp)
	addi $sp, $sp, 28
	j endif_4
else_4:
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -28
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t5, 12($sp)
	sw $t6, 16($sp)
	sw $t7, 20($sp)
	sw $ra, 24($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str16
	copy_14:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_14
	move $t3, $v0
	sw $t3, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t5, 12($sp)
	lw $t6, 16($sp)
	lw $t7, 20($sp)
	lw $ra, 24($sp)
	addi $sp, $sp, 28
endif_4:
	la $t3, str17
	la $t4, str18
	loop_compare_0:
	lb $s5, 0($t3)
	lb $s6, 0($t4)
	addiu $t3, $t3, 1
	addiu $t4, $t4, 1
	bne $s5, $s6, end_not_equals_0
	bnez $s5, loop_compare_0
	li $t3, 1
	j end_compare_0
	end_not_equals_0:
	li $t3, 0
	end_compare_0:
	beq $t3, $zero, else_5
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -28
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t5, 12($sp)
	sw $t6, 16($sp)
	sw $t7, 20($sp)
	sw $ra, 24($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 21
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str19
	copy_15:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_15
	move $t3, $v0
	sw $t3, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t5, 12($sp)
	lw $t6, 16($sp)
	lw $t7, 20($sp)
	lw $ra, 24($sp)
	addi $sp, $sp, 28
	j endif_5
else_5:
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -28
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t5, 12($sp)
	sw $t6, 16($sp)
	sw $t7, 20($sp)
	sw $ra, 24($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 22
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str20
	copy_16:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_16
	move $t3, $v0
	sw $t3, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t5, 12($sp)
	lw $t6, 16($sp)
	lw $t7, 20($sp)
	lw $ra, 24($sp)
	addi $sp, $sp, 28
endif_5:
	la $t3, str21
	la $t4, str22
	loop_compare_1:
	lb $s5, 0($t3)
	lb $s6, 0($t4)
	addiu $t3, $t3, 1
	addiu $t4, $t4, 1
	bne $s5, $s6, end_not_equals_1
	bnez $s5, loop_compare_1
	li $t3, 1
	j end_compare_1
	end_not_equals_1:
	li $t3, 0
	end_compare_1:
	beq $t3, $zero, else_6
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -28
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t5, 12($sp)
	sw $t6, 16($sp)
	sw $t7, 20($sp)
	sw $ra, 24($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 22
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str23
	copy_17:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_17
	move $t3, $v0
	sw $t3, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t5, 12($sp)
	lw $t6, 16($sp)
	lw $t7, 20($sp)
	lw $ra, 24($sp)
	addi $sp, $sp, 28
	j endif_6
else_6:
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -28
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t5, 12($sp)
	sw $t6, 16($sp)
	sw $t7, 20($sp)
	sw $ra, 24($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 23
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str24
	copy_18:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_18
	move $t3, $v0
	sw $t3, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t5, 12($sp)
	lw $t6, 16($sp)
	lw $t7, 20($sp)
	lw $ra, 24($sp)
	addi $sp, $sp, 28
endif_6:
	la $t3, str25
	la $t4, str26
	loop_compare_2:
	lb $s5, 0($t3)
	lb $s6, 0($t4)
	addiu $t3, $t3, 1
	addiu $t4, $t4, 1
	bne $s5, $s6, end_not_equals_2
	bnez $s5, loop_compare_2
	li $t3, 1
	j end_compare_2
	end_not_equals_2:
	li $t3, 0
	end_compare_2:
	beq $t3, $zero, else_7
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -28
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t5, 12($sp)
	sw $t6, 16($sp)
	sw $t7, 20($sp)
	sw $ra, 24($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 22
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str27
	copy_19:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_19
	move $t3, $v0
	sw $t3, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t5, 12($sp)
	lw $t6, 16($sp)
	lw $t7, 20($sp)
	lw $ra, 24($sp)
	addi $sp, $sp, 28
	j endif_7
else_7:
	lw $t3, 0($sp)
	move $s2, $t3
	addi $sp, $sp, -28
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t5, 12($sp)
	sw $t6, 16($sp)
	sw $t7, 20($sp)
	sw $ra, 24($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 23
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str28
	copy_20:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_20
	move $t3, $v0
	sw $t3, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t5, 12($sp)
	lw $t6, 16($sp)
	lw $t7, 20($sp)
	lw $ra, 24($sp)
	addi $sp, $sp, 28
endif_7:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -28
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t5, 12($sp)
	sw $t6, 16($sp)
	sw $t7, 20($sp)
	sw $ra, 24($sp)
	jal __init_A__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t5, 12($sp)
	lw $t6, 16($sp)
	lw $t7, 20($sp)
	lw $ra, 24($sp)
	addi $sp, $sp, 28
	move $t3, $a0
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	lw $t3, 4($sp)
	sw $t3, 0($sp)
	lw $t3, 4($sp)
	lw $t4, 0($sp)
	beq $t3, $t4, compare_1
	addi $t3, $zero, 0
	j end_compare_4
	compare_1:
	addi $t3, $zero, 1
	end_compare_4:
	beq $t3, $zero, else_8
	lw $t4, 8($sp)
	move $s2, $t4
	addi $sp, $sp, -32
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t5, 16($sp)
	sw $t6, 20($sp)
	sw $t7, 24($sp)
	sw $ra, 28($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str29
	copy_21:
	lb $t4, 0($s3)
	sb $t4, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t4, copy_21
	move $t4, $v0
	sw $t4, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t5, 16($sp)
	lw $t6, 20($sp)
	lw $t7, 24($sp)
	lw $ra, 28($sp)
	addi $sp, $sp, 32
	j endif_8
else_8:
	lw $t4, 8($sp)
	move $s2, $t4
	addi $sp, $sp, -32
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t5, 16($sp)
	sw $t6, 20($sp)
	sw $t7, 24($sp)
	sw $ra, 28($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str30
	copy_22:
	lb $t4, 0($s3)
	sb $t4, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t4, copy_22
	move $t4, $v0
	sw $t4, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t5, 16($sp)
	lw $t6, 20($sp)
	lw $t7, 24($sp)
	lw $ra, 28($sp)
	addi $sp, $sp, 32
endif_8:
	addi $sp, $sp, -32
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t5, 16($sp)
	sw $t6, 20($sp)
	sw $t7, 24($sp)
	sw $ra, 28($sp)
	jal __init_A__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t5, 16($sp)
	lw $t6, 20($sp)
	lw $t7, 24($sp)
	lw $ra, 28($sp)
	addi $sp, $sp, 32
	move $t4, $a0
	sw $t4, 4($sp)
	lw $t4, 8($sp)
	move $s2, $t4
	addi $sp, $sp, -32
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t5, 16($sp)
	sw $t6, 20($sp)
	sw $t7, 24($sp)
	sw $ra, 28($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 12
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str31
	copy_23:
	lb $t4, 0($s3)
	sb $t4, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t4, copy_23
	move $t4, $v0
	sw $t4, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t5, 16($sp)
	lw $t6, 20($sp)
	lw $t7, 24($sp)
	lw $ra, 28($sp)
	addi $sp, $sp, 32
	lw $t4, 4($sp)
	lw $t8, 0($sp)
	beq $t4, $t8, compare_2
	addi $t4, $zero, 0
	j end_compare_5
	compare_2:
	addi $t4, $zero, 1
	end_compare_5:
	beq $t4, $zero, else_9
	lw $t8, 8($sp)
	move $s2, $t8
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $ra, 32($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 19
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str32
	copy_24:
	lb $t8, 0($s3)
	sb $t8, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t8, copy_24
	move $t8, $v0
	sw $t8, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $ra, 32($sp)
	addi $sp, $sp, 36
	j endif_9
else_9:
	lw $t8, 8($sp)
	move $s2, $t8
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $ra, 32($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 20
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str33
	copy_25:
	lb $t8, 0($s3)
	sb $t8, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t8, copy_25
	move $t8, $v0
	sw $t8, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $ra, 32($sp)
	addi $sp, $sp, 36
endif_9:
	addi $sp, $sp, 8
	#End Region Let
	jr $ra
__init_A__:
	li $a0, 20
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, A
	sw $t0, 0($s1)
	la $t0, StaticA
	sw $t0, 4($s1)
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
	sw $t0, 8($s1)
	li $t0 0
	sw $t0, 12($s1)
	li $t0 0
	sw $t0, 16($s1)
	move $a0, $s1
	jr $ra
__init_Main__:
	li $a0, 8
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Main
	sw $t0, 0($s1)
	la $t0, StaticMain
	sw $t0, 4($s1)
	move $a0, $s1
	jr $ra
IO_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
IO_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
IO_in_int:
	jr $ra
IO_in_string:
	jr $ra
IO_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
IO_copy:
	jr $ra
IO_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
Object_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Object_copy:
	jr $ra
Object_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
A_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
A_copy:
	jr $ra
A_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
Main_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
Main_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
Main_in_int:
	jr $ra
Main_in_string:
	jr $ra
Main_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Main_copy:
	jr $ra
Main_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
__init_IO__:
	li $a0, 8
	li $v0, 9
	syscall
	la $t0, StaticIO
	sw $t0, 4($v0) 
	move $a0, $v0
	jr $ra
