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
Foo: .asciiz "Foo"
Bar: .asciiz "Bar"
Razz: .asciiz "Razz"
Bazz: .asciiz "Bazz"
Main: .asciiz "Main"
str138: .asciiz "do nothing"
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

StaticMain: .word Main_inherits, 24, Main_type_name, Main_abort, Main_copy, Main_main

StaticBoolOp: .word BoolOp_inherits, 8, BoolOp_type_name, BoolOp_abort, BoolOp_copy, BoolOp_and, BoolOp_or

StaticA2I: .word A2I_inherits, 8, A2I_type_name, A2I_abort, A2I_copy, A2I_c2i, A2I_i2c, A2I_a2i, A2I_a2i_aux, A2I_i2a, A2I_i2a_aux

StaticCellularAutomaton: .word CellularAutomaton_inherits, 12, CellularAutomaton_type_name, CellularAutomaton_abort, CellularAutomaton_copy, CellularAutomaton_out_string, CellularAutomaton_out_int, CellularAutomaton_in_string, CellularAutomaton_in_int, CellularAutomaton_init, CellularAutomaton_print, CellularAutomaton_num_cells, CellularAutomaton_cell, CellularAutomaton_cell_left_neighbor, CellularAutomaton_cell_right_neighbor, CellularAutomaton_cell_at_next_evolution, CellularAutomaton_evolve

StaticList: .word List_inherits, 8, List_type_name, List_abort, List_copy, List_isNil, List_head, List_tail, List_cons

StaticCons: .word Cons_inherits, 16, Cons_type_name, Cons_abort, Cons_copy, Cons_isNil, Cons_head, Cons_tail, Cons_cons, Cons_init

StaticComplex: .word Complex_inherits, 16, Complex_type_name, Complex_abort, Complex_copy, Complex_out_string, Complex_out_int, Complex_in_string, Complex_in_int, Complex_init, Complex_print, Complex_reflect_0, Complex_reflect_X, Complex_reflect_Y, Complex_equal, Complex_x_value, Complex_y_value

StaticFoo: .word Foo_inherits, 28, Foo_type_name, Foo_abort, Foo_copy, Foo_out_string, Foo_out_int, Foo_in_string, Foo_in_int, Foo_printh, Foo_doh

StaticBar: .word Bar_inherits, 44, Bar_type_name, Bar_abort, Bar_copy, Bar_out_string, Bar_out_int, Bar_in_string, Bar_in_int, Bar_printh, Bar_doh

StaticRazz: .word Razz_inherits, 36, Razz_type_name, Razz_abort, Razz_copy, Razz_out_string, Razz_out_int, Razz_in_string, Razz_in_int, Razz_printh, Razz_doh

StaticBazz: .word Bazz_inherits, 20, Bazz_type_name, Bazz_abort, Bazz_copy, Bazz_out_string, Bazz_out_int, Bazz_in_string, Bazz_in_int, Bazz_printh, Bazz_doh

Object_inherits: .word -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

IO_inherits: .word -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

Graph_inherits: .word -1, -1, -1, 2, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

Vertice_inherits: .word -1, -1, -1, 3, 2, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

Edge_inherits: .word -1, -1, -1, 3, 2, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

EList_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

ECons_inherits: .word -1, -1, -1, 4, 3, -1, -1, -1, 2, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

VList_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

VCons_inherits: .word -1, -1, -1, 4, 3, -1, -1, -1, -1, -1, 2, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

Parse_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

Main_inherits: .word -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

BoolOp_inherits: .word -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1

A2I_inherits: .word -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1

CellularAutomaton_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1

List_inherits: .word -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1

Cons_inherits: .word -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, 1, -1, -1, -1, -1, -1

Complex_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1

Foo_inherits: .word -1, -1, -1, 4, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, 2

Bar_inherits: .word -1, -1, -1, 6, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, 1, 2, 4

Razz_inherits: .word -1, -1, -1, 5, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, -1, 1, 3

Bazz_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1

.text
.globl main
main:
	jal __init_Main__
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	jal Main_main
	li $v0, 10
	syscall
Foo_printh:
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
	lw $t1, 8($t0)
	sw $t1, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($t0)
	addi $t1, $t1, 2
	lw $t0, 4($sp)
	sw $t1, 8($t0)
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t1
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
	lw $t1, 8($t0)
	sw $t1, 4($sp)
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
	lw $t1, 8($t0)
	sw $t1, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($t0)
	addi $t1, $t1, 1
	lw $t0, 4($sp)
	sw $t1, 8($t0)
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t1
	jr $ra
Bar_doh:
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 4($sp)
	lw $t1, 8($t0)
	sw $t1, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($t0)
	addi $t1, $t1, 2
	lw $t0, 4($sp)
	sw $t1, 8($t0)
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t1
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
	lw $t1, 8($t0)
	sw $t1, 4($sp)
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
	lw $t1, 8($t0)
	sw $t1, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($t0)
	addi $t1, $t1, 1
	lw $t0, 4($sp)
	sw $t1, 8($t0)
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t1
	jr $ra
Razz_doh:
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 4($sp)
	lw $t1, 8($t0)
	sw $t1, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($t0)
	addi $t1, $t1, 2
	lw $t0, 4($sp)
	sw $t1, 8($t0)
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t1
	jr $ra
Bazz_printh:
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
	lw $t1, 8($t0)
	sw $t1, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($t0)
	addi $t1, $t1, 1
	lw $t0, 4($sp)
	sw $t1, 8($t0)
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t1
	jr $ra
Main_main:
	li $a0, 11
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str138
	copy_51:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_51
	move $t0, $v0
	move $a0, $t0
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
	move $t1, $t0
	lw $t1, 4($t1)
	lw $t1, 0($t1)
	la $s7, error_case_0
	li $t2, 100
	lw $s5, 92($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_1
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_0
	move $t2, $s5
	la $s7, case_0
	end_if_temps_0:
	end_if_temps_1:
	lw $s5, 88($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_3
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_2
	move $t2, $s5
	la $s7, case_1
	end_if_temps_2:
	end_if_temps_3:
	lw $s5, 80($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_5
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_4
	move $t2, $s5
	la $s7, case_2
	end_if_temps_4:
	end_if_temps_5:
	lw $s5, 84($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_7
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_6
	move $t2, $s5
	la $s7, case_3
	end_if_temps_6:
	end_if_temps_7:
	addi $sp, $sp, -16
	j $s7
error_case_0:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t2, 0($sp)
case_0:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	jal __init_Foo__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	move $t2, $a0
	j end_case_0
	la $a0, StaticVoid
	sw $t2, 4($sp)
case_1:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	jal __init_Bar__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	move $t2, $a0
	j end_case_0
	la $a0, StaticVoid
	sw $t2, 8($sp)
case_2:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	jal __init_Razz__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	move $t2, $a0
	j end_case_0
	la $a0, StaticVoid
	sw $t2, 12($sp)
case_3:
	lw $t3, 12($sp)
	move $t2, $t3
	j end_case_0
end_case_0:
	addi $sp, $sp, 16
	sw $t2, 12($s1)
	lw $t2, 0($sp)
	move $s2, $t2
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t3, 8($sp)
	sw $s1, 12($sp)
	sw $ra, 16($sp)
	sw $s2, 20($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 24($sp)
	jal Bazz_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t3, 8($sp)
	lw $s1, 12($sp)
	lw $ra, 16($sp)
	lw $s2, 20($sp)
	addi $sp, $sp, 24
	sw $a0, 16($s1)
	lw $t2, 0($sp)
	move $t4, $t2
	lw $t4, 4($t4)
	lw $t4, 0($t4)
	la $s7, error_case_1
	li $t5, 100
	lw $s5, 88($t4)
	slt $s6, $s5, $t5
	beqz $s6, end_if_temps_9
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_8
	move $t5, $s5
	la $s7, case_4
	end_if_temps_8:
	end_if_temps_9:
	lw $s5, 80($t4)
	slt $s6, $s5, $t5
	beqz $s6, end_if_temps_11
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_10
	move $t5, $s5
	la $s7, case_5
	end_if_temps_10:
	end_if_temps_11:
	lw $s5, 84($t4)
	slt $s6, $s5, $t5
	beqz $s6, end_if_temps_13
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_12
	move $t5, $s5
	la $s7, case_6
	end_if_temps_12:
	end_if_temps_13:
	addi $sp, $sp, -12
	j $s7
error_case_1:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t5, 0($sp)
case_4:
	addi $sp, $sp, -32
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $s1, 20($sp)
	sw $ra, 24($sp)
	sw $s2, 28($sp)
	jal __init_Bar__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $s1, 20($sp)
	lw $ra, 24($sp)
	lw $s2, 28($sp)
	addi $sp, $sp, 32
	move $t5, $a0
	j end_case_1
	la $a0, StaticVoid
	sw $t5, 4($sp)
case_5:
	addi $sp, $sp, -32
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $s1, 20($sp)
	sw $ra, 24($sp)
	sw $s2, 28($sp)
	jal __init_Razz__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $s1, 20($sp)
	lw $ra, 24($sp)
	lw $s2, 28($sp)
	addi $sp, $sp, 32
	move $t5, $a0
	j end_case_1
	la $a0, StaticVoid
	sw $t5, 8($sp)
case_6:
	lw $t6, 8($sp)
	move $t5, $t6
	j end_case_1
end_case_1:
	addi $sp, $sp, 12
	sw $t5, 20($s1)
	lw $t5, 0($sp)
	lw $t7, 20($t5)
	move $s2, $t7
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t6, 20($sp)
	sw $s1, 24($sp)
	sw $ra, 28($sp)
	sw $s2, 32($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 36($sp)
	move $t5, $s2
	lw $t5, 4($t5)
	lw $t5, 40($t5)
	jal $t5
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t6, 20($sp)
	lw $s1, 24($sp)
	lw $ra, 28($sp)
	lw $s2, 32($sp)
	addi $sp, $sp, 36
	lw $t5, 0($sp)
	lw $t7, 12($t5)
	move $s2, $t7
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t6, 20($sp)
	sw $s1, 24($sp)
	sw $ra, 28($sp)
	sw $s2, 32($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 36($sp)
	move $t5, $s2
	lw $t5, 4($t5)
	lw $t5, 40($t5)
	jal $t5
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t6, 20($sp)
	lw $s1, 24($sp)
	lw $ra, 28($sp)
	lw $s2, 32($sp)
	addi $sp, $sp, 36
	add $a0, $a0, $a0
	lw $t5, 0($sp)
	move $s2, $t5
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t6, 20($sp)
	sw $s1, 24($sp)
	sw $ra, 28($sp)
	sw $s2, 32($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 36($sp)
	jal Foo_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t6, 20($sp)
	lw $s1, 24($sp)
	lw $ra, 28($sp)
	lw $s2, 32($sp)
	addi $sp, $sp, 36
	add $a0, $a0, $a0
	lw $t5, 0($sp)
	move $s2, $t5
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t6, 20($sp)
	sw $s1, 24($sp)
	sw $ra, 28($sp)
	sw $s2, 32($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 36($sp)
	jal Foo_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t6, 20($sp)
	lw $s1, 24($sp)
	lw $ra, 28($sp)
	lw $s2, 32($sp)
	addi $sp, $sp, 36
	add $a0, $a0, $a0
	sw $a0, 24($s1)
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
	move $t1, $t0
	lw $t1, 4($t1)
	lw $t1, 0($t1)
	la $s7, error_case_2
	li $t2, 100
	lw $s5, 92($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_15
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_14
	move $t2, $s5
	la $s7, case_7
	end_if_temps_14:
	end_if_temps_15:
	lw $s5, 88($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_17
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_16
	move $t2, $s5
	la $s7, case_8
	end_if_temps_16:
	end_if_temps_17:
	lw $s5, 80($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_19
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_18
	move $t2, $s5
	la $s7, case_9
	end_if_temps_18:
	end_if_temps_19:
	lw $s5, 84($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_21
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_20
	move $t2, $s5
	la $s7, case_10
	end_if_temps_20:
	end_if_temps_21:
	addi $sp, $sp, -16
	j $s7
error_case_2:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t2, 0($sp)
case_7:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	jal __init_Foo__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	move $t2, $a0
	j end_case_2
	la $a0, StaticVoid
	sw $t2, 4($sp)
case_8:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	jal __init_Bar__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	move $t2, $a0
	j end_case_2
	la $a0, StaticVoid
	sw $t2, 8($sp)
case_9:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	jal __init_Razz__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	move $t2, $a0
	j end_case_2
	la $a0, StaticVoid
	sw $t2, 12($sp)
case_10:
	lw $t3, 12($sp)
	move $t2, $t3
	j end_case_2
end_case_2:
	addi $sp, $sp, 16
	sw $t2, 12($s1)
	lw $t2, 0($sp)
	move $s2, $t2
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t3, 8($sp)
	sw $s1, 12($sp)
	sw $ra, 16($sp)
	sw $s2, 20($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 24($sp)
	jal Bazz_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t3, 8($sp)
	lw $s1, 12($sp)
	lw $ra, 16($sp)
	lw $s2, 20($sp)
	addi $sp, $sp, 24
	sw $a0, 16($s1)
	lw $t2, 0($sp)
	move $t4, $t2
	lw $t4, 4($t4)
	lw $t4, 0($t4)
	la $s7, error_case_3
	li $t5, 100
	lw $s5, 88($t4)
	slt $s6, $s5, $t5
	beqz $s6, end_if_temps_23
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_22
	move $t5, $s5
	la $s7, case_11
	end_if_temps_22:
	end_if_temps_23:
	lw $s5, 80($t4)
	slt $s6, $s5, $t5
	beqz $s6, end_if_temps_25
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_24
	move $t5, $s5
	la $s7, case_12
	end_if_temps_24:
	end_if_temps_25:
	lw $s5, 84($t4)
	slt $s6, $s5, $t5
	beqz $s6, end_if_temps_27
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_26
	move $t5, $s5
	la $s7, case_13
	end_if_temps_26:
	end_if_temps_27:
	addi $sp, $sp, -12
	j $s7
error_case_3:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t5, 0($sp)
case_11:
	addi $sp, $sp, -32
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $s1, 20($sp)
	sw $ra, 24($sp)
	sw $s2, 28($sp)
	jal __init_Bar__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $s1, 20($sp)
	lw $ra, 24($sp)
	lw $s2, 28($sp)
	addi $sp, $sp, 32
	move $t5, $a0
	j end_case_3
	la $a0, StaticVoid
	sw $t5, 4($sp)
case_12:
	addi $sp, $sp, -32
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $s1, 20($sp)
	sw $ra, 24($sp)
	sw $s2, 28($sp)
	jal __init_Razz__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $s1, 20($sp)
	lw $ra, 24($sp)
	lw $s2, 28($sp)
	addi $sp, $sp, 32
	move $t5, $a0
	j end_case_3
	la $a0, StaticVoid
	sw $t5, 8($sp)
case_13:
	lw $t6, 8($sp)
	move $t5, $t6
	j end_case_3
end_case_3:
	addi $sp, $sp, 12
	sw $t5, 20($s1)
	lw $t5, 0($sp)
	lw $t7, 20($t5)
	move $s2, $t7
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t6, 20($sp)
	sw $s1, 24($sp)
	sw $ra, 28($sp)
	sw $s2, 32($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 36($sp)
	move $t5, $s2
	lw $t5, 4($t5)
	lw $t5, 40($t5)
	jal $t5
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t6, 20($sp)
	lw $s1, 24($sp)
	lw $ra, 28($sp)
	lw $s2, 32($sp)
	addi $sp, $sp, 36
	lw $t5, 0($sp)
	lw $t7, 12($t5)
	move $s2, $t7
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t6, 20($sp)
	sw $s1, 24($sp)
	sw $ra, 28($sp)
	sw $s2, 32($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 36($sp)
	move $t5, $s2
	lw $t5, 4($t5)
	lw $t5, 40($t5)
	jal $t5
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t6, 20($sp)
	lw $s1, 24($sp)
	lw $ra, 28($sp)
	lw $s2, 32($sp)
	addi $sp, $sp, 36
	add $a0, $a0, $a0
	lw $t5, 0($sp)
	move $s2, $t5
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t6, 20($sp)
	sw $s1, 24($sp)
	sw $ra, 28($sp)
	sw $s2, 32($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 36($sp)
	jal Foo_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t6, 20($sp)
	lw $s1, 24($sp)
	lw $ra, 28($sp)
	lw $s2, 32($sp)
	addi $sp, $sp, 36
	add $a0, $a0, $a0
	lw $t5, 0($sp)
	move $s2, $t5
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t6, 20($sp)
	sw $s1, 24($sp)
	sw $ra, 28($sp)
	sw $s2, 32($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 36($sp)
	jal Foo_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t6, 20($sp)
	lw $s1, 24($sp)
	lw $ra, 28($sp)
	lw $s2, 32($sp)
	addi $sp, $sp, 36
	add $a0, $a0, $a0
	sw $a0, 24($s1)
	lw $t5, 0($sp)
	move $t7, $t5
	lw $t7, 4($t7)
	lw $t7, 0($t7)
	la $s7, error_case_4
	li $t8, 100
	lw $s5, 88($t7)
	slt $s6, $s5, $t8
	beqz $s6, end_if_temps_29
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_28
	move $t8, $s5
	la $s7, case_14
	end_if_temps_28:
	end_if_temps_29:
	lw $s5, 84($t7)
	slt $s6, $s5, $t8
	beqz $s6, end_if_temps_31
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_30
	move $t8, $s5
	la $s7, case_15
	end_if_temps_30:
	end_if_temps_31:
	addi $sp, $sp, -8
	j $s7
error_case_4:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t8, 0($sp)
case_14:
	addi $sp, $sp, -44
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $s1, 32($sp)
	sw $ra, 36($sp)
	sw $s2, 40($sp)
	jal __init_Bar__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $s1, 32($sp)
	lw $ra, 36($sp)
	lw $s2, 40($sp)
	addi $sp, $sp, 44
	move $t8, $a0
	j end_case_4
	la $a0, StaticVoid
	sw $t8, 4($sp)
case_15:
	lw $t9, 4($sp)
	move $t8, $t9
	j end_case_4
end_case_4:
	addi $sp, $sp, 8
	sw $t8, 28($s1)
	lw $t8, 0($sp)
	lw $t10, 20($t8)
	move $s2, $t10
	addi $sp, $sp, -48
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $t9, 32($sp)
	sw $s1, 36($sp)
	sw $ra, 40($sp)
	sw $s2, 44($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 48($sp)
	jal Bazz_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $t9, 32($sp)
	lw $s1, 36($sp)
	lw $ra, 40($sp)
	lw $s2, 44($sp)
	addi $sp, $sp, 48
	lw $t8, 0($sp)
	lw $t10, 12($t8)
	move $s2, $t10
	addi $sp, $sp, -48
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $t9, 32($sp)
	sw $s1, 36($sp)
	sw $ra, 40($sp)
	sw $s2, 44($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 48($sp)
	move $t8, $s2
	lw $t8, 4($t8)
	lw $t8, 40($t8)
	jal $t8
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $t9, 32($sp)
	lw $s1, 36($sp)
	lw $ra, 40($sp)
	lw $s2, 44($sp)
	addi $sp, $sp, 48
	add $a0, $a0, $a0
	lw $t8, 0($sp)
	lw $t10, 28($t8)
	move $s2, $t10
	addi $sp, $sp, -48
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $t9, 32($sp)
	sw $s1, 36($sp)
	sw $ra, 40($sp)
	sw $s2, 44($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 48($sp)
	move $t8, $s2
	lw $t8, 4($t8)
	lw $t8, 40($t8)
	jal $t8
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $t9, 32($sp)
	lw $s1, 36($sp)
	lw $ra, 40($sp)
	lw $s2, 44($sp)
	addi $sp, $sp, 48
	add $a0, $a0, $a0
	lw $t8, 0($sp)
	move $s2, $t8
	addi $sp, $sp, -48
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $t9, 32($sp)
	sw $s1, 36($sp)
	sw $ra, 40($sp)
	sw $s2, 44($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 48($sp)
	jal Razz_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $t9, 32($sp)
	lw $s1, 36($sp)
	lw $ra, 40($sp)
	lw $s2, 44($sp)
	addi $sp, $sp, 48
	add $a0, $a0, $a0
	lw $t8, 0($sp)
	move $s2, $t8
	addi $sp, $sp, -48
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $t9, 32($sp)
	sw $s1, 36($sp)
	sw $ra, 40($sp)
	sw $s2, 44($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 48($sp)
	jal Razz_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $t9, 32($sp)
	lw $s1, 36($sp)
	lw $ra, 40($sp)
	lw $s2, 44($sp)
	addi $sp, $sp, 48
	add $a0, $a0, $a0
	sw $a0, 32($s1)
	lw $t8, 0($sp)
	move $s2, $t8
	addi $sp, $sp, -48
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $t9, 32($sp)
	sw $s1, 36($sp)
	sw $ra, 40($sp)
	sw $s2, 44($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 48($sp)
	jal Bar_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $t9, 32($sp)
	lw $s1, 36($sp)
	lw $ra, 40($sp)
	lw $s2, 44($sp)
	addi $sp, $sp, 48
	sw $a0, 36($s1)
	lw $t8, 0($sp)
	move $s2, $t8
	addi $sp, $sp, -48
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $t9, 32($sp)
	sw $s1, 36($sp)
	sw $ra, 40($sp)
	sw $s2, 44($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 48($sp)
	jal Bar_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $t9, 32($sp)
	lw $s1, 36($sp)
	lw $ra, 40($sp)
	lw $s2, 44($sp)
	addi $sp, $sp, 48
	sw $a0, 40($s1)
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
	move $t1, $t0
	lw $t1, 4($t1)
	lw $t1, 0($t1)
	la $s7, error_case_5
	li $t2, 100
	lw $s5, 92($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_33
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_32
	move $t2, $s5
	la $s7, case_16
	end_if_temps_32:
	end_if_temps_33:
	lw $s5, 88($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_35
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_34
	move $t2, $s5
	la $s7, case_17
	end_if_temps_34:
	end_if_temps_35:
	lw $s5, 80($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_37
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_36
	move $t2, $s5
	la $s7, case_18
	end_if_temps_36:
	end_if_temps_37:
	lw $s5, 84($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_39
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_38
	move $t2, $s5
	la $s7, case_19
	end_if_temps_38:
	end_if_temps_39:
	addi $sp, $sp, -16
	j $s7
error_case_5:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t2, 0($sp)
case_16:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	jal __init_Foo__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	move $t2, $a0
	j end_case_5
	la $a0, StaticVoid
	sw $t2, 4($sp)
case_17:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	jal __init_Bar__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	move $t2, $a0
	j end_case_5
	la $a0, StaticVoid
	sw $t2, 8($sp)
case_18:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	jal __init_Razz__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	move $t2, $a0
	j end_case_5
	la $a0, StaticVoid
	sw $t2, 12($sp)
case_19:
	lw $t3, 12($sp)
	move $t2, $t3
	j end_case_5
end_case_5:
	addi $sp, $sp, 16
	sw $t2, 12($s1)
	lw $t2, 0($sp)
	move $s2, $t2
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t3, 8($sp)
	sw $s1, 12($sp)
	sw $ra, 16($sp)
	sw $s2, 20($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 24($sp)
	jal Bazz_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t3, 8($sp)
	lw $s1, 12($sp)
	lw $ra, 16($sp)
	lw $s2, 20($sp)
	addi $sp, $sp, 24
	sw $a0, 16($s1)
	lw $t2, 0($sp)
	move $t4, $t2
	lw $t4, 4($t4)
	lw $t4, 0($t4)
	la $s7, error_case_6
	li $t5, 100
	lw $s5, 88($t4)
	slt $s6, $s5, $t5
	beqz $s6, end_if_temps_41
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_40
	move $t5, $s5
	la $s7, case_20
	end_if_temps_40:
	end_if_temps_41:
	lw $s5, 80($t4)
	slt $s6, $s5, $t5
	beqz $s6, end_if_temps_43
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_42
	move $t5, $s5
	la $s7, case_21
	end_if_temps_42:
	end_if_temps_43:
	lw $s5, 84($t4)
	slt $s6, $s5, $t5
	beqz $s6, end_if_temps_45
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_44
	move $t5, $s5
	la $s7, case_22
	end_if_temps_44:
	end_if_temps_45:
	addi $sp, $sp, -12
	j $s7
error_case_6:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t5, 0($sp)
case_20:
	addi $sp, $sp, -32
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $s1, 20($sp)
	sw $ra, 24($sp)
	sw $s2, 28($sp)
	jal __init_Bar__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $s1, 20($sp)
	lw $ra, 24($sp)
	lw $s2, 28($sp)
	addi $sp, $sp, 32
	move $t5, $a0
	j end_case_6
	la $a0, StaticVoid
	sw $t5, 4($sp)
case_21:
	addi $sp, $sp, -32
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $s1, 20($sp)
	sw $ra, 24($sp)
	sw $s2, 28($sp)
	jal __init_Razz__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $s1, 20($sp)
	lw $ra, 24($sp)
	lw $s2, 28($sp)
	addi $sp, $sp, 32
	move $t5, $a0
	j end_case_6
	la $a0, StaticVoid
	sw $t5, 8($sp)
case_22:
	lw $t6, 8($sp)
	move $t5, $t6
	j end_case_6
end_case_6:
	addi $sp, $sp, 12
	sw $t5, 20($s1)
	lw $t5, 0($sp)
	lw $t7, 20($t5)
	move $s2, $t7
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t6, 20($sp)
	sw $s1, 24($sp)
	sw $ra, 28($sp)
	sw $s2, 32($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 36($sp)
	move $t5, $s2
	lw $t5, 4($t5)
	lw $t5, 40($t5)
	jal $t5
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t6, 20($sp)
	lw $s1, 24($sp)
	lw $ra, 28($sp)
	lw $s2, 32($sp)
	addi $sp, $sp, 36
	lw $t5, 0($sp)
	lw $t7, 12($t5)
	move $s2, $t7
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t6, 20($sp)
	sw $s1, 24($sp)
	sw $ra, 28($sp)
	sw $s2, 32($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 36($sp)
	move $t5, $s2
	lw $t5, 4($t5)
	lw $t5, 40($t5)
	jal $t5
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t6, 20($sp)
	lw $s1, 24($sp)
	lw $ra, 28($sp)
	lw $s2, 32($sp)
	addi $sp, $sp, 36
	add $a0, $a0, $a0
	lw $t5, 0($sp)
	move $s2, $t5
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t6, 20($sp)
	sw $s1, 24($sp)
	sw $ra, 28($sp)
	sw $s2, 32($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 36($sp)
	jal Foo_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t6, 20($sp)
	lw $s1, 24($sp)
	lw $ra, 28($sp)
	lw $s2, 32($sp)
	addi $sp, $sp, 36
	add $a0, $a0, $a0
	lw $t5, 0($sp)
	move $s2, $t5
	addi $sp, $sp, -36
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t6, 20($sp)
	sw $s1, 24($sp)
	sw $ra, 28($sp)
	sw $s2, 32($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 36($sp)
	jal Foo_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t6, 20($sp)
	lw $s1, 24($sp)
	lw $ra, 28($sp)
	lw $s2, 32($sp)
	addi $sp, $sp, 36
	add $a0, $a0, $a0
	sw $a0, 24($s1)
	lw $t5, 0($sp)
	move $t7, $t5
	lw $t7, 4($t7)
	lw $t7, 0($t7)
	la $s7, error_case_7
	li $t8, 100
	lw $s5, 88($t7)
	slt $s6, $s5, $t8
	beqz $s6, end_if_temps_47
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_46
	move $t8, $s5
	la $s7, case_23
	end_if_temps_46:
	end_if_temps_47:
	lw $s5, 84($t7)
	slt $s6, $s5, $t8
	beqz $s6, end_if_temps_49
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_48
	move $t8, $s5
	la $s7, case_24
	end_if_temps_48:
	end_if_temps_49:
	addi $sp, $sp, -8
	j $s7
error_case_7:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t8, 0($sp)
case_23:
	addi $sp, $sp, -44
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $s1, 32($sp)
	sw $ra, 36($sp)
	sw $s2, 40($sp)
	jal __init_Bar__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $s1, 32($sp)
	lw $ra, 36($sp)
	lw $s2, 40($sp)
	addi $sp, $sp, 44
	move $t8, $a0
	j end_case_7
	la $a0, StaticVoid
	sw $t8, 4($sp)
case_24:
	lw $t9, 4($sp)
	move $t8, $t9
	j end_case_7
end_case_7:
	addi $sp, $sp, 8
	sw $t8, 28($s1)
	lw $t8, 0($sp)
	lw $t10, 20($t8)
	move $s2, $t10
	addi $sp, $sp, -48
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $t9, 32($sp)
	sw $s1, 36($sp)
	sw $ra, 40($sp)
	sw $s2, 44($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 48($sp)
	jal Bazz_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $t9, 32($sp)
	lw $s1, 36($sp)
	lw $ra, 40($sp)
	lw $s2, 44($sp)
	addi $sp, $sp, 48
	lw $t8, 0($sp)
	lw $t10, 12($t8)
	move $s2, $t10
	addi $sp, $sp, -48
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $t9, 32($sp)
	sw $s1, 36($sp)
	sw $ra, 40($sp)
	sw $s2, 44($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 48($sp)
	move $t8, $s2
	lw $t8, 4($t8)
	lw $t8, 40($t8)
	jal $t8
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $t9, 32($sp)
	lw $s1, 36($sp)
	lw $ra, 40($sp)
	lw $s2, 44($sp)
	addi $sp, $sp, 48
	add $a0, $a0, $a0
	lw $t8, 0($sp)
	lw $t10, 28($t8)
	move $s2, $t10
	addi $sp, $sp, -48
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $t9, 32($sp)
	sw $s1, 36($sp)
	sw $ra, 40($sp)
	sw $s2, 44($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 48($sp)
	move $t8, $s2
	lw $t8, 4($t8)
	lw $t8, 40($t8)
	jal $t8
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $t9, 32($sp)
	lw $s1, 36($sp)
	lw $ra, 40($sp)
	lw $s2, 44($sp)
	addi $sp, $sp, 48
	add $a0, $a0, $a0
	lw $t8, 0($sp)
	move $s2, $t8
	addi $sp, $sp, -48
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $t9, 32($sp)
	sw $s1, 36($sp)
	sw $ra, 40($sp)
	sw $s2, 44($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 48($sp)
	jal Razz_doh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $t9, 32($sp)
	lw $s1, 36($sp)
	lw $ra, 40($sp)
	lw $s2, 44($sp)
	addi $sp, $sp, 48
	add $a0, $a0, $a0
	lw $t8, 0($sp)
	move $s2, $t8
	addi $sp, $sp, -48
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $t9, 32($sp)
	sw $s1, 36($sp)
	sw $ra, 40($sp)
	sw $s2, 44($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 48($sp)
	jal Razz_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $t5, 20($sp)
	lw $t6, 24($sp)
	lw $t7, 28($sp)
	lw $t9, 32($sp)
	lw $s1, 36($sp)
	lw $ra, 40($sp)
	lw $s2, 44($sp)
	addi $sp, $sp, 48
	add $a0, $a0, $a0
	sw $a0, 32($s1)
	addi $sp, $sp, 4
	move $a0, $s1
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
	move $t1, $t0
	lw $t1, 4($t1)
	lw $t1, 0($t1)
	la $s7, error_case_8
	li $t2, 100
	lw $s5, 92($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_51
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_50
	move $t2, $s5
	la $s7, case_25
	end_if_temps_50:
	end_if_temps_51:
	lw $s5, 88($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_53
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_52
	move $t2, $s5
	la $s7, case_26
	end_if_temps_52:
	end_if_temps_53:
	lw $s5, 80($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_55
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_54
	move $t2, $s5
	la $s7, case_27
	end_if_temps_54:
	end_if_temps_55:
	lw $s5, 84($t1)
	slt $s6, $s5, $t2
	beqz $s6, end_if_temps_57
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_56
	move $t2, $s5
	la $s7, case_28
	end_if_temps_56:
	end_if_temps_57:
	addi $sp, $sp, -16
	j $s7
error_case_8:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
	la $a0, StaticVoid
	sw $t2, 0($sp)
case_25:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	jal __init_Foo__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	move $t2, $a0
	j end_case_8
	la $a0, StaticVoid
	sw $t2, 4($sp)
case_26:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	jal __init_Bar__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	move $t2, $a0
	j end_case_8
	la $a0, StaticVoid
	sw $t2, 8($sp)
case_27:
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	sw $s2, 16($sp)
	jal __init_Razz__
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	lw $s2, 16($sp)
	addi $sp, $sp, 20
	move $t2, $a0
	j end_case_8
	la $a0, StaticVoid
	sw $t2, 12($sp)
case_28:
	lw $t3, 12($sp)
	move $t2, $t3
	j end_case_8
end_case_8:
	addi $sp, $sp, 16
	sw $t2, 12($s1)
	lw $t2, 0($sp)
	move $s2, $t2
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t3, 8($sp)
	sw $s1, 12($sp)
	sw $ra, 16($sp)
	sw $s2, 20($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 24($sp)
	jal Bazz_printh
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t3, 8($sp)
	lw $s1, 12($sp)
	lw $ra, 16($sp)
	lw $s2, 20($sp)
	addi $sp, $sp, 24
	sw $a0, 16($s1)
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
	length_in_string_69:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_69
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_69:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_69
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
	length_in_string_70:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_70
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_70:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_70
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
	length_in_string_71:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_71
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_71:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_71
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
	length_in_string_72:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_72
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_72:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_72
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
	length_in_string_73:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_73
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_73:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_73
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
	length_in_string_74:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_74
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_74:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_74
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
	length_in_string_75:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_75
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_75:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_75
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
	length_in_string_76:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_76
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_76:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_76
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
	length_in_string_77:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_77
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_77:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_77
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
	length_in_string_78:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_78
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_78:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_78
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
	length_in_string_79:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_79
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_79:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_79
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
	length_in_string_80:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_80
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_80:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_80
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
	length_in_string_81:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_81
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_81:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_81
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
	length_in_string_82:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_82
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_82:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_82
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
