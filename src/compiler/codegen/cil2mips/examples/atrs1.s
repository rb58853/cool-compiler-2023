.data
A: .asciiz "A"
B: .asciiz "B"
Main: .asciiz "Main"
str3: .asciiz "test_string "
str4: .asciiz " another string"
str1: .asciiz ""
str2: .asciiz ""
StaticVoid: .asciiz "Void"

StaticIO: .word StaticObject, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int

StaticObject: .word StaticVoid, Object_type_name, Object_abort, Object_copy

StaticA: .word StaticObject, A_type_name, A_abort, A_copy, A_f, A_set_s, A_set_x, A_print

StaticB: .word StaticObject, B_type_name, B_abort, B_copy, B_b, B_a

StaticMain: .word StaticIO, Main_type_name, Main_abort, Main_copy, Main_out_string, Main_out_int, Main_in_string, Main_in_int, Main_main

.text
.globl main
main:
	jal __init_Main__
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	jal Main_main
	li $v0, 10
	syscall
A_f:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_IO__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 12($sp)
	lw $t1, 8($t0)
	sw $t1, 4($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 16($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	move $a0, $t1
	jr $ra
A_set_s:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $t0 18
	sw $t0, 4($sp)
	jal A_set_x
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	move $a0, $t0
	jr $ra
A_set_x:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 16($t1)
	move $a0, $t0
	jr $ra
A_print:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_IO__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 12($sp)
	lw $t1, 8($t0)
	sw $t1, 4($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 16($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
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
	lw $t1, 16($sp)
	lw $t2, 16($t1)
	sw $t2, 4($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 20($t1)
	jal $t1
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra
B_b:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_B__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $a0, $t0
	jr $ra
B_a:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_A__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $a0, $t0
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
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_B__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 0($sp)
	lw $t1, 0($sp)
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
	la $s3, str3
	copy_0:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_0
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
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t2, $s2
	lw $t2, 4($t2)
	lw $t2, 28($t2)
	jal $t2
	addi $sp, $sp, 4
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
	li $a0, 16
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_1:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_1
	move $t3, $v0
	sw $t3, 4($sp)
	move $t3, $s2
	lw $t3, 4($t3)
	lw $t3, 16($t3)
	jal $t3
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	addi $sp, $sp, 4
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
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str1
	copy_2:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_2
	move $t0, $v0
	sw $t0, 8($s1)
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_3:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_3
	move $t0, $v0
	sw $t0, 12($s1)
	li $t0 13
	sw $t0, 16($s1)
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
	jr $ra
Object_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Object_copy:
	jr $ra
Object_abort:
	jr $ra
A_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
A_copy:
	jr $ra
A_abort:
	jr $ra
B_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
B_copy:
	jr $ra
B_abort:
	jr $ra
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
	jr $ra
__init_IO__:
	li $a0, 8
	li $v0, 9
	syscall
	la $t0, StaticIO
	sw $t0, 4($v0) 
	move $a0, $v0
	jr $ra
