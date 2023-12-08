.data
abort: .asciiz "error abort from "
Book: .asciiz "Book"
Article: .asciiz "Article"
BookList: .asciiz "BookList"
Cons: .asciiz "Cons"
Nil: .asciiz "Nil"
Main: .asciiz "Main"
str3: .asciiz "title:      "
str4: .asciiz "\n"
str5: .asciiz "author:     "
str6: .asciiz "\n"
str8: .asciiz "periodical:  "
str9: .asciiz "\n"
str12: .asciiz "Compilers, Principles, Techniques, and Tools"
str13: .asciiz "Aho, Sethi, and Ullman"
str14: .asciiz "The Top 100 CD_ROMs"
str15: .asciiz "Ulanoff"
str16: .asciiz "PC Magazine"
str1: .asciiz ""
str2: .asciiz ""
str7: .asciiz ""
StaticVoid: .asciiz "Void"

StaticIO: .word StaticObject, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int

StaticObject: .word StaticVoid, 8, Object_type_name, Object_abort, Object_copy

StaticBook: .word StaticIO, 16, Book_type_name, Book_abort, Book_copy, Book_out_string, Book_out_int, Book_in_string, Book_in_int, Book_initBook, Book_print

StaticArticle: .word StaticBook, 20, Article_type_name, Article_abort, Article_copy, Article_out_string, Article_out_int, Article_in_string, Article_in_int, Article_initBook, Article_print, Article_initArticle

StaticBookList: .word StaticIO, 8, BookList_type_name, BookList_abort, BookList_copy, BookList_out_string, BookList_out_int, BookList_in_string, BookList_in_int, BookList_isNil, BookList_cons, BookList_car, BookList_cdr, BookList_print_list

StaticCons: .word StaticBookList, 16, Cons_type_name, Cons_abort, Cons_copy, Cons_out_string, Cons_out_int, Cons_in_string, Cons_in_int, Cons_isNil, Cons_cons, Cons_car, Cons_cdr, Cons_print_list, Cons_init

StaticNil: .word StaticBookList, 8, Nil_type_name, Nil_abort, Nil_copy, Nil_out_string, Nil_out_int, Nil_in_string, Nil_in_int, Nil_isNil, Nil_cons, Nil_car, Nil_cdr, Nil_print_list

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
Book_initBook:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	lw $t0, 8($sp)
	lw $t1, 0($sp)
	sw $t0, 12($t1)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Book_print:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
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
	jal Book_out_string
	addi $sp, $sp, 8
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
	lw $t0, 20($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $s2, $a0
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 3
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str4
	copy_1:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_1
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
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str5
	copy_2:
	lb $t2, 0($s3)
	sb $t2, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t2, copy_2
	move $t2, $v0
	sw $t2, 4($sp)
	jal Book_out_string
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	move $s2, $a0
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $ra, 8($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t2, 20($sp)
	lw $t3, 12($t2)
	sw $t3, 4($sp)
	move $t2, $s2
	lw $t2, 4($t2)
	lw $t2, 20($t2)
	jal $t2
	addi $sp, $sp, 8
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
	li $a0, 3
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str6
	copy_3:
	lb $t3, 0($s3)
	sb $t3, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t3, copy_3
	move $t3, $v0
	sw $t3, 4($sp)
	move $t3, $s2
	lw $t3, 4($t3)
	lw $t3, 20($t3)
	jal $t3
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	lw $t4, 0($sp)
	move $a0, $t4
	jr $ra
Article_initBook:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	lw $t0, 8($sp)
	lw $t1, 0($sp)
	sw $t0, 12($t1)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Article_initArticle:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t0, 20($sp)
	sw $t0, 4($sp)
	lw $t0, 24($sp)
	sw $t0, 8($sp)
	jal Article_initBook
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 12($sp)
	lw $t1, 0($sp)
	sw $t0, 16($t1)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
Article_print:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal Book_print
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str8
	copy_4:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_4
	move $t0, $v0
	sw $t0, 4($sp)
	jal Article_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $s2, $a0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 12($sp)
	lw $t1, 16($t0)
	sw $t1, 4($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $s2, $a0
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 3
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str9
	copy_5:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_5
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
	move $a0, $t2
	jr $ra
BookList_isNil:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal BookList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	li $t0 1
	move $a0, $t0
	jr $ra
BookList_cons:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_Cons__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	sw $t0, 0($sp)
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	sw $t0, 4($sp)
	lw $t0, 20($sp)
	sw $t0, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 56($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
BookList_car:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal BookList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_Book__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $a0, $t0
	jr $ra
BookList_cdr:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal BookList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_BookList__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $a0, $t0
	jr $ra
BookList_print_list:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal BookList_abort
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
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	sw $t0, 4($sp)
	lw $t0, 20($sp)
	sw $t0, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 56($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
Cons_isNil:
	li $t0 1
	move $a0, $t0
	jr $ra
Cons_init:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	lw $t0, 8($sp)
	lw $t1, 0($sp)
	sw $t0, 12($t1)
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
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t0, 24($sp)
	sw $t0, 4($sp)
	lw $t0, 20($sp)
	sw $t0, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 56($t0)
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
	jal BookList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_Book__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $a0, $t0
	jr $ra
Nil_cdr:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal BookList_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_BookList__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $a0, $t0
	jr $ra
Nil_isNil:
	li $t0 1
	move $a0, $t0
	jr $ra
Nil_print_list:
	li $t0 1
	move $a0, $t0
	jr $ra
Main_main:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_Book__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $a0, 45
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str12
	copy_6:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_6
	move $t0, $v0
	sw $t0, 4($sp)
	li $a0, 23
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str13
	copy_7:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_7
	move $t0, $v0
	sw $t0, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 36($t0)
	jal $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	jal __init_Article__
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $t1, $a0
	move $s2, $t1
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -16
	sw $s2, 0($sp)
	li $a0, 20
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str14
	copy_8:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_8
	move $t1, $v0
	sw $t1, 4($sp)
	li $a0, 8
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str15
	copy_9:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_9
	move $t1, $v0
	sw $t1, 8($sp)
	li $a0, 12
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str16
	copy_10:
	lb $t1, 0($s3)
	sb $t1, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t1, copy_10
	move $t1, $v0
	sw $t1, 12($sp)
	move $t1, $s2
	lw $t1, 4($t1)
	lw $t1, 44($t1)
	jal $t1
	addi $sp, $sp, 16
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $ra, 8($sp)
	jal __init_Nil__
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
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t2, 24($sp)
	sw $t2, 4($sp)
	move $t2, $s2
	lw $t2, 4($t2)
	lw $t2, 40($t2)
	jal $t2
	addi $sp, $sp, 8
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
	lw $t3, 24($sp)
	sw $t3, 4($sp)
	move $t3, $s2
	lw $t3, 4($t3)
	lw $t3, 40($t3)
	jal $t3
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	lw $t4, 8($sp)
	sw $a0, 8($t4)
	lw $t4, 8($sp)
	lw $t5, 8($t4)
	move $s2, $t5
	addi $sp, $sp, -20
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $ra, 16($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	move $t4, $s2
	lw $t4, 4($t4)
	lw $t4, 52($t4)
	jal $t4
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
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
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str1
	copy_11:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_11
	move $t0, $v0
	sw $t0, 8($s1)
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str2
	copy_12:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_12
	move $t0, $v0
	sw $t0, 12($s1)
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
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str1
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
	la $s3, str2
	copy_14:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_14
	move $t0, $v0
	sw $t0, 12($s1)
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str7
	copy_15:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_15
	move $t0, $v0
	sw $t0, 16($s1)
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
	sw $t0, 8($s1)
	sw $t0, 12($s1)
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
	sw $t0, 8($s1)
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
	jr $ra
Book_in_string:
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
	jr $ra
Article_in_string:
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
	jr $ra
BookList_in_string:
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
