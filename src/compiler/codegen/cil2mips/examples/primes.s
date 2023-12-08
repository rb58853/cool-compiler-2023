.data
abort: .asciiz "Abort called from class "
substring_error: .asciiz "error substring is out of range."
String: .asciiz "String"
Bool: .asciiz "Bool"
Int: .asciiz "Int"
Void: .asciiz "Void"
Main: .asciiz "Main"
str1: .asciiz "2 is trivially prime.\n"
str2: .asciiz " is prime.\n"
str3: .asciiz "halt"
str4: .asciiz "continue"
StaticVoid: .word Void
StaticIO: .word StaticObject, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int

StaticObject: .word StaticVoid, 8, Object_type_name, Object_abort, Object_copy

StaticMain: .word StaticIO, 28, Main_type_name, Main_abort, Main_copy, Main_out_string, Main_out_int, Main_in_string, Main_in_int, Main_main

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
	li $t0, 0
	move $a0, $t0
	jr $ra
__init_Main__:
	li $a0, 28
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Main
	sw $t0, 0($s1)
	la $t0, StaticMain
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 24
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
	sw $t0, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	li $t0, 2
	sw $t0, 8($s1)
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	sw $t1, 12($s1)
	li $t0, 0
	sw $t0, 16($s1)
	li $t0, 500
	sw $t0, 20($s1)
loop_0:
	li $t0, 1
	beq $t0, $zero, end_while_0
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	addi $t0, $t1, 1
	lw $t1, 0($sp)
	sw $t0, 12($t1)
	li $t0, 2
	lw $t1, 0($sp)
	sw $t0, 16($t1)
loop_1:
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	lw $t0, 0($sp)
	lw $t2, 16($t0)
	lw $t0, 0($sp)
	lw $t3, 16($t0)
	mul $t0, $t2, $t3
	slt $t2, $t1, $t0
	beq $t2, $zero, else_0
	li $t0, 0
	j endif_0
else_0:
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	lw $t0, 0($sp)
	lw $t2, 16($t0)
	lw $t0, 0($sp)
	lw $t3, 12($t0)
	lw $t0, 0($sp)
	lw $t4, 16($t0)
	div $t3, $t4
	mflo $t0
	mul $t3, $t2, $t0
	sub $t0, $t1, $t3
	li $t1, 0
	beq $t0, $t1, compare_0
	addi $t0, $zero, 0
	j end_compare_0
	compare_0:
	addi $t0, $zero, 1
	end_compare_0:
	beq $t0, $zero, else_1
	li $t0, 0
	j endif_1
else_1:
	li $t0, 1
endif_1:
endif_0:
	beq $t0, $zero, end_while_1
	lw $t0, 0($sp)
	lw $t1, 16($t0)
	addi $t0, $t1, 1
	lw $t1, 0($sp)
	sw $t0, 16($t1)
	j loop_1
end_while_1:
	la $a0, StaticVoid
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	lw $t0, 0($sp)
	lw $t2, 16($t0)
	lw $t0, 0($sp)
	lw $t3, 16($t0)
	mul $t0, $t2, $t3
	slt $t2, $t1, $t0
	beq $t2, $zero, else_2
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	lw $t0, 0($sp)
	sw $t1, 8($t0)
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	lw $t1, 8($t0)
	sw $t1, 4($sp)
	jal Main_out_int
	addi $sp, $sp, 8
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_1:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_1
	move $t0, $v0
	sw $t0, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	j endif_2
else_2:
	li $t0, 0
endif_2:
	lw $t1, 0($sp)
	lw $t2, 20($t1)
	lw $t1, 0($sp)
	lw $t3, 12($t1)
	slt $t1, $t3, $t2
	li $t3, 1
	slt $t1, $t1, $t3
	beq $t1, $zero, else_3
	li $a0, 5
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
	move $s2, $t1
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal String_abort
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	j endif_3
else_3:
	li $a0, 9
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
endif_3:
	j loop_0
end_while_0:
	la $a0, StaticVoid
	sw $a0, 24($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_IO__:
	li $a0, 8
	li $v0, 9
	syscall
	la $t0, StaticIO
	sw $t0, 4($v0) 
	move $a0, $v0
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
String_type_name:
	la $a0, String
	jr $ra
Int_type_name:
	la $a0, Int
	jr $ra
Bool_type_name:
	la $a0, Bool
	jr $ra
String_abort:
	la $a0, abort
	li $v0, 4
	syscall
	la $a0, String
	li $v0, 4
	syscall
	li $v0, 10
	syscall
Int_abort:
	la $a0, abort
	li $v0, 4
	syscall
	la $a0, Int
	li $v0, 4
	syscall
	li $v0, 10
	syscall
Bool_abort:
	la $a0, abort
	li $v0, 4
	syscall
	la $a0, Bool
	li $v0, 4
	syscall
	li $v0, 10
	syscall
length:
	lw $t0, 0($sp)
	addi $t1, $zero, -1
	loop_len:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, loop_len
	move $a0, $t1
	jr $ra
substr:
	lw $t0, 0($sp)
	addi $t1, $zero, -1
	loop_len_full:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, loop_len_full
	move $t6, $t1
	lw $t0, 0($sp)
	lw $t5, 4($sp)
	add $t0, $t0, $t5
	lw $t1, 8($sp)
	slt $t4, $t5, $zero
	bnez $t4, s_error
	add $t5, $t5, $t1
	slt $t4, $t6, $t5
	bnez $t4, s_error
	addi $t4, $t1, 1
	add $a0, $zero, $t4
	li $v0, 9
	syscall
	move $t3, $v0
	li $t4, 0
	loop_substring:
	lb $t2, 0($t0)
	sb $t2, 0($t3)
	addi $t0, $t0, 1
	addi $t3, $t3, 1
	addi $t4, $t4, 1
	slt $t6, $t4, $t1
	bnez $t6, loop_substring
	move $a0, $v0
	jr $ra
	s_error:
	la $a0, substring_error
	li $v0, 4
	syscall
	li $v0, 10
	syscall
concat:
	lw $t0, 0($sp)
	addi $t1, $zero, -1
	loop_len_concat_one:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, loop_len_concat_one
	lw $t0, 4($sp)
	loop_len_concat_two:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, loop_len_concat_two
	move $t3, $t1
	addi $t3, $t3, 1
	add $a0, $zero, $t3
	li $v0, 9
	syscall
	move $t4, $v0
	lw $t0, 0($sp)
	concat_copy_one:
	lb $t2, 0($t0)
	beq $t2, $zero, end_concat_one
	sb $t2, 0($t4)
	addi $t0, $t0, 1
	addi $t4, $t4, 1
	bnez $t2, concat_copy_one
	end_concat_one:	lw $t0, 4($sp)
	concat_copy_two:
	lb $t2, 0($t0)
	sb $t2, 0($t4)
	addi $t0, $t0, 1
	addi $t4, $t4, 1
	bnez $t2, concat_copy_two
	move $a0, $v0
	jr $ra
