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
Bazz: .asciiz "Bazz"
Foo: .asciiz "Foo"
Razz: .asciiz "Razz"
Bar: .asciiz "Bar"
Main: .asciiz "Main"
str10: .asciiz "do nothing"
str1: .asciiz "Bazz => Bazz\n"
str2: .asciiz "Bazz => Razz\n"
str3: .asciiz "Bazz => Foo \n"
str4: .asciiz "Bazz => Bar \n"
str5: .asciiz "Foo => Razz\n"
str6: .asciiz "Foo => Foo\n"
str7: .asciiz "Foo => Bar\n"
str8: .asciiz "Razz => Razz\n"
str9: .asciiz "Razz => Bar  \n"
StaticVoid: .word Void, StaticVoid, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError
StaticObject: .word Object_inherits, 8, Object_type_name, Object_abort, Object_copy
StaticIO: .word IO_inherits, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int
StaticBazz: .word Bazz_inherits, 20, Bazz_type_name, Bazz_abort, Bazz_copy, Bazz_out_string, Bazz_out_int, Bazz_in_string, Bazz_in_int, Bazz_printh, Bazz_doh
StaticFoo: .word Foo_inherits, 28, Foo_type_name, Foo_abort, Foo_copy, Foo_out_string, Foo_out_int, Foo_in_string, Foo_in_int, Foo_printh, Foo_doh
StaticRazz: .word Razz_inherits, 36, Razz_type_name, Razz_abort, Razz_copy, Razz_out_string, Razz_out_int, Razz_in_string, Razz_in_int, Razz_printh, Razz_doh
StaticBar: .word Bar_inherits, 44, Bar_type_name, Bar_abort, Bar_copy, Bar_out_string, Bar_out_int, Bar_in_string, Bar_in_int, Bar_printh, Bar_doh
StaticMain: .word Main_inherits, 24, Main_type_name, Main_abort, Main_copy, Main_main
Object_inherits: .word -1, -1, -1, 1, -1, -1, -1, -1, -1, -1
IO_inherits: .word -1, -1, -1, -1, 1, -1, -1, -1, -1, -1
Bazz_inherits: .word -1, -1, -1, 3, 2, 1, -1, -1, -1, -1
Foo_inherits: .word -1, -1, -1, 4, 3, 2, 1, -1, -1, -1
Razz_inherits: .word -1, -1, -1, 5, 4, 3, 2, 1, -1, -1
Bar_inherits: .word -1, -1, -1, 6, 5, 4, 3, 2, 1, -1
Main_inherits: .word -1, -1, -1, 2, -1, -1, -1, -1, -1, 1
.text
.globl main
main:
	jal __init_Main__
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	jal Main_main
	li $v0, 10
	syscall
Bazz_printh:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	lw $t0, 8($t0)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Bazz_out_int
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $t0, 0
	move $a0, $t0
	jr $ra
Bazz_doh:
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 4($sp)
	lw $t0, 8($t0)
	sw $t0, 0($sp)
	lw $t0, 4($sp)
	lw $t0, 8($t0)
	addi $t0, $t0, 1
	lw $t1, 4($sp)
	sw $t0, 8($t1)
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t0
	jr $ra
Foo_printh:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	lw $t0, 8($t0)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Bazz_out_int
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $t0, 0
	move $a0, $t0
	jr $ra
Foo_doh:
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 4($sp)
	lw $t0, 8($t0)
	sw $t0, 0($sp)
	lw $t0, 4($sp)
	lw $t0, 8($t0)
	addi $t0, $t0, 2
	lw $t1, 4($sp)
	sw $t0, 8($t1)
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t0
	jr $ra
Razz_printh:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	lw $t0, 8($t0)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Bazz_out_int
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $t0, 0
	move $a0, $t0
	jr $ra
Razz_doh:
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 4($sp)
	lw $t0, 8($t0)
	sw $t0, 0($sp)
	lw $t0, 4($sp)
	lw $t0, 8($t0)
	addi $t0, $t0, 2
	lw $t1, 4($sp)
	sw $t0, 8($t1)
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t0
	jr $ra
Bar_printh:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	lw $t0, 8($t0)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Bazz_out_int
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $t0, 0
	move $a0, $t0
	jr $ra
Bar_doh:
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 4($sp)
	lw $t0, 8($t0)
	sw $t0, 0($sp)
	lw $t0, 4($sp)
	lw $t0, 8($t0)
	addi $t0, $t0, 2
	lw $t1, 4($sp)
	sw $t0, 8($t1)
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t0
	jr $ra
Main_main:
	li $a0, 11
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str10
	copy_0:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_0
	move $t0, $v0
	move $a0, $t0
	jr $ra
__init_Bazz__:
	li $a0, 20
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Bazz
	sw $t0, 0($s1)
	la $t0, StaticBazz
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $t0, 1
	sw $t0, 8($s1)
	lw $t0, 0($sp)
	lw $t0, 4($t0)
	lw $t0, 0($t0)
	la $s7, error_case_0
	li $t1, 100
	lw $s5, 20($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_1
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_0
	move $t1, $s5
	la $s7, case_0
	end_if_temps_0:
	end_if_temps_1:
	lw $s5, 28($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_3
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_2
	move $t1, $s5
	la $s7, case_1
	end_if_temps_2:
	end_if_temps_3:
	lw $s5, 24($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_5
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_4
	move $t1, $s5
	la $s7, case_2
	end_if_temps_4:
	end_if_temps_5:
	lw $s5, 32($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_7
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_6
	move $t1, $s5
	la $s7, case_3
	end_if_temps_6:
	end_if_temps_7:
	addi $sp, $sp, -4
	jr $s7
error_case_0:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_0:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str1
	copy_1:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_1
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Foo__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_0
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_1:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_2:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_2
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Bar__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_0
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_2:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str3
	copy_3:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_3
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Razz__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_0
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_3:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_4:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_4
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	lw $t0, 4($sp)
	move $t1, $t0
	j end_case_0
end_case_0:
	addi $sp, $sp, 4
	sw $t1, 12($s1)
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Bazz_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	sw $a0, 16($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_Foo__:
	li $a0, 28
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Foo
	sw $t0, 0($s1)
	la $t0, StaticFoo
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $t0, 1
	sw $t0, 8($s1)
	lw $t0, 0($sp)
	lw $t0, 4($t0)
	lw $t0, 0($t0)
	la $s7, error_case_1
	li $t1, 100
	lw $s5, 20($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_9
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_8
	move $t1, $s5
	la $s7, case_4
	end_if_temps_8:
	end_if_temps_9:
	lw $s5, 28($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_11
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_10
	move $t1, $s5
	la $s7, case_5
	end_if_temps_10:
	end_if_temps_11:
	lw $s5, 24($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_13
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_12
	move $t1, $s5
	la $s7, case_6
	end_if_temps_12:
	end_if_temps_13:
	lw $s5, 32($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_15
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_14
	move $t1, $s5
	la $s7, case_7
	end_if_temps_14:
	end_if_temps_15:
	addi $sp, $sp, -4
	jr $s7
error_case_1:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_4:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str1
	copy_5:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_5
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Foo__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_1
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_5:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_6:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_6
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Bar__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_1
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_6:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str3
	copy_7:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_7
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Razz__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_1
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_7:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_8:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_8
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	lw $t0, 4($sp)
	move $t1, $t0
	j end_case_1
end_case_1:
	addi $sp, $sp, 4
	sw $t1, 12($s1)
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Bazz_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	sw $a0, 16($s1)
	lw $t1, 0($sp)
	lw $t1, 4($t1)
	lw $t1, 0($t1)
	la $s7, error_case_2
	li $t2, 100
	lw $s5, 28($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_17
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_16
	move $t2, $s5
	la $s7, case_8
	end_if_temps_16:
	end_if_temps_17:
	lw $s5, 24($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_19
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_18
	move $t2, $s5
	la $s7, case_9
	end_if_temps_18:
	end_if_temps_19:
	lw $s5, 32($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_21
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_20
	move $t2, $s5
	la $s7, case_10
	end_if_temps_20:
	end_if_temps_21:
	addi $sp, $sp, -4
	jr $s7
error_case_2:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t2, 0($sp)
case_8:
	lw $t2, 4($sp)
	move $s2, $t2
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str5
	copy_9:
	lb $t2, 0($s3)
	sb $t2, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t2, copy_9
	move $t2, $v0
	sw $t2, 4($sp)
	lw $s2, 24($sp)
	jal Foo_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Bar__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t2, $t0
	j end_case_2
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_9:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str6
	copy_10:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_10
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Foo_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Razz__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_2
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_10:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str7
	copy_11:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_11
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Foo_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	lw $t0, 4($sp)
	move $t1, $t0
	j end_case_2
end_case_2:
	addi $sp, $sp, 4
	sw $t1, 20($s1)
	lw $t1, 0($sp)
	lw $t1, 20($t1)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 40($t1)
	jalr $t1
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	lw $t1, 0($sp)
	lw $t1, 12($t1)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 40($t1)
	jalr $t1
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Foo_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Foo_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	sw $a0, 24($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_Razz__:
	li $a0, 36
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Razz
	sw $t0, 0($s1)
	la $t0, StaticRazz
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $t0, 1
	sw $t0, 8($s1)
	lw $t0, 0($sp)
	lw $t0, 4($t0)
	lw $t0, 0($t0)
	la $s7, error_case_3
	li $t1, 100
	lw $s5, 20($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_23
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_22
	move $t1, $s5
	la $s7, case_11
	end_if_temps_22:
	end_if_temps_23:
	lw $s5, 28($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_25
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_24
	move $t1, $s5
	la $s7, case_12
	end_if_temps_24:
	end_if_temps_25:
	lw $s5, 24($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_27
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_26
	move $t1, $s5
	la $s7, case_13
	end_if_temps_26:
	end_if_temps_27:
	lw $s5, 32($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_29
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_28
	move $t1, $s5
	la $s7, case_14
	end_if_temps_28:
	end_if_temps_29:
	addi $sp, $sp, -4
	jr $s7
error_case_3:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_11:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str1
	copy_12:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_12
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Foo__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_3
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_12:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_13:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_13
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Bar__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_3
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_13:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str3
	copy_14:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_14
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Razz__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_3
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_14:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_15:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_15
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	lw $t0, 4($sp)
	move $t1, $t0
	j end_case_3
end_case_3:
	addi $sp, $sp, 4
	sw $t1, 12($s1)
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Bazz_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	sw $a0, 16($s1)
	lw $t1, 0($sp)
	lw $t1, 4($t1)
	lw $t1, 0($t1)
	la $s7, error_case_4
	li $t2, 100
	lw $s5, 28($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_31
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_30
	move $t2, $s5
	la $s7, case_15
	end_if_temps_30:
	end_if_temps_31:
	lw $s5, 24($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_33
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_32
	move $t2, $s5
	la $s7, case_16
	end_if_temps_32:
	end_if_temps_33:
	lw $s5, 32($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_35
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_34
	move $t2, $s5
	la $s7, case_17
	end_if_temps_34:
	end_if_temps_35:
	addi $sp, $sp, -4
	jr $s7
error_case_4:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t2, 0($sp)
case_15:
	lw $t2, 4($sp)
	move $s2, $t2
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str5
	copy_16:
	lb $t2, 0($s3)
	sb $t2, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t2, copy_16
	move $t2, $v0
	sw $t2, 4($sp)
	lw $s2, 24($sp)
	jal Foo_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Bar__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t2, $t0
	j end_case_4
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_16:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str6
	copy_17:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_17
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Foo_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Razz__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_4
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_17:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str7
	copy_18:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_18
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Foo_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	lw $t0, 4($sp)
	move $t1, $t0
	j end_case_4
end_case_4:
	addi $sp, $sp, 4
	sw $t1, 20($s1)
	lw $t1, 0($sp)
	lw $t1, 20($t1)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 40($t1)
	jalr $t1
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	lw $t1, 0($sp)
	lw $t1, 12($t1)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 40($t1)
	jalr $t1
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Foo_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Foo_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	sw $a0, 24($s1)
	lw $t1, 0($sp)
	lw $t1, 4($t1)
	lw $t1, 0($t1)
	la $s7, error_case_5
	li $t2, 100
	lw $s5, 28($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_37
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_36
	move $t2, $s5
	la $s7, case_18
	end_if_temps_36:
	end_if_temps_37:
	lw $s5, 32($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_39
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_38
	move $t2, $s5
	la $s7, case_19
	end_if_temps_38:
	end_if_temps_39:
	addi $sp, $sp, -4
	jr $s7
error_case_5:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t2, 0($sp)
case_18:
	lw $t2, 4($sp)
	move $s2, $t2
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str8
	copy_19:
	lb $t2, 0($s3)
	sb $t2, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t2, copy_19
	move $t2, $v0
	sw $t2, 4($sp)
	lw $s2, 24($sp)
	jal Razz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Bar__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t2, $t0
	j end_case_5
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_19:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 16
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str9
	copy_20:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_20
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Razz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	lw $t0, 4($sp)
	move $t1, $t0
	j end_case_5
end_case_5:
	addi $sp, $sp, 4
	sw $t1, 28($s1)
	lw $t1, 0($sp)
	lw $t1, 20($t1)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Bazz_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	lw $t1, 0($sp)
	lw $t1, 12($t1)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 40($t1)
	jalr $t1
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	lw $t1, 0($sp)
	lw $t1, 28($t1)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 40($t1)
	jalr $t1
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Razz_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Razz_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	sw $a0, 32($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_Bar__:
	li $a0, 44
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Bar
	sw $t0, 0($s1)
	la $t0, StaticBar
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $t0, 1
	sw $t0, 8($s1)
	lw $t0, 0($sp)
	lw $t0, 4($t0)
	lw $t0, 0($t0)
	la $s7, error_case_6
	li $t1, 100
	lw $s5, 20($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_41
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_40
	move $t1, $s5
	la $s7, case_20
	end_if_temps_40:
	end_if_temps_41:
	lw $s5, 28($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_43
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_42
	move $t1, $s5
	la $s7, case_21
	end_if_temps_42:
	end_if_temps_43:
	lw $s5, 24($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_45
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_44
	move $t1, $s5
	la $s7, case_22
	end_if_temps_44:
	end_if_temps_45:
	lw $s5, 32($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_47
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_46
	move $t1, $s5
	la $s7, case_23
	end_if_temps_46:
	end_if_temps_47:
	addi $sp, $sp, -4
	jr $s7
error_case_6:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_20:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str1
	copy_21:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_21
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Foo__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_6
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_21:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_22:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_22
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Bar__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_6
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_22:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str3
	copy_23:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_23
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Razz__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_6
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_23:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_24:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_24
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Bazz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	lw $t0, 4($sp)
	move $t1, $t0
	j end_case_6
end_case_6:
	addi $sp, $sp, 4
	sw $t1, 12($s1)
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Bazz_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	sw $a0, 16($s1)
	lw $t1, 0($sp)
	lw $t1, 4($t1)
	lw $t1, 0($t1)
	la $s7, error_case_7
	li $t2, 100
	lw $s5, 28($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_49
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_48
	move $t2, $s5
	la $s7, case_24
	end_if_temps_48:
	end_if_temps_49:
	lw $s5, 24($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_51
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_50
	move $t2, $s5
	la $s7, case_25
	end_if_temps_50:
	end_if_temps_51:
	lw $s5, 32($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_53
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_52
	move $t2, $s5
	la $s7, case_26
	end_if_temps_52:
	end_if_temps_53:
	addi $sp, $sp, -4
	jr $s7
error_case_7:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t2, 0($sp)
case_24:
	lw $t2, 4($sp)
	move $s2, $t2
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str5
	copy_25:
	lb $t2, 0($s3)
	sb $t2, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t2, copy_25
	move $t2, $v0
	sw $t2, 4($sp)
	lw $s2, 24($sp)
	jal Foo_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Bar__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t2, $t0
	j end_case_7
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_25:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str6
	copy_26:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_26
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Foo_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Razz__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t1, $t0
	j end_case_7
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_26:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str7
	copy_27:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_27
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Foo_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	lw $t0, 4($sp)
	move $t1, $t0
	j end_case_7
end_case_7:
	addi $sp, $sp, 4
	sw $t1, 20($s1)
	lw $t1, 0($sp)
	lw $t1, 20($t1)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 40($t1)
	jalr $t1
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	lw $t1, 0($sp)
	lw $t1, 12($t1)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 40($t1)
	jalr $t1
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Foo_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Foo_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	sw $a0, 24($s1)
	lw $t1, 0($sp)
	lw $t1, 4($t1)
	lw $t1, 0($t1)
	la $s7, error_case_8
	li $t2, 100
	lw $s5, 28($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_55
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_54
	move $t2, $s5
	la $s7, case_27
	end_if_temps_54:
	end_if_temps_55:
	lw $s5, 32($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_57
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_56
	move $t2, $s5
	la $s7, case_28
	end_if_temps_56:
	end_if_temps_57:
	addi $sp, $sp, -4
	jr $s7
error_case_8:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t2, 0($sp)
case_27:
	lw $t2, 4($sp)
	move $s2, $t2
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 15
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str8
	copy_28:
	lb $t2, 0($s3)
	sb $t2, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t2, copy_28
	move $t2, $v0
	sw $t2, 4($sp)
	lw $s2, 24($sp)
	jal Razz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Bar__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	move $t2, $t0
	j end_case_8
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_28:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 16
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str9
	copy_29:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_29
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 20($sp)
	jal Razz_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	lw $t0, 4($sp)
	move $t1, $t0
	j end_case_8
end_case_8:
	addi $sp, $sp, 4
	sw $t1, 28($s1)
	lw $t1, 0($sp)
	lw $t1, 20($t1)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Bazz_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	lw $t1, 0($sp)
	lw $t1, 12($t1)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 40($t1)
	jalr $t1
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	lw $t1, 0($sp)
	lw $t1, 28($t1)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 40($t1)
	jalr $t1
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Razz_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Razz_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	add $a0, $a0, $a0
	sw $a0, 32($s1)
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Bar_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	sw $a0, 36($s1)
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	sw $s2, 12($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 16($sp)
	jal Bar_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	sw $a0, 40($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_Main__:
	li $a0, 24
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Main
	sw $t0, 0($s1)
	la $t0, StaticMain
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Bazz__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	sw $t0, 8($s1)
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Foo__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	sw $t0, 12($s1)
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Razz__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	sw $t0, 16($s1)
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_Bar__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	sw $t0, 20($s1)
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
Bazz_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
Bazz_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
Bazz_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
Bazz_in_string:
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
Bazz_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Bazz_copy:
	jr $ra
Bazz_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
Foo_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
Foo_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
Foo_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
Foo_in_string:
li $v0, 8
la $a0, string_space
li $a1, 1024
syscall
	move $t0, $a0
	addi $t1, $zero, -1
	length_in_string_2:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_2
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_2:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_2
move $a0, $v0
	jr $ra
Foo_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Foo_copy:
	jr $ra
Foo_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
Razz_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
Razz_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
Razz_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
Razz_in_string:
li $v0, 8
la $a0, string_space
li $a1, 1024
syscall
	move $t0, $a0
	addi $t1, $zero, -1
	length_in_string_3:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_3
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_3:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_3
move $a0, $v0
	jr $ra
Razz_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Razz_copy:
	jr $ra
Razz_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
Bar_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
Bar_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
Bar_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
Bar_in_string:
li $v0, 8
la $a0, string_space
li $a1, 1024
syscall
	move $t0, $a0
	addi $t1, $zero, -1
	length_in_string_4:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_4
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_4:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_4
move $a0, $v0
	jr $ra
Bar_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Bar_copy:
	jr $ra
Bar_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
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
