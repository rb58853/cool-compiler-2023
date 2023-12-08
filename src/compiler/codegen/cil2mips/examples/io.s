.data
abort: .asciiz "error abort from "
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
StaticVoid: .asciiz "Void"

StaticIO: .word StaticObject, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int

StaticObject: .word StaticVoid, 8, Object_type_name, Object_abort, Object_copy

StaticA: .word StaticObject, 12, A_type_name, A_abort, A_copy, A_out_a

StaticB: .word StaticA, 12, B_type_name, B_abort, B_copy, B_out_a, B_out_b

StaticC: .word StaticIO, 8, C_type_name, C_abort, C_copy, C_out_string, C_out_int, C_in_string, C_in_int, C_out_c

StaticD: .word StaticC, 8, D_type_name, D_abort, D_copy, D_out_string, D_out_int, D_in_string, D_in_int, D_out_c, D_out_d

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
A_out_a:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
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
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
B_out_a:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
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
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
B_out_b:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
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
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
C_out_c:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
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
	jal C_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
D_out_c:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
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
	jal C_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
D_out_d:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
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
	jal D_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
Main_main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_A__
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
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	jal __init_B__
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 24($t1)
	jal $t1
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $ra, 8($sp)
	jal __init_C__
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
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t2, $s2
	lw $t2, 4($t2)
	lw $t2, 36($t2)
	jal $t2
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $ra, 12($sp)
	jal __init_D__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	move $t3, $a0
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
	lw $t3, 40($t3)
	jal $t3
	addi $sp, $sp, 4
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
	li $a0, 8
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str5
	copy_6:
	lb $t4, 0($s3)
	sb $t4, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t4, copy_6
	move $t4, $v0
	sw $t4, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
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
	addi $sp, $sp, -8
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	jal __init_IO__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	sw $t0, 8($s1)
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
	addi $sp, $sp, -8
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	jal __init_IO__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	sw $t0, 8($s1)
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
	jr $ra
C_in_string:
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
	jr $ra
D_in_string:
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
