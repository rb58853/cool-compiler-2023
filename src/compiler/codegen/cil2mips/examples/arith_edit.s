.data
abort: .asciiz "Abort called from class "
case_error: .asciiz "error case not have dinamyc type"
void_error: .asciiz "void error"
substring_error: .asciiz "error substring is out of range"
String: .asciiz "String"
Bool: .asciiz "Bool"
Int: .asciiz "Int"
Void: .asciiz "Void"
string_space: .space 1024
newline: .asciiz "\n"
IO: .asciiz "IO"
Object: .asciiz "Object"
A: .asciiz "A"
Main: .asciiz "Main"
str3: .asciiz "tTo quit...enter q:\n\n"
str4: .asciiz "0"
str5: .asciiz "-"
str6: .asciiz ""
str7: .asciiz "0"
str8: .asciiz "1"
str9: .asciiz "2"
str10: .asciiz "3"
str11: .asciiz "4"
str12: .asciiz "5"
str13: .asciiz "6"
str14: .asciiz "7"
str15: .asciiz "8"
str16: .asciiz "9"
str17: .asciiz ""
str2: .asciiz ""
StaticVoid: .word Void, StaticVoid, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError
StaticObject: .word Object_inherits, 8, Object_type_name, Object_abort, Object_copy
StaticIO: .word IO_inherits, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int
StaticA: .word A_inherits, 12, A_type_name, A_abort, A_copy, A_value, A_set_value
StaticMain: .word Main_inherits, 20, Main_type_name, Main_abort, Main_copy, Main_out_string, Main_out_int, Main_in_string, Main_in_int, Main_menu, Main_main, Main_print, Main_i2a, Main_i2a_aux, Main_i2c
Object_inherits: .word -1, -1, -1, 1, -1, -1, -1
IO_inherits: .word -1, -1, -1, -1, 1, -1, -1
A_inherits: .word -1, -1, -1, 2, -1, 1, -1
Main_inherits: .word -1, -1, -1, 3, 2, -1, 1
.text
.globl main
main:
	jal __init_Main__
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	jal Main_main
	li $v0, 10
	syscall
A_value:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $a0, $t0
	jr $ra
A_set_value:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	move $a0, $t0
	jr $ra
Main_menu:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 24
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str3
	copy_0:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_0
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Main_in_string
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
Main_main:
	lw $t0, 0($sp)
	lw $t0, 16($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $t0, 1234
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	lw $t0, 16($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	jal Main_print
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
Main_print:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 36($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_i2a
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
Main_i2a:
	lw $t0, 4($sp)
	li $t1, 0
	beq $t0, $t1, compare_0
	addi $t0, $zero, 0
	j end_compare_0
	compare_0:
	addi $t0, $zero, 1
	end_compare_0:
	beq $t0, $zero, else_0
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_1:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_1
	move $t0, $v0
	j endif_0
else_0:
	li $t0, 0
	lw $t1, 4($sp)
	slt $t0, $t0, $t1
	beq $t0, $zero, else_1
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 20($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_i2a_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	j endif_1
else_1:
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str5
	copy_2:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_2
	move $t0, $v0
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 36($sp)
	li $t1, 1
	sub $t1 $zero $t1
	mul $t0, $t0, $t1
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_i2a_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	jal concat
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
endif_1:
	move $t0, $a0
endif_0:
	move $a0, $t0
	jr $ra
Main_i2a_aux:
	lw $t0, 4($sp)
	li $t1, 0
	beq $t0, $t1, compare_1
	addi $t0, $zero, 0
	j end_compare_1
	compare_1:
	addi $t0, $zero, 1
	end_compare_1:
	beq $t0, $zero, else_2
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str6
	copy_3:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_3
	move $t0, $v0
	j endif_2
else_2:
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 8($sp)
	li $t1, 10
	div $t0, $t1
	mflo $t0
	sw $t0, 0($sp)
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_i2a_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $s2, $a0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 20($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 40($sp)
	lw $t1, 32($sp)
	li $t2, 10
	mul $t1, $t1, $t2
	sub $t0, $t0, $t1
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_i2c
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	jal concat
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	move $t0, $a0
endif_2:
	move $a0, $t0
	jr $ra
Main_i2c:
	lw $t0, 4($sp)
	li $t1, 0
	beq $t0, $t1, compare_2
	addi $t0, $zero, 0
	j end_compare_2
	compare_2:
	addi $t0, $zero, 1
	end_compare_2:
	beq $t0, $zero, else_3
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str7
	copy_4:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_4
	move $t0, $v0
	j endif_3
else_3:
	lw $t0, 4($sp)
	li $t1, 1
	beq $t0, $t1, compare_3
	addi $t0, $zero, 0
	j end_compare_3
	compare_3:
	addi $t0, $zero, 1
	end_compare_3:
	beq $t0, $zero, else_4
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str8
	copy_5:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_5
	move $t0, $v0
	j endif_4
else_4:
	lw $t0, 4($sp)
	li $t1, 2
	beq $t0, $t1, compare_4
	addi $t0, $zero, 0
	j end_compare_4
	compare_4:
	addi $t0, $zero, 1
	end_compare_4:
	beq $t0, $zero, else_5
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str9
	copy_6:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_6
	move $t0, $v0
	j endif_5
else_5:
	lw $t0, 4($sp)
	li $t1, 3
	beq $t0, $t1, compare_5
	addi $t0, $zero, 0
	j end_compare_5
	compare_5:
	addi $t0, $zero, 1
	end_compare_5:
	beq $t0, $zero, else_6
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str10
	copy_7:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_7
	move $t0, $v0
	j endif_6
else_6:
	lw $t0, 4($sp)
	li $t1, 4
	beq $t0, $t1, compare_6
	addi $t0, $zero, 0
	j end_compare_6
	compare_6:
	addi $t0, $zero, 1
	end_compare_6:
	beq $t0, $zero, else_7
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str11
	copy_8:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_8
	move $t0, $v0
	j endif_7
else_7:
	lw $t0, 4($sp)
	li $t1, 5
	beq $t0, $t1, compare_7
	addi $t0, $zero, 0
	j end_compare_7
	compare_7:
	addi $t0, $zero, 1
	end_compare_7:
	beq $t0, $zero, else_8
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str12
	copy_9:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_9
	move $t0, $v0
	j endif_8
else_8:
	lw $t0, 4($sp)
	li $t1, 6
	beq $t0, $t1, compare_8
	addi $t0, $zero, 0
	j end_compare_8
	compare_8:
	addi $t0, $zero, 1
	end_compare_8:
	beq $t0, $zero, else_9
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str13
	copy_10:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_10
	move $t0, $v0
	j endif_9
else_9:
	lw $t0, 4($sp)
	li $t1, 7
	beq $t0, $t1, compare_9
	addi $t0, $zero, 0
	j end_compare_9
	compare_9:
	addi $t0, $zero, 1
	end_compare_9:
	beq $t0, $zero, else_10
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str14
	copy_11:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_11
	move $t0, $v0
	j endif_10
else_10:
	lw $t0, 4($sp)
	li $t1, 8
	beq $t0, $t1, compare_10
	addi $t0, $zero, 0
	j end_compare_10
	compare_10:
	addi $t0, $zero, 1
	end_compare_10:
	beq $t0, $zero, else_11
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str15
	copy_12:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_12
	move $t0, $v0
	j endif_11
else_11:
	lw $t0, 4($sp)
	li $t1, 9
	beq $t0, $t1, compare_11
	addi $t0, $zero, 0
	j end_compare_11
	compare_11:
	addi $t0, $zero, 1
	end_compare_11:
	beq $t0, $zero, else_12
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str16
	copy_13:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_13
	move $t0, $v0
	j endif_12
else_12:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Main_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str17
	copy_14:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_14
	move $t0, $v0
endif_12:
endif_11:
endif_10:
endif_9:
endif_8:
endif_7:
endif_6:
endif_5:
endif_4:
endif_3:
	move $a0, $t0
	jr $ra
__init_A__:
	li $a0, 12
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, A
	sw $t0, 0($s1)
	la $t0, StaticA
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $t0, 0
	sw $t0, 8($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_Main__:
	li $a0, 20
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Main
	sw $t0, 0($s1)
	la $t0, StaticMain
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_15:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_15
	move $t0, $v0
	sw $t0, 8($s1)
	li $t0, 1
	sw $t0, 12($s1)
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_A__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	sw $t0, 16($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_IO__:
	li $a0, 8
	li $v0, 9
	syscall
	la $t0, IO
	sw $t0, 0($v0)
	la $t0, StaticIO
	sw $t0, 4($v0)
	move $a0, $v0
	jr $ra
__init_Object__:
	li $a0, 8
	li $v0, 9
	syscall
	la $t0, Object
	sw $t0, 0($v0)
	la $t0, StaticObject
	sw $t0, 4($v0) 
	move $a0, $v0
	jr $ra
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
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
IO_in_string:
li $v0, 8
la $a0, string_space
li $a1, 1024
syscall
	move $t0, $a0
	addi $t1, $zero, -1
	length_in_string_0:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_0
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_0:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_0
move $a0, $v0
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
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
Main_in_string:
li $v0, 8
la $a0, string_space
li $a1, 1024
syscall
	move $t0, $a0
	addi $t1, $zero, -1
	length_in_string_1:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_1
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_1:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_1
move $a0, $v0
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
VoidError:
	la $a0, void_error
	li $v0, 4
	syscall
	li $v0, 10
	syscall
