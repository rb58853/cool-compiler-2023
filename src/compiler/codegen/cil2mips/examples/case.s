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
B: .asciiz "B"
C: .asciiz "C"
D: .asciiz "D"
E: .asciiz "E"
F: .asciiz "F"
G: .asciiz "G"
Main: .asciiz "Main"
str2: .asciiz "Int"
str3: .asciiz "String"
str4: .asciiz "Bool"
str5: .asciiz "Object"
str6: .asciiz "IO"
str7: .asciiz "A"
str8: .asciiz "B"
str9: .asciiz "C"
str10: .asciiz "D"
str11: .asciiz "E"
str12: .asciiz "F"
str13: .asciiz "G"
str1: .asciiz "error"
StaticVoid: .word Void, StaticVoid, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError
StaticObject: .word Object_inherits, 8, Object_type_name, Object_abort, Object_copy
StaticIO: .word IO_inherits, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int
StaticA: .word A_inherits, 8, A_type_name, A_abort, A_copy
StaticB: .word B_inherits, 8, B_type_name, B_abort, B_copy
StaticC: .word C_inherits, 8, C_type_name, C_abort, C_copy
StaticD: .word D_inherits, 8, D_type_name, D_abort, D_copy
StaticE: .word E_inherits, 8, E_type_name, E_abort, E_copy
StaticF: .word F_inherits, 8, F_type_name, F_abort, F_copy
StaticG: .word G_inherits, 8, G_type_name, G_abort, G_copy
StaticMain: .word Main_inherits, 16, Main_type_name, Main_abort, Main_copy, Main_out_string, Main_out_int, Main_in_string, Main_in_int, Main_main
Object_inherits: .word -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1
IO_inherits: .word -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1
A_inherits: .word -1, -1, -1, 2, -1, 1, -1, -1, -1, -1, -1, -1, -1
B_inherits: .word -1, -1, -1, 3, -1, 2, 1, -1, -1, -1, -1, -1, -1
C_inherits: .word -1, -1, -1, 4, -1, 3, 2, 1, -1, -1, -1, -1, -1
D_inherits: .word -1, -1, -1, 3, -1, 2, -1, -1, 1, -1, -1, -1, -1
E_inherits: .word -1, -1, -1, 4, -1, 3, 2, -1, -1, 1, -1, -1, -1
F_inherits: .word -1, -1, -1, 5, -1, 4, 3, 2, -1, -1, 1, -1, -1
G_inherits: .word -1, -1, -1, 6, -1, 5, 4, 3, -1, -1, 2, 1, -1
Main_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, -1, -1, 1
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
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	jal __init_B__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	#Region Let
	addi $sp, $sp, -4
	la $a0, StaticVoid
	sw $a0, 0($sp)
	lw $t0, 4($sp)
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
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 8($t0)
	jal $t0
	addi $sp, $sp, 4
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
	addi $sp, $sp, 4
	#End Region Let
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	lw $t0, 4($t0)
	lw $t0, 0($t0)
	la $s7, error_case_0
	li $t1, 100
	lw $s5, 0($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_1
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_0
	move $t1, $s5
	la $s7, case_0
	end_if_temps_0:
	end_if_temps_1:
	lw $s5, 4($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_3
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_2
	move $t1, $s5
	la $s7, case_1
	end_if_temps_2:
	end_if_temps_3:
	lw $s5, 8($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_5
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_4
	move $t1, $s5
	la $s7, case_2
	end_if_temps_4:
	end_if_temps_5:
	lw $s5, 12($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_7
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_6
	move $t1, $s5
	la $s7, case_3
	end_if_temps_6:
	end_if_temps_7:
	lw $s5, 16($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_9
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_8
	move $t1, $s5
	la $s7, case_4
	end_if_temps_8:
	end_if_temps_9:
	lw $s5, 20($t0)
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
	lw $s5, 28($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_15
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_14
	move $t1, $s5
	la $s7, case_7
	end_if_temps_14:
	end_if_temps_15:
	lw $s5, 32($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_17
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_16
	move $t1, $s5
	la $s7, case_8
	end_if_temps_16:
	end_if_temps_17:
	lw $s5, 36($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_19
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_18
	move $t1, $s5
	la $s7, case_9
	end_if_temps_18:
	end_if_temps_19:
	lw $s5, 40($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_21
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_20
	move $t1, $s5
	la $s7, case_10
	end_if_temps_20:
	end_if_temps_21:
	lw $s5, 44($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_23
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_22
	move $t1, $s5
	la $s7, case_11
	end_if_temps_22:
	end_if_temps_23:
	addi $sp, $sp, -4
	j $s7
error_case_0:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_0:
	li $a0, 4
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_0:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_0
	move $t1, $v0
	lw $t2, 48($sp)
	sw $t1, 12($t2)
	j end_case_0
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_1:
	li $a0, 7
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
	lw $t2, 48($sp)
	sw $t1, 12($t2)
	j end_case_0
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_2:
	li $a0, 5
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_2:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_2
	move $t1, $v0
	lw $t2, 48($sp)
	sw $t1, 12($t2)
	j end_case_0
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_3:
	li $a0, 7
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str5
	copy_3:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_3
	move $t1, $v0
	lw $t2, 48($sp)
	sw $t1, 12($t2)
	j end_case_0
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_4:
	li $a0, 3
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str6
	copy_4:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_4
	move $t1, $v0
	lw $t2, 48($sp)
	sw $t1, 12($t2)
	j end_case_0
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_5:
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str7
	copy_5:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_5
	move $t1, $v0
	lw $t2, 48($sp)
	sw $t1, 12($t2)
	j end_case_0
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_6:
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str8
	copy_6:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_6
	move $t1, $v0
	lw $t2, 48($sp)
	sw $t1, 12($t2)
	j end_case_0
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_7:
	li $a0, 2
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
	lw $t2, 48($sp)
	sw $t1, 12($t2)
	j end_case_0
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_8:
	li $a0, 2
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
	lw $t2, 48($sp)
	sw $t1, 12($t2)
	j end_case_0
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_9:
	li $a0, 2
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
	lw $t2, 48($sp)
	sw $t1, 12($t2)
	j end_case_0
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_10:
	li $a0, 2
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
	lw $t2, 48($sp)
	sw $t1, 12($t2)
	j end_case_0
	la $a0, StaticVoid
	sw $t1, 0($sp)
case_11:
	li $a0, 2
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
	lw $t2, 48($sp)
	sw $t1, 12($t2)
	j end_case_0
end_case_0:
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	lw $t0, 12($t0)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
__init_A__:
	li $a0, 8
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, A
	sw $t0, 0($s1)
	la $t0, StaticA
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_B__:
	li $a0, 8
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, B
	sw $t0, 0($s1)
	la $t0, StaticB
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_C__:
	li $a0, 8
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, C
	sw $t0, 0($s1)
	la $t0, StaticC
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_D__:
	li $a0, 8
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, D
	sw $t0, 0($s1)
	la $t0, StaticD
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_E__:
	li $a0, 8
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, E
	sw $t0, 0($s1)
	la $t0, StaticE
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_F__:
	li $a0, 8
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, F
	sw $t0, 0($s1)
	la $t0, StaticF
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_G__:
	li $a0, 8
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, G
	sw $t0, 0($s1)
	la $t0, StaticG
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_Main__:
	li $a0, 16
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
	jal __init_A__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	sw $t0, 8($s1)
	li $a0, 6
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str1
	copy_12:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_12
	move $t0, $v0
	sw $t0, 12($s1)
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
B_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
B_copy:
	jr $ra
B_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
C_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
C_copy:
	jr $ra
C_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
D_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
D_copy:
	jr $ra
D_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
E_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
E_copy:
	jr $ra
E_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
F_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
F_copy:
	jr $ra
F_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
G_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
G_copy:
	jr $ra
G_abort:
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
