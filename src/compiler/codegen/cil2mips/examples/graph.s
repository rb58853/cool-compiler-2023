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
Graph: .asciiz "Graph"
Vertice: .asciiz "Vertice"
Edge: .asciiz "Edge"
EList: .asciiz "EList"
ECons: .asciiz "ECons"
VList: .asciiz "VList"
VCons: .asciiz "VCons"
Parse: .asciiz "Parse"
Main: .asciiz "Main"
BoolOp: .asciiz "BoolOp"
str1: .asciiz " ("
str2: .asciiz ","
str3: .asciiz ")"
str4: .asciiz "\n"
str5: .asciiz "\n"
str6: .asciiz "\n"
str7: .asciiz ""
str8: .asciiz "0"
str9: .asciiz "1"
str10: .asciiz "2"
str11: .asciiz "3"
str12: .asciiz "4"
str13: .asciiz "5"
str14: .asciiz "6"
str15: .asciiz "7"
str16: .asciiz "8"
str17: .asciiz "9"
str20: .asciiz "-"
str21: .asciiz " "
str22: .asciiz " "
str23: .asciiz ","
str24: .asciiz ""
str25: .asciiz ""
str19: .asciiz ""
StaticVoid: .word Void, StaticVoid, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError
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
StaticMain: .word Main_inherits, 20, Main_type_name, Main_abort, Main_copy, Main_out_string, Main_out_int, Main_in_string, Main_in_int, Main_read_input, Main_parse_line, Main_c2i, Main_a2i, Main_a2i_aux, Main_main
StaticBoolOp: .word BoolOp_inherits, 8, BoolOp_type_name, BoolOp_abort, BoolOp_copy, BoolOp_and, BoolOp_or
Object_inherits: .word -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
IO_inherits: .word -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
Graph_inherits: .word -1, -1, -1, 2, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1
Vertice_inherits: .word -1, -1, -1, 3, 2, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1
Edge_inherits: .word -1, -1, -1, 3, 2, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1
EList_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1
ECons_inherits: .word -1, -1, -1, 4, 3, -1, -1, -1, 2, 1, -1, -1, -1, -1, -1
VList_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1
VCons_inherits: .word -1, -1, -1, 4, 3, -1, -1, -1, -1, -1, 2, 1, -1, -1, -1
Parse_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1
Main_inherits: .word -1, -1, -1, 4, 3, -1, -1, -1, -1, -1, -1, -1, 2, 1, -1
BoolOp_inherits: .word -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1
.text
.globl main
main:
	jal __init_Main__
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	jal Main_main
	li $v0, 10
	syscall
Graph_add_vertice:
	lw $t0, 4($sp)
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
	move $s2, $a0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	lw $t0, 12($t0)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 52($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	sw $a0, 12($t0)
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 20($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 48($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	sw $a0, 8($t0)
	jr $ra
Graph_print_E:
	lw $t0, 0($sp)
	lw $t0, 12($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 56($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
Graph_print_V:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 52($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
Vertice_outgoing:
	lw $t0, 0($sp)
	lw $t0, 12($t0)
	move $a0, $t0
	jr $ra
Vertice_number:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $a0, $t0
	jr $ra
Vertice_init:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Vertice_add_out:
	lw $t0, 0($sp)
	lw $t0, 12($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 20($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 48($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	sw $a0, 12($t0)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Vertice_print:
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
	jal Vertice_out_int
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t0, 12($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 56($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
Edge_init:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	lw $t0, 8($sp)
	lw $t1, 0($sp)
	sw $t0, 12($t1)
	lw $t0, 12($sp)
	lw $t1, 0($sp)
	sw $t0, 16($t1)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Edge_print:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 3
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
	jal Edge_out_string
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
	lw $t0, 8($t0)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Edge_out_int
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
	li $a0, 2
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
	lw $s2, 12($sp)
	jal Edge_out_string
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
	lw $t0, 12($t0)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Edge_out_int
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
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str3
	copy_2:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_2
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Edge_out_string
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
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Edge_out_int
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
EList_isNil:
	li $t0, 1
	move $a0, $t0
	jr $ra
EList_head:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal EList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $a0, $t0
	jr $ra
EList_tail:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal EList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
EList_cons:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_ECons__
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
	lw $t0, 24($sp)
	sw $t0, 4($sp)
	lw $t0, 20($sp)
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 60($t0)
	jalr $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
EList_append:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal EList_isNil
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	beq $a0, $zero, else_0
	lw $t0, 4($sp)
	j endif_0
else_0:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal EList_tail
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
	lw $t0, 20($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 52($t0)
	jalr $t0
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
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal EList_head
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 48($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
endif_0:
	move $a0, $t0
	jr $ra
EList_print:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 3
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_3:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_3
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal EList_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
ECons_cons:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_ECons__
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
	lw $t0, 24($sp)
	sw $t0, 4($sp)
	lw $t0, 20($sp)
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 60($t0)
	jalr $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
ECons_append:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal EList_isNil
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	beq $a0, $zero, else_1
	lw $t0, 4($sp)
	j endif_1
else_1:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal EList_tail
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
	lw $t0, 20($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 52($t0)
	jalr $t0
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
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal EList_head
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 48($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
endif_1:
	move $a0, $t0
	jr $ra
ECons_isNil:
	li $t0, 0
	move $a0, $t0
	jr $ra
ECons_head:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $a0, $t0
	jr $ra
ECons_tail:
	lw $t0, 0($sp)
	lw $t0, 12($t0)
	move $a0, $t0
	jr $ra
ECons_init:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	lw $t0, 8($sp)
	lw $t1, 0($sp)
	sw $t0, 12($t1)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
ECons_print:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
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
	lw $t0, 12($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 56($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
VList_isNil:
	li $t0, 1
	move $a0, $t0
	jr $ra
VList_head:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal VList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $a0, $t0
	jr $ra
VList_tail:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal VList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
VList_cons:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_VCons__
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
	lw $t0, 24($sp)
	sw $t0, 4($sp)
	lw $t0, 20($sp)
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 56($t0)
	jalr $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
VList_print:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 3
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str5
	copy_4:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_4
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal VList_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
VCons_cons:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_VCons__
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
	lw $t0, 24($sp)
	sw $t0, 4($sp)
	lw $t0, 20($sp)
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 56($t0)
	jalr $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
VCons_isNil:
	li $t0, 0
	move $a0, $t0
	jr $ra
VCons_head:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $a0, $t0
	jr $ra
VCons_tail:
	lw $t0, 0($sp)
	lw $t0, 12($t0)
	move $a0, $t0
	jr $ra
VCons_init:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	lw $t0, 8($sp)
	lw $t1, 0($sp)
	sw $t0, 12($t1)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
VCons_print:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 52($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t0, 12($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 52($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
Parse_read_input:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_Graph__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	sw $t0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Parse_in_string
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
loop_0:
	lw $t0, 8($sp)
	lw $t0, 8($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t0, 20($sp)
	la $t1, str6
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
	addi $t0 $t0 -1
	subu $t0 $zero $t0
	sw $t0, 4($sp)
	lw $t0, 20($sp)
	la $t1, str7
	loop_compare_1:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_1
	bnez $s5, loop_compare_1
	li $t0, 1
	j end_compare_1
	end_not_equals_1:
	li $t0, 0
	end_compare_1:
	addi $t0 $t0 -1
	subu $t0 $zero $t0
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	beq $a0, $zero, end_while_0
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 32($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Parse_parse_line
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Parse_in_string
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	j loop_0
end_while_0:
	la $a0, StaticVoid
	addi $sp, $sp, 4
	#End Region Let
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t0
	jr $ra
Parse_parse_line:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_Vertice__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	move $s2, $t0
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
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Parse_a2i
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 44($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
loop_1:
	lw $t0, 4($sp)
	lw $t0, 12($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $t0, 0
	beq $a0, $t0, compare_0
	addi $a0, $zero, 0
	j end_compare_32
	compare_0:
	addi $a0, $zero, 1
	end_compare_32:
	addi $a0 $a0 -1
	subu $a0 $zero $a0
	beq $a0, $zero, end_while_1
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	lw $t0, 12($t0)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Parse_a2i
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 12($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 28($sp)
	lw $t0, 12($t0)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Parse_a2i
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_Edge__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -16
	sw $s2, 0($sp)
	lw $t0, 48($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 48($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 40($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $t0, 44($sp)
	sw $t0, 8($sp)
	lw $t0, 40($sp)
	sw $t0, 12($sp)
	lw $s2, 20($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 36($t0)
	jalr $t0
	addi $sp, $sp, 16
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 48($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	addi $sp, $sp, 4
	#End Region Let
	j loop_1
end_while_1:
	la $a0, StaticVoid
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t0
	jr $ra
Parse_c2i:
	lw $t0, 4($sp)
	la $t1, str8
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
	beq $t0, $zero, else_2
	li $t0, 0
	j endif_2
else_2:
	lw $t0, 4($sp)
	la $t1, str9
	loop_compare_3:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_3
	bnez $s5, loop_compare_3
	li $t0, 1
	j end_compare_3
	end_not_equals_3:
	li $t0, 0
	end_compare_3:
	beq $t0, $zero, else_3
	li $t0, 1
	j endif_3
else_3:
	lw $t0, 4($sp)
	la $t1, str10
	loop_compare_4:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_4
	bnez $s5, loop_compare_4
	li $t0, 1
	j end_compare_4
	end_not_equals_4:
	li $t0, 0
	end_compare_4:
	beq $t0, $zero, else_4
	li $t0, 2
	j endif_4
else_4:
	lw $t0, 4($sp)
	la $t1, str11
	loop_compare_5:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_5
	bnez $s5, loop_compare_5
	li $t0, 1
	j end_compare_5
	end_not_equals_5:
	li $t0, 0
	end_compare_5:
	beq $t0, $zero, else_5
	li $t0, 3
	j endif_5
else_5:
	lw $t0, 4($sp)
	la $t1, str12
	loop_compare_6:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_6
	bnez $s5, loop_compare_6
	li $t0, 1
	j end_compare_6
	end_not_equals_6:
	li $t0, 0
	end_compare_6:
	beq $t0, $zero, else_6
	li $t0, 4
	j endif_6
else_6:
	lw $t0, 4($sp)
	la $t1, str13
	loop_compare_7:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_7
	bnez $s5, loop_compare_7
	li $t0, 1
	j end_compare_7
	end_not_equals_7:
	li $t0, 0
	end_compare_7:
	beq $t0, $zero, else_7
	li $t0, 5
	j endif_7
else_7:
	lw $t0, 4($sp)
	la $t1, str14
	loop_compare_8:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_8
	bnez $s5, loop_compare_8
	li $t0, 1
	j end_compare_8
	end_not_equals_8:
	li $t0, 0
	end_compare_8:
	beq $t0, $zero, else_8
	li $t0, 6
	j endif_8
else_8:
	lw $t0, 4($sp)
	la $t1, str15
	loop_compare_9:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_9
	bnez $s5, loop_compare_9
	li $t0, 1
	j end_compare_9
	end_not_equals_9:
	li $t0, 0
	end_compare_9:
	beq $t0, $zero, else_9
	li $t0, 7
	j endif_9
else_9:
	lw $t0, 4($sp)
	la $t1, str16
	loop_compare_10:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_10
	bnez $s5, loop_compare_10
	li $t0, 1
	j end_compare_10
	end_not_equals_10:
	li $t0, 0
	end_compare_10:
	beq $t0, $zero, else_10
	li $t0, 8
	j endif_10
else_10:
	lw $t0, 4($sp)
	la $t1, str17
	loop_compare_11:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_11
	bnez $s5, loop_compare_11
	li $t0, 1
	j end_compare_11
	end_not_equals_11:
	li $t0, 0
	end_compare_11:
	beq $t0, $zero, else_11
	li $t0, 9
	j endif_11
else_11:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Parse_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $t0, 0
endif_11:
endif_10:
endif_9:
endif_8:
endif_7:
endif_6:
endif_5:
endif_4:
endif_3:
endif_2:
	move $a0, $t0
	jr $ra
Parse_a2i:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $t0, 0
	beq $a0, $t0, compare_1
	addi $a0, $zero, 0
	j end_compare_33
	compare_1:
	addi $a0, $zero, 1
	end_compare_33:
	beq $a0, $zero, else_12
	li $t0, 0
	j endif_12
else_12:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0, 0
	sw $t0, 4($sp)
	li $t0, 1
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	la $t0, str20
	loop_compare_12:
	lb $s5, 0($a0)
	lb $s6, 0($t0)
	addiu $a0, $a0, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_12
	bnez $s5, loop_compare_12
	li $a0, 1
	j end_compare_12
	end_not_equals_12:
	li $a0, 0
	end_compare_12:
	beq $a0, $zero, else_13
	lw $t0, 0($sp)
	move $s2, $t0
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
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0, 1
	sw $t0, 4($sp)
	lw $t0, 40($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 44($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $a0, $a0, -1
	sw $a0, 8($sp)
	lw $s2, 16($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	jal Parse_a2i_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sub $a0 $zero $a0
	j endif_13
else_13:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0, 0
	sw $t0, 4($sp)
	li $t0, 1
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	la $t0, str21
	loop_compare_13:
	lb $s5, 0($a0)
	lb $s6, 0($t0)
	addiu $a0, $a0, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_13
	bnez $s5, loop_compare_13
	li $a0, 1
	j end_compare_13
	end_not_equals_13:
	li $a0, 0
	end_compare_13:
	beq $a0, $zero, else_14
	lw $t0, 0($sp)
	move $s2, $t0
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
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0, 1
	sw $t0, 4($sp)
	lw $t0, 40($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 44($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $a0, $a0, -1
	sw $a0, 8($sp)
	lw $s2, 16($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	jal Parse_a2i
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	j endif_14
else_14:
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
	jal Parse_a2i_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
endif_14:
endif_13:
	move $t0, $a0
endif_12:
	move $a0, $t0
	jr $ra
Parse_a2i_aux:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 12($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
loop_2:
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	slt $t0, $t0, $t1
	beq $t0, $zero, end_while_2
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 20($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	sw $t0, 4($sp)
	li $t0, 1
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	lw $t0, 0($sp)
	la $t1, str22
	loop_compare_14:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_14
	bnez $s5, loop_compare_14
	li $t0, 1
	j end_compare_14
	end_not_equals_14:
	li $t0, 0
	end_compare_14:
	beq $t0, $zero, else_15
	lw $t0, 20($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	addi $t0, $t0, 1
	sw $t0, 4($sp)
	lw $t0, 40($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 24($sp)
	sub $a0, $a0, $t0
	addi $a0, $a0, -1
	sw $a0, 8($sp)
	lw $s2, 16($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 16($sp)
	sw $a0, 12($t0)
	lw $t0, 8($sp)
	sw $t0, 4($sp)
	j endif_15
else_15:
	lw $t0, 0($sp)
	la $t1, str23
	loop_compare_15:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_15
	bnez $s5, loop_compare_15
	li $t0, 1
	j end_compare_15
	end_not_equals_15:
	li $t0, 0
	end_compare_15:
	beq $t0, $zero, else_16
	lw $t0, 20($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	addi $t0, $t0, 1
	sw $t0, 4($sp)
	lw $t0, 40($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 24($sp)
	sub $a0, $a0, $t0
	addi $a0, $a0, -1
	sw $a0, 8($sp)
	lw $s2, 16($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 16($sp)
	sw $a0, 12($t0)
	lw $t0, 8($sp)
	sw $t0, 4($sp)
	j endif_16
else_16:
	lw $t0, 12($sp)
	li $t1, 10
	mul $t0, $t0, $t1
	lw $t1, 16($sp)
	move $s2, $t1
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 40($sp)
	move $s2, $t1
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 48($sp)
	sw $t1, 4($sp)
	li $t1, 1
	sw $t1, 8($sp)
	lw $s2, 20($sp)
	jal substr
	addi $sp, $sp, 12
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	sw $a0, 4($sp)
	lw $s2, 16($sp)
	jal Parse_c2i
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	add $t0, $t0, $a0
	sw $t0, 12($sp)
	lw $t0, 4($sp)
	addi $t0, $t0, 1
	sw $t0, 4($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	beq $t0, $t1, compare_2
	addi $t0, $zero, 0
	j end_compare_34
	compare_2:
	addi $t0, $zero, 1
	end_compare_34:
	beq $t0, $zero, else_17
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str24
	copy_5:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_5
	move $t0, $v0
	lw $t1, 16($sp)
	sw $t0, 12($t1)
	j endif_17
else_17:
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str25
	copy_6:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_6
	move $t0, $v0
endif_17:
endif_16:
endif_15:
	addi $sp, $sp, 4
	#End Region Let
	j loop_2
end_while_2:
	la $a0, StaticVoid
	addi $sp, $sp, 4
	#End Region Let
	addi $sp, $sp, 4
	#End Region Let
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t0
	jr $ra
Main_read_input:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_Graph__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	sw $t0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Parse_in_string
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
loop_3:
	lw $t0, 8($sp)
	lw $t0, 8($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t0, 20($sp)
	la $t1, str6
	loop_compare_16:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_16
	bnez $s5, loop_compare_16
	li $t0, 1
	j end_compare_16
	end_not_equals_16:
	li $t0, 0
	end_compare_16:
	addi $t0 $t0 -1
	subu $t0 $zero $t0
	sw $t0, 4($sp)
	lw $t0, 20($sp)
	la $t1, str7
	loop_compare_17:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_17
	bnez $s5, loop_compare_17
	li $t0, 1
	j end_compare_17
	end_not_equals_17:
	li $t0, 0
	end_compare_17:
	addi $t0 $t0 -1
	subu $t0 $zero $t0
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	beq $a0, $zero, end_while_3
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 32($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Parse_parse_line
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Parse_in_string
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	j loop_3
end_while_3:
	la $a0, StaticVoid
	addi $sp, $sp, 4
	#End Region Let
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t0
	jr $ra
Main_parse_line:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_Vertice__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	move $s2, $t0
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
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Parse_a2i
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 44($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
loop_4:
	lw $t0, 4($sp)
	lw $t0, 12($t0)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $t0, 0
	beq $a0, $t0, compare_3
	addi $a0, $zero, 0
	j end_compare_35
	compare_3:
	addi $a0, $zero, 1
	end_compare_35:
	addi $a0 $a0 -1
	subu $a0 $zero $a0
	beq $a0, $zero, end_while_4
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	lw $t0, 12($t0)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Parse_a2i
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 12($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 28($sp)
	lw $t0, 12($t0)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Parse_a2i
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_Edge__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -16
	sw $s2, 0($sp)
	lw $t0, 48($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 48($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 40($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $t0, 44($sp)
	sw $t0, 8($sp)
	lw $t0, 40($sp)
	sw $t0, 12($sp)
	lw $s2, 20($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 36($t0)
	jalr $t0
	addi $sp, $sp, 16
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 48($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	addi $sp, $sp, 4
	#End Region Let
	j loop_4
end_while_4:
	la $a0, StaticVoid
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t0
	jr $ra
Main_c2i:
	lw $t0, 4($sp)
	la $t1, str8
	loop_compare_18:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_18
	bnez $s5, loop_compare_18
	li $t0, 1
	j end_compare_18
	end_not_equals_18:
	li $t0, 0
	end_compare_18:
	beq $t0, $zero, else_18
	li $t0, 0
	j endif_18
else_18:
	lw $t0, 4($sp)
	la $t1, str9
	loop_compare_19:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_19
	bnez $s5, loop_compare_19
	li $t0, 1
	j end_compare_19
	end_not_equals_19:
	li $t0, 0
	end_compare_19:
	beq $t0, $zero, else_19
	li $t0, 1
	j endif_19
else_19:
	lw $t0, 4($sp)
	la $t1, str10
	loop_compare_20:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_20
	bnez $s5, loop_compare_20
	li $t0, 1
	j end_compare_20
	end_not_equals_20:
	li $t0, 0
	end_compare_20:
	beq $t0, $zero, else_20
	li $t0, 2
	j endif_20
else_20:
	lw $t0, 4($sp)
	la $t1, str11
	loop_compare_21:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_21
	bnez $s5, loop_compare_21
	li $t0, 1
	j end_compare_21
	end_not_equals_21:
	li $t0, 0
	end_compare_21:
	beq $t0, $zero, else_21
	li $t0, 3
	j endif_21
else_21:
	lw $t0, 4($sp)
	la $t1, str12
	loop_compare_22:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_22
	bnez $s5, loop_compare_22
	li $t0, 1
	j end_compare_22
	end_not_equals_22:
	li $t0, 0
	end_compare_22:
	beq $t0, $zero, else_22
	li $t0, 4
	j endif_22
else_22:
	lw $t0, 4($sp)
	la $t1, str13
	loop_compare_23:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_23
	bnez $s5, loop_compare_23
	li $t0, 1
	j end_compare_23
	end_not_equals_23:
	li $t0, 0
	end_compare_23:
	beq $t0, $zero, else_23
	li $t0, 5
	j endif_23
else_23:
	lw $t0, 4($sp)
	la $t1, str14
	loop_compare_24:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_24
	bnez $s5, loop_compare_24
	li $t0, 1
	j end_compare_24
	end_not_equals_24:
	li $t0, 0
	end_compare_24:
	beq $t0, $zero, else_24
	li $t0, 6
	j endif_24
else_24:
	lw $t0, 4($sp)
	la $t1, str15
	loop_compare_25:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_25
	bnez $s5, loop_compare_25
	li $t0, 1
	j end_compare_25
	end_not_equals_25:
	li $t0, 0
	end_compare_25:
	beq $t0, $zero, else_25
	li $t0, 7
	j endif_25
else_25:
	lw $t0, 4($sp)
	la $t1, str16
	loop_compare_26:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_26
	bnez $s5, loop_compare_26
	li $t0, 1
	j end_compare_26
	end_not_equals_26:
	li $t0, 0
	end_compare_26:
	beq $t0, $zero, else_26
	li $t0, 8
	j endif_26
else_26:
	lw $t0, 4($sp)
	la $t1, str17
	loop_compare_27:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_27
	bnez $s5, loop_compare_27
	li $t0, 1
	j end_compare_27
	end_not_equals_27:
	li $t0, 0
	end_compare_27:
	beq $t0, $zero, else_27
	li $t0, 9
	j endif_27
else_27:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Parse_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $t0, 0
endif_27:
endif_26:
endif_25:
endif_24:
endif_23:
endif_22:
endif_21:
endif_20:
endif_19:
endif_18:
	move $a0, $t0
	jr $ra
Main_a2i:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $t0, 0
	beq $a0, $t0, compare_4
	addi $a0, $zero, 0
	j end_compare_36
	compare_4:
	addi $a0, $zero, 1
	end_compare_36:
	beq $a0, $zero, else_28
	li $t0, 0
	j endif_28
else_28:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0, 0
	sw $t0, 4($sp)
	li $t0, 1
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	la $t0, str20
	loop_compare_28:
	lb $s5, 0($a0)
	lb $s6, 0($t0)
	addiu $a0, $a0, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_28
	bnez $s5, loop_compare_28
	li $a0, 1
	j end_compare_28
	end_not_equals_28:
	li $a0, 0
	end_compare_28:
	beq $a0, $zero, else_29
	lw $t0, 0($sp)
	move $s2, $t0
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
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0, 1
	sw $t0, 4($sp)
	lw $t0, 40($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 44($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $a0, $a0, 1
	sw $a0, 8($sp)
	lw $s2, 16($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	jal Parse_a2i_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sub $a0 $zero $a0
	j endif_29
else_29:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0, 0
	sw $t0, 4($sp)
	li $t0, 1
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	la $t0, str21
	loop_compare_29:
	lb $s5, 0($a0)
	lb $s6, 0($t0)
	addiu $a0, $a0, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_29
	bnez $s5, loop_compare_29
	li $a0, 1
	j end_compare_29
	end_not_equals_29:
	li $a0, 0
	end_compare_29:
	beq $a0, $zero, else_30
	lw $t0, 0($sp)
	move $s2, $t0
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
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0, 1
	sw $t0, 4($sp)
	lw $t0, 40($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 44($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $a0, $a0, 1
	sw $a0, 8($sp)
	lw $s2, 16($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	jal Parse_a2i
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	j endif_30
else_30:
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
	jal Parse_a2i_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
endif_30:
endif_29:
	move $t0, $a0
endif_28:
	move $a0, $t0
	jr $ra
Main_a2i_aux:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 12($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
loop_5:
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	slt $t0, $t0, $t1
	beq $t0, $zero, end_while_5
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 20($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	sw $t0, 4($sp)
	li $t0, 1
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	lw $t0, 0($sp)
	la $t1, str22
	loop_compare_30:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_30
	bnez $s5, loop_compare_30
	li $t0, 1
	j end_compare_30
	end_not_equals_30:
	li $t0, 0
	end_compare_30:
	beq $t0, $zero, else_31
	lw $t0, 20($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	addi $t0, $t0, 1
	sw $t0, 4($sp)
	lw $t0, 40($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 24($sp)
	sub $a0, $a0, $t0
	addi $a0, $a0, 1
	sw $a0, 8($sp)
	lw $s2, 16($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 16($sp)
	sw $a0, 12($t0)
	lw $t0, 8($sp)
	sw $t0, 4($sp)
	j endif_31
else_31:
	lw $t0, 0($sp)
	la $t1, str23
	loop_compare_31:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_31
	bnez $s5, loop_compare_31
	li $t0, 1
	j end_compare_31
	end_not_equals_31:
	li $t0, 0
	end_compare_31:
	beq $t0, $zero, else_32
	lw $t0, 20($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	addi $t0, $t0, 1
	sw $t0, 4($sp)
	lw $t0, 40($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 24($sp)
	sub $a0, $a0, $t0
	addi $a0, $a0, 1
	sw $a0, 8($sp)
	lw $s2, 16($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 16($sp)
	sw $a0, 12($t0)
	lw $t0, 8($sp)
	sw $t0, 4($sp)
	j endif_32
else_32:
	lw $t0, 12($sp)
	li $t1, 10
	mul $t0, $t0, $t1
	lw $t1, 16($sp)
	move $s2, $t1
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 40($sp)
	move $s2, $t1
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 48($sp)
	sw $t1, 4($sp)
	li $t1, 1
	sw $t1, 8($sp)
	lw $s2, 20($sp)
	jal substr
	addi $sp, $sp, 12
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	sw $a0, 4($sp)
	lw $s2, 16($sp)
	jal Parse_c2i
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	add $t0, $t0, $a0
	sw $t0, 12($sp)
	lw $t0, 4($sp)
	addi $t0, $t0, 1
	sw $t0, 4($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	beq $t0, $t1, compare_5
	addi $t0, $zero, 0
	j end_compare_37
	compare_5:
	addi $t0, $zero, 1
	end_compare_37:
	beq $t0, $zero, else_33
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str24
	copy_7:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_7
	move $t0, $v0
	lw $t1, 16($sp)
	sw $t0, 12($t1)
	j endif_33
else_33:
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str25
	copy_8:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_8
	move $t0, $v0
endif_33:
endif_32:
endif_31:
	addi $sp, $sp, 4
	#End Region Let
	j loop_5
end_while_5:
	la $a0, StaticVoid
	addi $sp, $sp, 4
	#End Region Let
	addi $sp, $sp, 4
	#End Region Let
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t0
	jr $ra
Main_main:
	lw $t0, 0($sp)
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
	lw $t0, 28($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
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
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
BoolOp_and:
	lw $t0, 4($sp)
	beq $t0, $zero, else_34
	lw $t0, 8($sp)
	j endif_34
else_34:
	li $t0, 0
endif_34:
	move $a0, $t0
	jr $ra
BoolOp_or:
	lw $t0, 4($sp)
	beq $t0, $zero, else_35
	li $t0, 1
	j endif_35
else_35:
	lw $t0, 8($sp)
endif_35:
	move $a0, $t0
	jr $ra
__init_Graph__:
	li $a0, 16
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Graph
	sw $t0, 0($s1)
	la $t0, StaticGraph
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_VList__
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
	jal __init_EList__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	sw $t0, 12($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_Vertice__:
	li $a0, 16
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Vertice
	sw $t0, 0($s1)
	la $t0, StaticVertice
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $t0, 0
	sw $t0, 8($s1)
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_EList__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	sw $t0, 12($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_Edge__:
	li $a0, 20
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Edge
	sw $t0, 0($s1)
	la $t0, StaticEdge
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $t0, 0
	sw $t0, 8($s1)
	li $t0, 0
	sw $t0, 12($s1)
	li $t0, 0
	sw $t0, 16($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_EList__:
	li $a0, 12
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, EList
	sw $t0, 0($s1)
	la $t0, StaticEList
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	la $a0, StaticVoid
	sw $a0, 8($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_ECons__:
	li $a0, 16
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, ECons
	sw $t0, 0($s1)
	la $t0, StaticECons
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	la $a0, StaticVoid
	sw $a0, 8($s1)
	la $a0, StaticVoid
	sw $a0, 12($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_VList__:
	li $a0, 12
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, VList
	sw $t0, 0($s1)
	la $t0, StaticVList
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	la $a0, StaticVoid
	sw $a0, 8($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_VCons__:
	li $a0, 16
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, VCons
	sw $t0, 0($s1)
	la $t0, StaticVCons
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	la $a0, StaticVoid
	sw $a0, 8($s1)
	la $a0, StaticVoid
	sw $a0, 12($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_Parse__:
	li $a0, 16
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Parse
	sw $t0, 0($s1)
	la $t0, StaticParse
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_BoolOp__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	sw $t0, 8($s1)
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str19
	copy_9:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_9
	move $t0, $v0
	sw $t0, 12($s1)
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
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	lw $s2, 8($sp)
	jal __init_BoolOp__
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	sw $t0, 8($s1)
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str19
	copy_10:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_10
	move $t0, $v0
	sw $t0, 12($s1)
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -12
	sw $s1, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 12($sp)
	jal Main_read_input
	addi $sp, $sp, 4
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	sw $a0, 16($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_BoolOp__:
	li $a0, 8
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, BoolOp
	sw $t0, 0($s1)
	la $t0, StaticBoolOp
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
	length_in_string_5:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_5
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_5:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_5
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
	length_in_string_6:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_6
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_6:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_6
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
	length_in_string_7:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_7
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_7:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_7
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
	length_in_string_8:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_8
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_8:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_8
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
