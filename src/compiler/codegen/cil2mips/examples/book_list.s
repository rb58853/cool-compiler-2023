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
Book: .asciiz "Book"
Article: .asciiz "Article"
BookList: .asciiz "BookList"
Cons: .asciiz "Cons"
Nil: .asciiz "Nil"
Main: .asciiz "Main"
str5: .asciiz "title:      "
str6: .asciiz "\n"
str7: .asciiz "author:     "
str8: .asciiz "\n"
str11: .asciiz "periodical:  "
str12: .asciiz "\n"
str13: .asciiz "- dynamic type was Book -\n"
str14: .asciiz "- dynamic type was Article -\n"
str15: .asciiz "Compilers, Principles, Techniques, and Tools"
str16: .asciiz "Aho, Sethi, and Ullman"
str17: .asciiz "The Top 100 CD_ROMs"
str18: .asciiz "Ulanoff"
str19: .asciiz "PC Magazine"
str2: .asciiz ""
str4: .asciiz ""
str10: .asciiz ""
StaticVoid: .word Void, 4
StaticObject: .word Object_inherits, 8, Object_type_name, Object_abort, Object_copy

StaticIO: .word IO_inherits, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int

StaticBook: .word Book_inherits, 16, Book_type_name, Book_abort, Book_copy, Book_out_string, Book_out_int, Book_in_string, Book_in_int, Book_initBook, Book_print

StaticArticle: .word Article_inherits, 20, Article_type_name, Article_abort, Article_copy, Article_out_string, Article_out_int, Article_in_string, Article_in_int, Article_initBook, Article_print, Article_initArticle

StaticBookList: .word BookList_inherits, 8, BookList_type_name, BookList_abort, BookList_copy, BookList_out_string, BookList_out_int, BookList_in_string, BookList_in_int, BookList_isNil, BookList_cons, BookList_car, BookList_cdr, BookList_print_list

StaticCons: .word Cons_inherits, 16, Cons_type_name, Cons_abort, Cons_copy, Cons_out_string, Cons_out_int, Cons_in_string, Cons_in_int, Cons_isNil, Cons_cons, Cons_car, Cons_cdr, Cons_print_list, Cons_init

StaticNil: .word Nil_inherits, 8, Nil_type_name, Nil_abort, Nil_copy, Nil_out_string, Nil_out_int, Nil_in_string, Nil_in_int, Nil_isNil, Nil_cons, Nil_car, Nil_cdr, Nil_print_list

StaticMain: .word Main_inherits, 12, Main_type_name, Main_abort, Main_copy, Main_main

Object_inherits: .word -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1

IO_inherits: .word -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1

Book_inherits: .word -1, -1, -1, 3, 2, 1, -1, -1, -1, -1, -1

Article_inherits: .word -1, -1, -1, 4, 3, 2, 1, -1, -1, -1, -1

BookList_inherits: .word -1, -1, -1, 3, 2, -1, -1, 1, -1, -1, -1

Cons_inherits: .word -1, -1, -1, 4, 3, -1, -1, 2, 1, -1, -1

Nil_inherits: .word -1, -1, -1, 4, 3, -1, -1, 2, -1, 1, -1

Main_inherits: .word -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, 1

.text
.globl main
main:
	jal __init_Main__
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	jal Main_main
	li $v0, 10
	syscall
Book_initBook:
	lw $t1, 4($sp)
	lw $t0, 0($sp)
	sw $t1, 8($t0)
	lw $t1, 8($sp)
	lw $t0, 0($sp)
	sw $t1, 12($t0)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Book_print:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str5
	copy_0:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_0
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Book_out_string
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
	lw $t1, 8($t0)
	sw $t1, 4($sp)
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
	li $a0, 3
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str6
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
	jal $t0
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
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str7
	copy_2:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_2
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Book_out_string
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
	li $a0, 3
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str8
	copy_3:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_3
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
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Article_initBook:
	lw $t1, 4($sp)
	lw $t0, 0($sp)
	sw $t1, 8($t0)
	lw $t1, 8($sp)
	lw $t0, 0($sp)
	sw $t1, 12($t0)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Article_initArticle:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 24($sp)
	sw $t1, 4($sp)
	lw $t1, 28($sp)
	sw $t1, 8($sp)
	lw $s2, 16($sp)
	jal Article_initBook
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t1, 12($sp)
	lw $t0, 0($sp)
	sw $t1, 16($t0)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Article_print:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Book_print
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
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str11
	copy_4:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_4
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Article_out_string
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
	lw $t1, 16($t0)
	sw $t1, 4($sp)
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
	li $a0, 3
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str12
	copy_5:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_5
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
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
BookList_isNil:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal BookList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $t0, 1
	move $a0, $t0
	jr $ra
BookList_cons:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	jal __init_Cons__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	sw $t0, 0($sp)
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 28($sp)
	sw $t1, 4($sp)
	lw $t0, 24($sp)
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 56($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
BookList_car:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal BookList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	jal __init_Book__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	move $a0, $t0
	jr $ra
BookList_cdr:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal BookList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	jal __init_BookList__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	move $a0, $t0
	jr $ra
BookList_print_list:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal BookList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
Cons_cons:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	jal __init_Cons__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	sw $t0, 0($sp)
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 28($sp)
	sw $t1, 4($sp)
	lw $t0, 24($sp)
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 56($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
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
Cons_print_list:
	lw $t0, 0($sp)
	lw $t1, 8($t0)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 40($t0)
	jal $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	lw $t0, 4($t0)
	lw $t0, 0($t0)
	la $s7, error_case_0
	li $t1, 100
	lw $s5, 20($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_1
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_0
	move $t1, $s5
	la $s7, case_0
	end_if_temps_0:
	end_if_temps_1:
	lw $s5, 24($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_3
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_2
	move $t1, $s5
	la $s7, case_1
	end_if_temps_2:
	end_if_temps_3:
	j $s7
error_case_0:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
case_0:
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	sw $s2, 8($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 28
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str13
	copy_6:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_6
	move $t1, $v0
	sw $t1, 4($sp)
	lw $s2, 16($sp)
	jal Cons_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	move $t0, $a0
	j end_case_0
case_1:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 31
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str14
	copy_7:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_7
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Cons_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	j end_case_0
end_case_0:
	lw $t0, 0($sp)
	lw $t1, 12($t0)
	move $s2, $t1
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
	jr $ra
Nil_cons:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	jal __init_Cons__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	sw $t0, 0($sp)
	lw $t1, 0($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 28($sp)
	sw $t1, 4($sp)
	lw $t0, 24($sp)
	sw $t0, 8($sp)
	lw $s2, 16($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 56($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
Nil_car:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal BookList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	jal __init_Book__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	move $a0, $t0
	jr $ra
Nil_cdr:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal BookList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	jal __init_BookList__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	move $a0, $t0
	jr $ra
Nil_isNil:
	li $t0, 1
	move $a0, $t0
	jr $ra
Nil_print_list:
	li $t0, 1
	move $a0, $t0
	jr $ra
Main_main:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	jal __init_Book__
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
	li $a0, 45
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str15
	copy_8:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_8
	move $t0, $v0
	sw $t0, 4($sp)
	li $a0, 23
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str16
	copy_9:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_9
	move $t0, $v0
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
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	jal __init_Article__
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
	li $a0, 20
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str17
	copy_10:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_10
	move $t0, $v0
	sw $t0, 4($sp)
	li $a0, 8
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str18
	copy_11:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_11
	move $t0, $v0
	sw $t0, 8($sp)
	li $a0, 12
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str19
	copy_12:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_12
	move $t0, $v0
	sw $t0, 12($sp)
	lw $s2, 20($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 44($t0)
	jal $t0
	addi $sp, $sp, 16
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	jal __init_Nil__
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
	lw $t1, 20($sp)
	sw $t1, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 40($t0)
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
	lw $t1, 16($sp)
	sw $t1, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 40($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 8($sp)
	sw $a0, 8($t0)
	lw $t0, 8($sp)
	lw $t1, 8($t0)
	move $s2, $t1
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
	addi $sp, $sp, 4
	#End Region Let
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
__init_Book__:
	li $a0, 16
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Book
	sw $t0, 0($s1)
	la $t0, StaticBook
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_13:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_13
	move $t0, $v0
	sw $t0, 8($s1)
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_14:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_14
	move $t0, $v0
	sw $t0, 12($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_Article__:
	li $a0, 20
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, Article
	sw $t0, 0($s1)
	la $t0, StaticArticle
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_15:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_15
	move $t0, $v0
	sw $t0, 8($s1)
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_16:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_16
	move $t0, $v0
	sw $t0, 12($s1)
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str10
	copy_17:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_17
	move $t0, $v0
	sw $t0, 16($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_BookList__:
	li $a0, 8
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, BookList
	sw $t0, 0($s1)
	la $t0, StaticBookList
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
	la $a0, StaticVoid
	sw $a0, 8($s1)
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
Book_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
Book_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
Book_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
Book_in_string:
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
Book_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Book_copy:
	jr $ra
Book_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
Article_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
Article_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
Article_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
Article_in_string:
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
Article_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
Article_copy:
	jr $ra
Article_abort:
	la $a0, abort
	li $v0, 4
	syscall
	lw $t0, 0($sp)
	lw $a0, 0($t0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall
BookList_out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
BookList_out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
BookList_in_int:
	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra
BookList_in_string:
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
BookList_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
BookList_copy:
	jr $ra
BookList_abort:
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
