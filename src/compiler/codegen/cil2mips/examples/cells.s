.data
abort: .asciiz "Abort called from class "
substring_error: .asciiz "error substring is out of range."
String: .asciiz "String"
Bool: .asciiz "Bool"
Int: .asciiz "Int"
Void: .asciiz "Void"
string_space: .space 1024
newline: .asciiz "\n"
CellularAutomaton: .asciiz "CellularAutomaton"
Main: .asciiz "Main"
str3: .asciiz "\n"
str4: .asciiz "X"
str5: .asciiz "X"
str6: .asciiz "X"
str7: .asciiz "X"
str8: .asciiz "."
str9: .asciiz ""
str10: .asciiz "         X         "
str2: .asciiz ""
StaticVoid: .word Void, 4
StaticIO: .word StaticObject, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int

StaticObject: .word StaticVoid, 8, Object_type_name, Object_abort, Object_copy

StaticCellularAutomaton: .word StaticIO, 12, CellularAutomaton_type_name, CellularAutomaton_abort, CellularAutomaton_copy, CellularAutomaton_out_string, CellularAutomaton_out_int, CellularAutomaton_in_string, CellularAutomaton_in_int, CellularAutomaton_init, CellularAutomaton_print, CellularAutomaton_num_cells, CellularAutomaton_cell, CellularAutomaton_cell_left_neighbor, CellularAutomaton_cell_right_neighbor, CellularAutomaton_cell_at_next_evolution, CellularAutomaton_evolve

StaticMain: .word StaticObject, 12, Main_type_name, Main_abort, Main_copy, Main_main

.text
.globl main
main:
	jal __init_Main__
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	jal Main_main
	li $v0, 10
	syscall
CellularAutomaton_init:
	lw $t1, 4($sp)
	lw $t0, 0($sp)
	sw $t1, 8($t0)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
CellularAutomaton_print:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 12($sp)
	lw $t1, 8($t0)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 3
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
	jal concat
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 4($sp)
	jal CellularAutomaton_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
CellularAutomaton_num_cells:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
CellularAutomaton_cell:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 20($sp)
	sw $t1, 4($sp)
	li $t0, 1
	sw $t0, 8($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
CellularAutomaton_cell_left_neighbor:
	lw $t1, 4($sp)
	li $t0, 0
	beq $t1, $t0, compare_0
	addi $t0, $zero, 0
	j end_compare_3
	compare_0:
	addi $t0, $zero, 1
	end_compare_3:
	beq $t0, $zero, else_0
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 12($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal CellularAutomaton_num_cells
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $a0, -1
	sw $t0, 4($sp)
	jal CellularAutomaton_cell
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	j endif_0
else_0:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 16($sp)
	addi $t0, $t1, -1
	sw $t0, 4($sp)
	jal CellularAutomaton_cell
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
endif_0:
	jr $ra
CellularAutomaton_cell_right_neighbor:
	lw $t1, 4($sp)
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $t1, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal CellularAutomaton_num_cells
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	addi $t0, $a0, -1
	beq $t1, $t0, compare_1
	addi $t0, $zero, 0
	j end_compare_4
	compare_1:
	addi $t0, $zero, 1
	end_compare_4:
	beq $t0, $zero, else_1
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $t0, 0
	sw $t0, 4($sp)
	jal CellularAutomaton_cell
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	j endif_1
else_1:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 16($sp)
	addi $t0, $t1, 1
	sw $t0, 4($sp)
	jal CellularAutomaton_cell
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
endif_1:
	jr $ra
CellularAutomaton_cell_at_next_evolution:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 16($sp)
	sw $t1, 4($sp)
	jal CellularAutomaton_cell
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	la $t1, str4
	loop_compare_0:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_0
	bnez $s5, loop_compare_0
	li $t0, 1
	j end_compare_0
	end_not_equals_0:
	li $t0, 0
	end_compare_0:
	beq $t0, $zero, else_3
	li $t0, 1
	j endif_3
else_3:
	li $t0, 0
endif_3:
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t2, 20($sp)
	sw $t2, 4($sp)
	jal CellularAutomaton_cell_left_neighbor
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $t1, $a0
	la $t2, str5
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
	beq $t1, $zero, else_4
	li $t1, 1
	j endif_4
else_4:
	li $t1, 0
endif_4:
	add $t2, $t0, $t1
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $t2, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 20($sp)
	sw $t1, 4($sp)
	jal CellularAutomaton_cell_right_neighbor
	addi $sp, $sp, 8
	lw $t2, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	la $t1, str6
	loop_compare_2:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_2
	bnez $s5, loop_compare_2
	li $t0, 1
	j end_compare_2
	end_not_equals_2:
	li $t0, 0
	end_compare_2:
	beq $t0, $zero, else_5
	li $t0, 1
	j endif_5
else_5:
	li $t0, 0
endif_5:
	add $t1, $t2, $t0
	li $t0, 1
	beq $t1, $t0, compare_2
	addi $t0, $zero, 0
	j end_compare_5
	compare_2:
	addi $t0, $zero, 1
	end_compare_5:
	beq $t0, $zero, else_2
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str7
	copy_1:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_1
	move $t0, $v0
	j endif_2
else_2:
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str8
	copy_2:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_2
	move $t0, $v0
endif_2:
	move $a0, $t0
	jr $ra
CellularAutomaton_evolve:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal CellularAutomaton_num_cells
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str9
	copy_3:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_3
	move $t0, $v0
	sw $t0, 0($sp)
loop_0:
	lw $t1, 8($sp)
	lw $t2, 4($sp)
	slt $t0, $t1, $t2
	beq $t0, $zero, end_while_0
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 32($sp)
	sw $t1, 4($sp)
	jal CellularAutomaton_cell_at_next_evolution
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 4($sp)
	jal concat
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 0($sp)
	lw $t1, 8($sp)
	addi $t0, $t1, 1
	sw $t0, 8($sp)
	j loop_0
end_while_0:
	la $a0, StaticVoid
	lw $t1, 0($sp)
	lw $t0, 12($sp)
	sw $t1, 8($t0)
	lw $t0, 12($sp)
	addi $sp, $sp, 4
	#End Region Let
	addi $sp, $sp, 4
	#End Region Let
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t0
	jr $ra
Main_main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_CellularAutomaton__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 20
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str10
	copy_4:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_4
	move $t0, $v0
	sw $t0, 4($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 36($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	sw $a0, 8($t0)
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 40($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	#Region Let
	addi $sp, $sp, -4
	li $t0, 20
	sw $t0, 0($sp)
loop_1:
	li $t0, 0
	lw $t2, 0($sp)
	slt $t1, $t0, $t2
	beq $t1, $zero, end_while_1
	lw $t0, 4($sp)
	lw $t1, 8($t0)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 64($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 4($sp)
	lw $t1, 8($t0)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 40($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $t0, $t1, -1
	sw $t0, 0($sp)
	j loop_1
end_while_1:
	la $a0, StaticVoid
	addi $sp, $sp, 4
	#End Region Let
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
__init_CellularAutomaton__:
	li $a0, 12
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, CellularAutomaton
	sw $t0, 0($s1)
	la $t0, StaticCellularAutomaton
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_5:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_5
	move $t0, $v0
	sw $t0, 8($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_Main__:
	li $a0, 12
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Main
	sw $t0, 0($s1)
	la $t0, StaticMain
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	la $a0, StaticVoid
	sw $a0, 8($s1)
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
addi $t0, 1
addi $t1, 1
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
CellularAutomaton_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
CellularAutomaton_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
CellularAutomaton_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
CellularAutomaton_in_string:
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
addi $t0, 1
addi $t1, 1
	bnez $t3, copy_in_1
move $a0, $v0
	jr $ra
CellularAutomaton_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
CellularAutomaton_copy:
	jr $ra
CellularAutomaton_abort:
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
