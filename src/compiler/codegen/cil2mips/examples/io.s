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
Main: .asciiz "Main"
str1: .asciiz "A: Hello world\n"
str2: .asciiz "B: Hello world\n"
str3: .asciiz "C: Hello world\n"
str4: .asciiz "D: Hello world\n"
str5: .asciiz "Done.\n"
StaticVoid: .word Void, StaticVoid, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError
StaticObject: .word Object_inherits, 8, Object_type_name, Object_abort, Object_copy
StaticIO: .word IO_inherits, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int
StaticA: .word A_inherits, 12, A_type_name, A_abort, A_copy, A_out_a
StaticB: .word B_inherits, 12, B_type_name, B_abort, B_copy, B_out_a, B_out_b
StaticC: .word C_inherits, 8, C_type_name, C_abort, C_copy, C_out_string, C_out_int, C_in_string, C_in_int, C_out_c
StaticD: .word D_inherits, 8, D_type_name, D_abort, D_copy, D_out_string, D_out_int, D_in_string, D_in_int, D_out_c, D_out_d
StaticMain: .word Main_inherits, 8, Main_type_name, Main_abort, Main_copy, Main_out_string, Main_out_int, Main_in_string, Main_in_int, Main_main
Object_inherits: .word -1, -1, -1, 1, -1, -1, -1, -1, -1, -1
IO_inherits: .word -1, -1, -1, -1, 1, -1, -1, -1, -1, -1
A_inherits: .word -1, -1, -1, 2, -1, 1, -1, -1, -1, -1
B_inherits: .word -1, -1, -1, 3, -1, 2, 1, -1, -1, -1
C_inherits: .word -1, -1, -1, 3, 2, -1, -1, 1, -1, -1
D_inherits: .word -1, -1, -1, 4, 3, -1, -1, 2, 1, -1
Main_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, 1
.text
.globl main
main:
	jal __init_Main__
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	jal Main_main
	li $v0, 10
	syscall
A_out_a:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 17
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
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
B_out_a:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 17
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str1
	copy_1:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_1
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
B_out_b:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 17
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_2:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_2
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
C_out_c:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 17
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str3
	copy_3:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_3
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal C_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
D_out_c:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 17
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str3
	copy_4:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_4
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal C_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
D_out_d:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 17
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_5:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_5
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal D_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
Main_main:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_A__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
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
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_B__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_C__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 36($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_D__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 40($t0)
	jalr $t0
	addi $sp, $sp, 4
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
	li $a0, 8
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str5
	copy_6:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_6
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
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
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_IO__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	sw $t0, 8($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_B__:
	li $a0, 12
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, B
	sw $t0, 0($s1)
	la $t0, StaticB
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_IO__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	sw $t0, 8($s1)
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
__init_Main__:
	li $a0, 8
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Main
	sw $t0, 0($s1)
	la $t0, StaticMain
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
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
C_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
C_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
C_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
C_in_string:
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
D_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
D_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
D_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
D_in_string:
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
