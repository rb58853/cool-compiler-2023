.data
abort: .asciiz "Abort called from class"
case_error: .asciiz "error case not have dinamyc type"
substring_error: .asciiz "error substring is out of range"
String: .asciiz "String"
Bool: .asciiz "Bool"
Int: .asciiz "Int"
Void: .asciiz "Void"
string_space: .space 1024
newline: .asciiz "\n"
Main: .asciiz "Main"
Complex: .asciiz "Complex"
str111: .asciiz "=)\n"
str112: .asciiz "=(\n"
str113: .asciiz "=)\n"
str114: .asciiz "=(\n"
str115: .asciiz "+"
str116: .asciiz "I"
StaticVoid: .word Void, 4
StaticObject: .word Object_inherits, 8, Object_type_name, Object_abort, Object_copy

StaticIO: .word IO_inherits, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int

StaticGraph: .word Graph_inherits, 16, Graph_type_name, Graph_abort, Graph_copy, Graph_add_vertice, Graph_print_E, Graph_print_V

StaticVertice: .word Vertice_inherits, 16, Vertice_type_name, Vertice_abort, Vertice_copy, Vertice_out_string, Vertice_out_int, Vertice_in_string, Vertice_in_int, Vertice_outgoing, Vertice_number, Vertice_init, Vertice_add_out, Vertice_print

StaticEdge: .word Edge_inherits, 20, Edge_type_name, Edge_abort, Edge_copy, Edge_out_string, Edge_out_int, Edge_in_string, Edge_in_int, Edge_init, Edge_print

StaticEList: .word EList_inherits, 12, EList_type_name, EList_abort, EList_copy, EList_out_string, EList_out_int, EList_in_string, EList_in_int, EList_isNil, EList_head, EList_tail, EList_cons, EList_append, EList_print

StaticECons: .word ECons_inherits, 16, ECons_type_name, ECons_abort, ECons_copy, ECons_out_string, ECons_out_int, ECons_in_string, ECons_in_int, ECons_isNil, ECons_head, ECons_tail, ECons_cons, ECons_append, ECons_print, ECons_init

StaticVList: .word VList_inherits, 12, VList_type_name, VList_abort, VList_copy, VList_out_string, VList_out_int, VList_in_string, VList_in_int, VList_isNil, VList_head, VList_tail, VList_cons, VList_print

StaticVCons: .word VCons_inherits, 16, VCons_type_name, VCons_abort, VCons_copy, VCons_out_string, VCons_out_int, VCons_in_string, VCons_in_int, VCons_isNil, VCons_head, VCons_tail, VCons_cons, VCons_print, VCons_init

StaticParse: .word Parse_inherits, 16, Parse_type_name, Parse_abort, Parse_copy, Parse_out_string, Parse_out_int, Parse_in_string, Parse_in_int, Parse_read_input, Parse_parse_line, Parse_c2i, Parse_a2i, Parse_a2i_aux

StaticMain: .word Main_inherits, 8, Main_type_name, Main_abort, Main_copy, Main_out_string, Main_out_int, Main_in_string, Main_in_int, Main_main

StaticBoolOp: .word BoolOp_inherits, 8, BoolOp_type_name, BoolOp_abort, BoolOp_copy, BoolOp_and, BoolOp_or

StaticA2I: .word A2I_inherits, 8, A2I_type_name, A2I_abort, A2I_copy, A2I_c2i, A2I_i2c, A2I_a2i, A2I_a2i_aux, A2I_i2a, A2I_i2a_aux

StaticCellularAutomaton: .word CellularAutomaton_inherits, 12, CellularAutomaton_type_name, CellularAutomaton_abort, CellularAutomaton_copy, CellularAutomaton_out_string, CellularAutomaton_out_int, CellularAutomaton_in_string, CellularAutomaton_in_int, CellularAutomaton_init, CellularAutomaton_print, CellularAutomaton_num_cells, CellularAutomaton_cell, CellularAutomaton_cell_left_neighbor, CellularAutomaton_cell_right_neighbor, CellularAutomaton_cell_at_next_evolution, CellularAutomaton_evolve

StaticList: .word List_inherits, 8, List_type_name, List_abort, List_copy, List_isNil, List_head, List_tail, List_cons

StaticCons: .word Cons_inherits, 16, Cons_type_name, Cons_abort, Cons_copy, Cons_isNil, Cons_head, Cons_tail, Cons_cons, Cons_init

StaticComplex: .word Complex_inherits, 16, Complex_type_name, Complex_abort, Complex_copy, Complex_out_string, Complex_out_int, Complex_in_string, Complex_in_int, Complex_init, Complex_print, Complex_reflect_0, Complex_reflect_X, Complex_reflect_Y, Complex_equal, Complex_x_value, Complex_y_value

Object_inherits: .word -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

IO_inherits: .word -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

Graph_inherits: .word -1, -1, -1, 2, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

Vertice_inherits: .word -1, -1, -1, 3, 2, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

Edge_inherits: .word -1, -1, -1, 3, 2, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

EList_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

ECons_inherits: .word -1, -1, -1, 4, 3, -1, -1, -1, 2, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

VList_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1

VCons_inherits: .word -1, -1, -1, 4, 3, -1, -1, -1, -1, -1, 2, 1, -1, -1, -1, -1, -1, -1, -1, -1

Parse_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1

Main_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1

BoolOp_inherits: .word -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1

A2I_inherits: .word -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1

CellularAutomaton_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1

List_inherits: .word -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1

Cons_inherits: .word -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, 1, -1

Complex_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1

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
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	jal __init_Complex__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0, 1
	sw $t0, 4($sp)
	li $t0, 1
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 36($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 48($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	lw $t2, 0($sp)
	move $s2, $t2
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 12($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 44($t1)
	jal $t1
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	beq $t0, $a0, compare_23
	addi $t0, $zero, 0
	j end_compare_70
	compare_23:
	addi $t0, $zero, 1
	end_compare_70:
	beq $t0, $zero, else_73
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 5
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str111
	copy_40:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_40
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	j endif_73
else_73:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 5
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str112
	copy_41:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_41
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
endif_73:
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 48($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $s2, $a0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 52($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $s2, $a0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 16($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 44($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 56($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	beq $a0, $zero, else_74
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 5
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str113
	copy_42:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_42
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	j endif_74
else_74:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 5
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str114
	copy_43:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_43
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
endif_74:
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
Complex_init:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	lw $t2, 4($sp)
	beq $t1, $t2, compare_24
	addi $t0, $zero, 0
	j end_compare_71
	compare_24:
	addi $t0, $zero, 1
	end_compare_71:
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	lw $t2, 8($sp)
	beq $t1, $t2, compare_25
	addi $t0, $zero, 0
	j end_compare_72
	compare_25:
	addi $t0, $zero, 1
	end_compare_72:
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Complex_print:
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	li $t0, 0
	beq $t1, $t0, compare_26
	addi $t0, $zero, 0
	j end_compare_73
	compare_26:
	addi $t0, $zero, 1
	end_compare_73:
	beq $t0, $zero, else_75
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	lw $t1, 8($t0)
	sw $t1, 4($sp)
	lw $s2, 12($sp)
	jal Complex_out_int
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	j endif_75
else_75:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	lw $t1, 8($t0)
	sw $t1, 4($sp)
	lw $s2, 12($sp)
	jal Complex_out_int
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
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str115
	copy_44:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_44
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jal $t0
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
	lw $t0, 16($sp)
	lw $t1, 12($t0)
	sw $t1, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jal $t0
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
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str116
	copy_45:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_45
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
endif_75:
	jr $ra
Complex_reflect_0:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	lw $t0, 0($sp)
	lw $t2, 8($t0)
	addi $t2 $t2 -1
	subu $t2 $zero $t2
	beq $t1, $t2, compare_27
	addi $t0, $zero, 0
	j end_compare_74
	compare_27:
	addi $t0, $zero, 1
	end_compare_74:
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	lw $t0, 0($sp)
	lw $t2, 12($t0)
	addi $t2 $t2 -1
	subu $t2 $zero $t2
	beq $t1, $t2, compare_28
	addi $t0, $zero, 0
	j end_compare_75
	compare_28:
	addi $t0, $zero, 1
	end_compare_75:
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Complex_reflect_X:
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	lw $t0, 0($sp)
	lw $t2, 12($t0)
	addi $t2 $t2 -1
	subu $t2 $zero $t2
	beq $t1, $t2, compare_29
	addi $t0, $zero, 0
	j end_compare_76
	compare_29:
	addi $t0, $zero, 1
	end_compare_76:
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Complex_reflect_Y:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	lw $t0, 0($sp)
	lw $t2, 8($t0)
	addi $t2 $t2 -1
	subu $t2 $zero $t2
	beq $t1, $t2, compare_30
	addi $t0, $zero, 0
	j end_compare_77
	compare_30:
	addi $t0, $zero, 1
	end_compare_77:
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Complex_equal:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	lw $t2, 4($sp)
	move $s2, $t2
	addi $sp, $sp, -12
	sw $t1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 60($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	beq $t1, $a0, compare_31
	addi $t0, $zero, 0
	j end_compare_78
	compare_31:
	addi $t0, $zero, 1
	end_compare_78:
	beq $t0, $zero, else_76
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	lw $t2, 4($sp)
	move $s2, $t2
	addi $sp, $sp, -12
	sw $t1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 64($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	beq $t1, $a0, compare_32
	addi $t0, $zero, 0
	j end_compare_79
	compare_32:
	addi $t0, $zero, 1
	end_compare_79:
	beq $t0, $zero, else_77
	li $t0, 1
	j endif_77
else_77:
	li $t0, 0
endif_77:
	j endif_76
else_76:
	li $t0, 0
endif_76:
	move $a0, $t0
	jr $ra
Complex_x_value:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	move $a0, $t1
	jr $ra
Complex_y_value:
	lw $t0, 0($sp)
	lw $t1, 12($t0)
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
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, 4
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
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $t0, 0
	sw $t0, 8($s1)
	li $t0, 0
	sw $t0, 12($s1)
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
	length_in_string_47:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_47
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_47:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_47
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
Graph_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Graph_copy:
	jr $ra
Graph_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
Vertice_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
Vertice_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
Vertice_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
Vertice_in_string:
li $v0, 8
la $a0, string_space
li $a1, 1024
syscall
	move $t0, $a0
	addi $t1, $zero, -1
	length_in_string_48:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_48
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_48:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_48
move $a0, $v0
	jr $ra
Vertice_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Vertice_copy:
	jr $ra
Vertice_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
Edge_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
Edge_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
Edge_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
Edge_in_string:
li $v0, 8
la $a0, string_space
li $a1, 1024
syscall
	move $t0, $a0
	addi $t1, $zero, -1
	length_in_string_49:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_49
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_49:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_49
move $a0, $v0
	jr $ra
Edge_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Edge_copy:
	jr $ra
Edge_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
EList_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
EList_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
EList_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
EList_in_string:
li $v0, 8
la $a0, string_space
li $a1, 1024
syscall
	move $t0, $a0
	addi $t1, $zero, -1
	length_in_string_50:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_50
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_50:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_50
move $a0, $v0
	jr $ra
EList_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
EList_copy:
	jr $ra
EList_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
ECons_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
ECons_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
ECons_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
ECons_in_string:
li $v0, 8
la $a0, string_space
li $a1, 1024
syscall
	move $t0, $a0
	addi $t1, $zero, -1
	length_in_string_51:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_51
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_51:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_51
move $a0, $v0
	jr $ra
ECons_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
ECons_copy:
	jr $ra
ECons_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
VList_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
VList_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
VList_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
VList_in_string:
li $v0, 8
la $a0, string_space
li $a1, 1024
syscall
	move $t0, $a0
	addi $t1, $zero, -1
	length_in_string_52:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_52
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_52:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_52
move $a0, $v0
	jr $ra
VList_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
VList_copy:
	jr $ra
VList_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
VCons_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
VCons_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
VCons_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
VCons_in_string:
li $v0, 8
la $a0, string_space
li $a1, 1024
syscall
	move $t0, $a0
	addi $t1, $zero, -1
	length_in_string_53:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_53
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_53:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_53
move $a0, $v0
	jr $ra
VCons_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
VCons_copy:
	jr $ra
VCons_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
Parse_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
Parse_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
Parse_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
Parse_in_string:
li $v0, 8
la $a0, string_space
li $a1, 1024
syscall
	move $t0, $a0
	addi $t1, $zero, -1
	length_in_string_54:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_54
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_54:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_54
move $a0, $v0
	jr $ra
Parse_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Parse_copy:
	jr $ra
Parse_abort:
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
	length_in_string_55:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_55
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_55:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_55
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
BoolOp_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
BoolOp_copy:
	jr $ra
BoolOp_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
A2I_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
A2I_copy:
	jr $ra
A2I_abort:
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
	length_in_string_56:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_56
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_56:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_56
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
List_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
List_copy:
	jr $ra
List_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
Cons_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Cons_copy:
	jr $ra
Cons_abort:
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
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
Complex_in_string:
li $v0, 8
la $a0, string_space
li $a1, 1024
syscall
	move $t0, $a0
	addi $t1, $zero, -1
	length_in_string_57:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_57
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_57:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_57
move $a0, $v0
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
