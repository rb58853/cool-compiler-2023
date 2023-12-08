.data
abort: .asciiz "error abort from "
Main: .asciiz "Main"
Complex: .asciiz "Complex"
str1: .asciiz "=)\n"
str2: .asciiz "=(\n"
str3: .asciiz "+"
str4: .asciiz "I"
StaticVoid: .asciiz "Void"

StaticIO: .word StaticObject, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int

StaticObject: .word StaticVoid, 8, Object_type_name, Object_abort, Object_copy

StaticMain: .word StaticIO, 8, Main_type_name, Main_abort, Main_copy, Main_out_string, Main_out_int, Main_in_string, Main_in_int, Main_main

StaticComplex: .word StaticIO, 16, Complex_type_name, Complex_abort, Complex_copy, Complex_out_string, Complex_out_int, Complex_in_string, Complex_in_int, Complex_init, Complex_print, Complex_reflect_0, Complex_reflect_X, Complex_reflect_Y

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
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 36($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 0($sp)
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 48($t1)
	jal $t1
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $s2, $a0
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $ra, 8($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t2, $s2
	lw $t2, 4($t2)
	lw $t2, 52($t2)
	jal $t2
	addi $sp, $sp, 4
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
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t3, $s2
	lw $t3, 4($t3)
	lw $t3, 44($t3)
	jal $t3
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	beq $a0, $a0, compare_0
	addi $t4, $zero, 0
	j end_compare_0
	compare_0:
	addi $t4, $zero, 1
	end_compare_0:
	beq $t4, $zero, else_0
	lw $t5, 4($sp)
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
	li $a0, 5
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str1
	copy_0:
	lb $t5, 0($s3)
	sb $t5, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t5, copy_0
	move $t5, $v0
	sw $t5, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	j endif_0
else_0:
	lw $t5, 4($sp)
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
	li $a0, 5
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_1:
	lb $t5, 0($s3)
	sb $t5, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t5, copy_1
	move $t5, $v0
	sw $t5, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, 24
endif_0:
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
Complex_init:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	lw $t0, 4($sp)
	beq $t1, $t0, compare_1
	addi $t0, $zero, 0
	j end_compare_1
	compare_1:
	addi $t0, $zero, 1
	end_compare_1:
	lw $t1, 0($sp)
	lw $t2, 12($t1)
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
	lw $t1, 12($t0)
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
	lw $t2, 8($t1)
	sw $t2, 4($sp)
	jal Complex_out_int
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
	lw $t2, 8($t1)
	sw $t2, 4($sp)
	jal Complex_out_int
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
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 20($t1)
	jal $t1
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $s2, $a0
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $ra, 8($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t2, 20($sp)
	lw $t3, 12($t2)
	sw $t3, 4($sp)
	move $t2, $s2
	lw $t2, 4($t2)
	lw $t2, 24($t2)
	jal $t2
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	move $s2, $a0
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $ra, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_3:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_3
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
endif_1:
	jr $ra
Complex_reflect_0:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	beq $t1, $t1, compare_4
	addi $t0, $zero, 0
	j end_compare_4
	compare_4:
	addi $t0, $zero, 1
	end_compare_4:
	lw $t1, 0($sp)
	lw $t2, 12($t1)
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
	lw $t1, 12($t0)
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
	lw $t1, 8($t0)
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
__init_Complex__:
	li $a0, 16
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Complex
	sw $t0, 0($s1)
	la $t0, StaticComplex
	sw $t0, 4($s1)
	li $t0 0
	sw $t0, 8($s1)
	li $t0 0
	sw $t0, 12($s1)
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
Complex_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
Complex_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
Complex_in_int:
	jr $ra
Complex_in_string:
	jr $ra
Complex_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Complex_copy:
	jr $ra
Complex_abort:
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
