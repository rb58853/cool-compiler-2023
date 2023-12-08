.data
abort: .asciiz "Abort called from class "
substring_error: .asciiz "error substring is out of range."
String: .asciiz "String"
Bool: .asciiz "Bool"
Int: .asciiz "Int"
Void: .asciiz "Void"
List: .asciiz "List"
Cons: .asciiz "Cons"
Nil: .asciiz "Nil"
Main: .asciiz "Main"
str1: .asciiz "\n"
str2: .asciiz "How many numbers to sort? "
StaticVoid: .word Void, 4
StaticIO: .word StaticObject, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int

StaticObject: .word StaticVoid, 8, Object_type_name, Object_abort, Object_copy

StaticList: .word StaticIO, 8, List_type_name, List_abort, List_copy, List_out_string, List_out_int, List_in_string, List_in_int, List_isNil, List_cons, List_car, List_cdr, List_rev, List_sort, List_insert, List_rcons, List_print_list

StaticCons: .word StaticList, 16, Cons_type_name, Cons_abort, Cons_copy, Cons_out_string, Cons_out_int, Cons_in_string, Cons_in_int, Cons_isNil, Cons_cons, Cons_car, Cons_cdr, Cons_rev, Cons_sort, Cons_insert, Cons_rcons, Cons_print_list, Cons_init

StaticNil: .word StaticList, 8, Nil_type_name, Nil_abort, Nil_copy, Nil_out_string, Nil_out_int, Nil_in_string, Nil_in_int, Nil_isNil, Nil_cons, Nil_car, Nil_cdr, Nil_rev, Nil_sort, Nil_insert, Nil_rcons, Nil_print_list

StaticMain: .word StaticIO, 12, Main_type_name, Main_abort, Main_copy, Main_out_string, Main_out_int, Main_in_string, Main_in_int, Main_iota, Main_main

.text
.globl main
main:
	jal __init_Main__
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	jal Main_main
	li $v0, 10
	syscall
List_isNil:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal List_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	li $t0, 1
	move $a0, $t0
	jr $ra
List_cons:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_Cons__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	sw $t0, 0($sp)
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 24($sp)
	sw $t1, 4($sp)
	lw $t0, 20($sp)
	sw $t0, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 72($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
List_car:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal List_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	li $t0, 0
	move $a0, $t0
	jr $ra
List_cdr:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal List_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_List__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $a0, $t0
	jr $ra
List_rev:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal List_cdr
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
List_sort:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal List_cdr
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
List_insert:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal List_cdr
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
List_rcons:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal List_cdr
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
List_print_list:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal List_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
Cons_cons:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_Cons__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	sw $t0, 0($sp)
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 24($sp)
	sw $t1, 4($sp)
	lw $t0, 20($sp)
	sw $t0, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 72($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
Cons_isNil:
	li $t0, 0
	move $a0, $t0
	jr $ra
Cons_init:
	lw $t1, 4($sp)
	lw $t0, 0($sp)
	sw $t1, 8($t0)
	lw $t1, 8($sp)
	lw $t0, 0($sp)
	sw $t1, 12($t0)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Cons_car:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	move $a0, $t1
	jr $ra
Cons_cdr:
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	move $a0, $t1
	jr $ra
Cons_rev:
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 52($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $s2, $a0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 12($sp)
	lw $t1, 8($t0)
	sw $t1, 4($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 64($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
Cons_sort:
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 56($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $s2, $a0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 12($sp)
	lw $t1, 8($t0)
	sw $t1, 4($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 60($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
Cons_insert:
	lw $t1, 4($sp)
	lw $t0, 0($sp)
	lw $t2, 8($t0)
	slt $t0, $t1, $t2
	beq $t0, $zero, else_0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_Cons__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 20($sp)
	sw $t1, 4($sp)
	lw $t0, 16($sp)
	sw $t0, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 72($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	j endif_0
else_0:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_Cons__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	lw $t1, 8($t0)
	sw $t1, 4($sp)
	lw $t0, 16($sp)
	lw $t1, 12($t0)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 32($sp)
	sw $t1, 4($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 60($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 72($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
endif_0:
	jr $ra
Cons_rcons:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_Cons__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	lw $t1, 8($t0)
	sw $t1, 4($sp)
	lw $t0, 16($sp)
	lw $t1, 12($t0)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 32($sp)
	sw $t1, 4($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 64($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 72($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
Cons_print_list:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 12($sp)
	lw $t1, 8($t0)
	sw $t1, 4($sp)
	jal Cons_out_int
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
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
	jal Cons_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 68($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
Nil_cons:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_Cons__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	sw $t0, 0($sp)
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 24($sp)
	sw $t1, 4($sp)
	lw $t0, 20($sp)
	sw $t0, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 72($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
Nil_car:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal List_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	li $t0, 0
	move $a0, $t0
	jr $ra
Nil_cdr:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal List_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_List__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $a0, $t0
	jr $ra
Nil_isNil:
	li $t0, 1
	move $a0, $t0
	jr $ra
Nil_rev:
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Nil_sort:
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Nil_insert:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 16($sp)
	sw $t1, 4($sp)
	jal Nil_rcons
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
Nil_rcons:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_Cons__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 20($sp)
	sw $t1, 4($sp)
	lw $t0, 16($sp)
	sw $t0, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 72($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
Nil_print_list:
	li $t0, 1
	move $a0, $t0
	jr $ra
Main_iota:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_Nil__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
loop_0:
	lw $t1, 0($sp)
	lw $t2, 8($sp)
	slt $t0, $t1, $t2
	beq $t0, $zero, end_while_0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_Cons__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 16($sp)
	sw $t1, 4($sp)
	lw $t0, 20($sp)
	lw $t1, 8($t0)
	sw $t1, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 72($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 4($sp)
	sw $a0, 8($t0)
	lw $t1, 0($sp)
	addi $t0, $t1, 1
	sw $t0, 0($sp)
	j loop_0
end_while_0:
	la $a0, StaticVoid
	addi $sp, $sp, 4
	#End Region Let
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	move $a0, $t1
	jr $ra
Main_main:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 27
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
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
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
	jal Main_in_int
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 4($sp)
	jal Main_iota
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $s2, $a0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 52($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $s2, $a0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 56($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $s2, $a0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 68($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
__init_List__:
	li $a0, 8
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, List
	sw $t0, 0($s1)
	la $t0, StaticList
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_Cons__:
	li $a0, 16
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Cons
	sw $t0, 0($s1)
	la $t0, StaticCons
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $t0, 0
	sw $t0, 8($s1)
	la $a0, StaticVoid
	sw $a0, 12($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_Nil__:
	li $a0, 8
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Nil
	sw $t0, 0($s1)
	la $t0, StaticNil
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
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
List_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
List_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
List_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
List_in_string:
	jr $ra
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
Cons_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
Cons_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
Cons_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
Cons_in_string:
	jr $ra
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
Nil_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
Nil_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
Nil_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
Nil_in_string:
	jr $ra
Nil_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Nil_copy:
	jr $ra
Nil_abort:
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
