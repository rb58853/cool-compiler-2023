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
A2I: .asciiz "A2I"
Main: .asciiz "Main"
str34: .asciiz "0"
str35: .asciiz "1"
str36: .asciiz "2"
str37: .asciiz "3"
str38: .asciiz "4"
str39: .asciiz "5"
str40: .asciiz "6"
str41: .asciiz "7"
str42: .asciiz "8"
str43: .asciiz "9"
str44: .asciiz "0"
str45: .asciiz "1"
str46: .asciiz "2"
str47: .asciiz "3"
str48: .asciiz "4"
str49: .asciiz "5"
str50: .asciiz "6"
str51: .asciiz "7"
str52: .asciiz "8"
str53: .asciiz "9"
str54: .asciiz ""
str55: .asciiz "-"
str56: .asciiz "+"
str57: .asciiz "0"
str58: .asciiz "-"
str59: .asciiz ""
str60: .asciiz "678987"
str61: .asciiz " == "
str62: .asciiz "\n"
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

Object_inherits: .word -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

IO_inherits: .word -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

Graph_inherits: .word -1, -1, -1, 2, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

Vertice_inherits: .word -1, -1, -1, 3, 2, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1

Edge_inherits: .word -1, -1, -1, 3, 2, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1

EList_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1

ECons_inherits: .word -1, -1, -1, 4, 3, -1, -1, -1, 2, 1, -1, -1, -1, -1, -1, -1

VList_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1

VCons_inherits: .word -1, -1, -1, 4, 3, -1, -1, -1, -1, -1, 2, 1, -1, -1, -1, -1

Parse_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1

Main_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1

BoolOp_inherits: .word -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1

A2I_inherits: .word -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1

.text
.globl main
main:
	jal __init_Main__
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	jal Main_main
	li $v0, 10
	syscall
A2I_c2i:
	lw $t0, 4($sp)
	la $t1, str34
	loop_compare_32:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_32
	bnez $s5, loop_compare_32
	li $t0, 1
	j end_compare_38
	end_not_equals_32:
	li $t0, 0
	end_compare_38:
	beq $t0, $zero, else_36
	li $t0, 0
	j endif_36
else_36:
	lw $t0, 4($sp)
	la $t1, str35
	loop_compare_33:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_33
	bnez $s5, loop_compare_33
	li $t0, 1
	j end_compare_39
	end_not_equals_33:
	li $t0, 0
	end_compare_39:
	beq $t0, $zero, else_37
	li $t0, 1
	j endif_37
else_37:
	lw $t0, 4($sp)
	la $t1, str36
	loop_compare_34:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_34
	bnez $s5, loop_compare_34
	li $t0, 1
	j end_compare_40
	end_not_equals_34:
	li $t0, 0
	end_compare_40:
	beq $t0, $zero, else_38
	li $t0, 2
	j endif_38
else_38:
	lw $t0, 4($sp)
	la $t1, str37
	loop_compare_35:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_35
	bnez $s5, loop_compare_35
	li $t0, 1
	j end_compare_41
	end_not_equals_35:
	li $t0, 0
	end_compare_41:
	beq $t0, $zero, else_39
	li $t0, 3
	j endif_39
else_39:
	lw $t0, 4($sp)
	la $t1, str38
	loop_compare_36:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_36
	bnez $s5, loop_compare_36
	li $t0, 1
	j end_compare_42
	end_not_equals_36:
	li $t0, 0
	end_compare_42:
	beq $t0, $zero, else_40
	li $t0, 4
	j endif_40
else_40:
	lw $t0, 4($sp)
	la $t1, str39
	loop_compare_37:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_37
	bnez $s5, loop_compare_37
	li $t0, 1
	j end_compare_43
	end_not_equals_37:
	li $t0, 0
	end_compare_43:
	beq $t0, $zero, else_41
	li $t0, 5
	j endif_41
else_41:
	lw $t0, 4($sp)
	la $t1, str40
	loop_compare_38:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_38
	bnez $s5, loop_compare_38
	li $t0, 1
	j end_compare_44
	end_not_equals_38:
	li $t0, 0
	end_compare_44:
	beq $t0, $zero, else_42
	li $t0, 6
	j endif_42
else_42:
	lw $t0, 4($sp)
	la $t1, str41
	loop_compare_39:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_39
	bnez $s5, loop_compare_39
	li $t0, 1
	j end_compare_45
	end_not_equals_39:
	li $t0, 0
	end_compare_45:
	beq $t0, $zero, else_43
	li $t0, 7
	j endif_43
else_43:
	lw $t0, 4($sp)
	la $t1, str42
	loop_compare_40:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_40
	bnez $s5, loop_compare_40
	li $t0, 1
	j end_compare_46
	end_not_equals_40:
	li $t0, 0
	end_compare_46:
	beq $t0, $zero, else_44
	li $t0, 8
	j endif_44
else_44:
	lw $t0, 4($sp)
	la $t1, str43
	loop_compare_41:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_41
	bnez $s5, loop_compare_41
	li $t0, 1
	j end_compare_47
	end_not_equals_41:
	li $t0, 0
	end_compare_47:
	beq $t0, $zero, else_45
	li $t0, 9
	j endif_45
else_45:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal A2I_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $t0, 0
endif_45:
endif_44:
endif_43:
endif_42:
endif_41:
endif_40:
endif_39:
endif_38:
endif_37:
endif_36:
	move $a0, $t0
	jr $ra
A2I_i2c:
	lw $t0, 4($sp)
	li $t1, 0
	beq $t0, $t1, compare_6
	addi $t0, $zero, 0
	j end_compare_50
	compare_6:
	addi $t0, $zero, 1
	end_compare_50:
	beq $t0, $zero, else_46
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str44
	copy_11:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_11
	move $t0, $v0
	j endif_46
else_46:
	lw $t0, 4($sp)
	li $t1, 1
	beq $t0, $t1, compare_7
	addi $t0, $zero, 0
	j end_compare_51
	compare_7:
	addi $t0, $zero, 1
	end_compare_51:
	beq $t0, $zero, else_47
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str45
	copy_12:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_12
	move $t0, $v0
	j endif_47
else_47:
	lw $t0, 4($sp)
	li $t1, 2
	beq $t0, $t1, compare_8
	addi $t0, $zero, 0
	j end_compare_52
	compare_8:
	addi $t0, $zero, 1
	end_compare_52:
	beq $t0, $zero, else_48
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str46
	copy_13:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_13
	move $t0, $v0
	j endif_48
else_48:
	lw $t0, 4($sp)
	li $t1, 3
	beq $t0, $t1, compare_9
	addi $t0, $zero, 0
	j end_compare_53
	compare_9:
	addi $t0, $zero, 1
	end_compare_53:
	beq $t0, $zero, else_49
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str47
	copy_14:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_14
	move $t0, $v0
	j endif_49
else_49:
	lw $t0, 4($sp)
	li $t1, 4
	beq $t0, $t1, compare_10
	addi $t0, $zero, 0
	j end_compare_54
	compare_10:
	addi $t0, $zero, 1
	end_compare_54:
	beq $t0, $zero, else_50
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str48
	copy_15:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_15
	move $t0, $v0
	j endif_50
else_50:
	lw $t0, 4($sp)
	li $t1, 5
	beq $t0, $t1, compare_11
	addi $t0, $zero, 0
	j end_compare_55
	compare_11:
	addi $t0, $zero, 1
	end_compare_55:
	beq $t0, $zero, else_51
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str49
	copy_16:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_16
	move $t0, $v0
	j endif_51
else_51:
	lw $t0, 4($sp)
	li $t1, 6
	beq $t0, $t1, compare_12
	addi $t0, $zero, 0
	j end_compare_56
	compare_12:
	addi $t0, $zero, 1
	end_compare_56:
	beq $t0, $zero, else_52
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str50
	copy_17:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_17
	move $t0, $v0
	j endif_52
else_52:
	lw $t0, 4($sp)
	li $t1, 7
	beq $t0, $t1, compare_13
	addi $t0, $zero, 0
	j end_compare_57
	compare_13:
	addi $t0, $zero, 1
	end_compare_57:
	beq $t0, $zero, else_53
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str51
	copy_18:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_18
	move $t0, $v0
	j endif_53
else_53:
	lw $t0, 4($sp)
	li $t1, 8
	beq $t0, $t1, compare_14
	addi $t0, $zero, 0
	j end_compare_58
	compare_14:
	addi $t0, $zero, 1
	end_compare_58:
	beq $t0, $zero, else_54
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str52
	copy_19:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_19
	move $t0, $v0
	j endif_54
else_54:
	lw $t0, 4($sp)
	li $t1, 9
	beq $t0, $t1, compare_15
	addi $t0, $zero, 0
	j end_compare_59
	compare_15:
	addi $t0, $zero, 1
	end_compare_59:
	beq $t0, $zero, else_55
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str53
	copy_20:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_20
	move $t0, $v0
	j endif_55
else_55:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal A2I_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str54
	copy_21:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_21
	move $t0, $v0
endif_55:
endif_54:
endif_53:
endif_52:
endif_51:
endif_50:
endif_49:
endif_48:
endif_47:
endif_46:
	move $a0, $t0
	jr $ra
A2I_a2i:
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
	beq $a0, $t0, compare_16
	addi $a0, $zero, 0
	j end_compare_60
	compare_16:
	addi $a0, $zero, 1
	end_compare_60:
	beq $a0, $zero, else_56
	li $t0, 0
	j endif_56
else_56:
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
	la $t0, str55
	loop_compare_42:
	lb $s5, 0($a0)
	lb $s6, 0($t0)
	addiu $a0, $a0, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_42
	bnez $s5, loop_compare_42
	li $a0, 1
	j end_compare_48
	end_not_equals_42:
	li $a0, 0
	end_compare_48:
	beq $a0, $zero, else_57
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
	jal A2I_a2i_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $a0 $a0 -1
	subu $a0 $zero $a0
	j endif_57
else_57:
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
	la $t0, str56
	loop_compare_43:
	lb $s5, 0($a0)
	lb $s6, 0($t0)
	addiu $a0, $a0, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_43
	bnez $s5, loop_compare_43
	li $a0, 1
	j end_compare_49
	end_not_equals_43:
	li $a0, 0
	end_compare_49:
	beq $a0, $zero, else_58
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
	jal A2I_a2i_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	j endif_58
else_58:
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
	jal A2I_a2i_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
endif_58:
endif_57:
	move $t0, $a0
endif_56:
	move $a0, $t0
	jr $ra
A2I_a2i_aux:
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
loop_6:
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	slt $t0, $t0, $t1
	beq $t0, $zero, end_while_6
	lw $t0, 8($sp)
	li $t1, 10
	mul $t0, $t0, $t1
	lw $t1, 12($sp)
	move $s2, $t1
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 36($sp)
	move $s2, $t1
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 44($sp)
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
	jal A2I_c2i
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	add $t0, $t0, $a0
	sw $t0, 8($sp)
	lw $t0, 0($sp)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	j loop_6
end_while_6:
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
A2I_i2a:
	lw $t0, 4($sp)
	li $t1, 0
	beq $t0, $t1, compare_17
	addi $t0, $zero, 0
	j end_compare_61
	compare_17:
	addi $t0, $zero, 1
	end_compare_61:
	beq $t0, $zero, else_59
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str57
	copy_22:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_22
	move $t0, $v0
	j endif_59
else_59:
	li $t0, 0
	lw $t1, 4($sp)
	slt $t0, $t0, $t1
	beq $t0, $zero, else_60
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
	jal A2I_i2a_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	j endif_60
else_60:
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str58
	copy_23:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_23
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
	addi $t1 $t1 -1
	subu $t1 $zero $t1
	mul $t0, $t0, $t1
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal A2I_i2a_aux
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
endif_60:
	move $t0, $a0
endif_59:
	move $a0, $t0
	jr $ra
A2I_i2a_aux:
	lw $t0, 4($sp)
	li $t1, 0
	beq $t0, $t1, compare_18
	addi $t0, $zero, 0
	j end_compare_62
	compare_18:
	addi $t0, $zero, 1
	end_compare_62:
	beq $t0, $zero, else_61
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str59
	copy_24:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_24
	move $t0, $v0
	j endif_61
else_61:
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
	jal A2I_i2a_aux
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
	jal A2I_i2c
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
endif_61:
	move $a0, $t0
	jr $ra
Main_main:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	jal __init_A2I__
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
	li $a0, 7
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str60
	copy_25:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_25
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 28($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	jal __init_A2I__
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
	li $t0, 678987
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 36($t0)
	jal $t0
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
	lw $t0, 20($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_int
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 8($sp)
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
	la $s3, str61
	copy_26:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_26
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 8($sp)
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
	la $s3, str62
	copy_27:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_27
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 8
	#End Region Let
	jr $ra
__init_A2I__:
	li $a0, 8
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, A2I
	sw $t0, 0($s1)
	la $t0, StaticA2I
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
	length_in_string_9:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_9
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_9:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_9
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
	length_in_string_10:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_10
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_10:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_10
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
	length_in_string_11:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_11
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_11:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_11
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
	length_in_string_12:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_12
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_12:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_12
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
	length_in_string_13:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_13
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_13:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_13
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
	length_in_string_14:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_14
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_14:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_14
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
	length_in_string_15:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_15
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_15:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_15
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
	length_in_string_16:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_16
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_16:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_16
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
	length_in_string_17:
	lb $t2, 0($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bnez $t2, length_in_string_17
	move $t3, $t1
addi $t3, $t0, -2
sb $zero, 0($t3)
move $t0, $a0
addi $a0, $t1, 1
li $v0, 9
syscall
move $t1, $v0
copy_in_17:
lb $t3, 0($t0)
sb $t3, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
	bnez $t3, copy_in_17
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
