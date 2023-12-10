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
A: .asciiz "A"
B: .asciiz "B"
C: .asciiz "C"
D: .asciiz "D"
E: .asciiz "E"
A2I: .asciiz "A2I"
Main: .asciiz "Main"
str1: .asciiz "0"
str2: .asciiz "1"
str3: .asciiz "2"
str4: .asciiz "3"
str5: .asciiz "4"
str6: .asciiz "5"
str7: .asciiz "6"
str8: .asciiz "7"
str9: .asciiz "8"
str10: .asciiz "9"
str11: .asciiz "0"
str12: .asciiz "1"
str13: .asciiz "2"
str14: .asciiz "3"
str15: .asciiz "4"
str16: .asciiz "5"
str17: .asciiz "6"
str18: .asciiz "7"
str19: .asciiz "8"
str20: .asciiz "9"
str21: .asciiz ""
str22: .asciiz "-"
str23: .asciiz "+"
str24: .asciiz "0"
str25: .asciiz "-"
str26: .asciiz ""
str29: .asciiz "\ntTo add a number to "
str30: .asciiz "...enter a:\n"
str31: .asciiz "tTo negate "
str32: .asciiz "...enter b:\n"
str33: .asciiz "tTo find the difference between "
str34: .asciiz "and another number...enter c:\n"
str35: .asciiz "tTo find the factorial of "
str36: .asciiz "...enter d:\n"
str37: .asciiz "tTo square "
str38: .asciiz "...enter e:\n"
str39: .asciiz "tTo cube "
str40: .asciiz "...enter f:\n"
str41: .asciiz "tTo find out if "
str42: .asciiz "is a multiple of 3...enter g:\n"
str43: .asciiz "tTo divide "
str44: .asciiz "by 8...enter h:\n"
str45: .asciiz "tTo get a new number...enter j:\n"
str46: .asciiz "tTo quit...enter q:\n\n"
str47: .asciiz "\n"
str48: .asciiz "Please enter a number...  "
str49: .asciiz "Class type is now A\n"
str50: .asciiz "Class type is now B\n"
str51: .asciiz "Class type is now C\n"
str52: .asciiz "Class type is now D\n"
str53: .asciiz "Class type is now E\n"
str54: .asciiz "Oooops\n"
str55: .asciiz " "
str56: .asciiz "number "
str57: .asciiz "is even!\n"
str58: .asciiz "is odd!\n"
str59: .asciiz "a"
str60: .asciiz "b"
str61: .asciiz "Oooops\n"
str62: .asciiz "c"
str63: .asciiz "d"
str64: .asciiz "e"
str65: .asciiz "f"
str66: .asciiz "g"
str67: .asciiz "number "
str68: .asciiz "is divisible by 3.\n"
str69: .asciiz "number "
str70: .asciiz "is not divisible by 3.\n"
str71: .asciiz "h"
str72: .asciiz "number "
str73: .asciiz "is equal to "
str74: .asciiz "times 8 with a remainder of "
str75: .asciiz "\n"
str76: .asciiz "j"
str77: .asciiz "q"
str28: .asciiz ""
StaticVoid: .word Void, StaticVoid, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError, VoidError
StaticObject: .word Object_inherits, 8, Object_type_name, Object_abort, Object_copy
StaticIO: .word IO_inherits, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int
StaticA: .word A_inherits, 12, A_type_name, A_abort, A_copy, A_value, A_set_var, A_method1, A_method2, A_method3, A_method4, A_method5
StaticB: .word B_inherits, 12, B_type_name, B_abort, B_copy, B_value, B_set_var, B_method1, B_method2, B_method3, B_method4, B_method5
StaticC: .word C_inherits, 12, C_type_name, C_abort, C_copy, C_value, C_set_var, C_method1, C_method2, C_method3, C_method4, C_method5, C_method6
StaticD: .word D_inherits, 12, D_type_name, D_abort, D_copy, D_value, D_set_var, D_method1, D_method2, D_method3, D_method4, D_method5, D_method7
StaticE: .word E_inherits, 12, E_type_name, E_abort, E_copy, E_value, E_set_var, E_method1, E_method2, E_method3, E_method4, E_method5, E_method7, E_method6
StaticA2I: .word A2I_inherits, 8, A2I_type_name, A2I_abort, A2I_copy, A2I_c2i, A2I_i2c, A2I_a2i, A2I_a2i_aux, A2I_i2a, A2I_i2a_aux
StaticMain: .word Main_inherits, 24, Main_type_name, Main_abort, Main_copy, Main_out_string, Main_out_int, Main_in_string, Main_in_int, Main_menu, Main_prompt, Main_get_int, Main_is_even, Main_class_type, Main_print, Main_main
Object_inherits: .word -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1
IO_inherits: .word -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1
A_inherits: .word -1, -1, -1, 2, -1, 1, -1, -1, -1, -1, -1, -1
B_inherits: .word -1, -1, -1, 3, -1, 2, 1, -1, -1, -1, -1, -1
C_inherits: .word -1, -1, -1, 4, -1, 3, 2, 1, -1, -1, -1, -1
D_inherits: .word -1, -1, -1, 4, -1, 3, 2, -1, 1, -1, -1, -1
E_inherits: .word -1, -1, -1, 5, -1, 4, 3, -1, 2, 1, -1, -1
A2I_inherits: .word -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, 1, -1
Main_inherits: .word -1, -1, -1, 3, 2, -1, -1, -1, -1, -1, -1, 1
.text
.globl main
main:
	jal __init_Main__
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	jal Main_main
	li $v0, 10
	syscall
A_value:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $a0, $t0
	jr $ra
A_set_var:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
A_method1:
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
A_method2:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	lw $t1, 12($sp)
	add $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_B__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
A_method3:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	sub $t0 $zero $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_C__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
A_method4:
	lw $t0, 8($sp)
	lw $t1, 4($sp)
	slt $t0, $t0, $t1
	beq $t0, $zero, else_0
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	lw $t1, 12($sp)
	sub $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_D__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	j endif_0
else_0:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 12($sp)
	lw $t1, 8($sp)
	sub $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_D__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
endif_0:
	jr $ra
A_method5:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 1
	sw $t0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	li $t0, 1
	sw $t0, 0($sp)
loop_0:
	lw $t0, 0($sp)
	lw $t1, 12($sp)
	slt $t0, $t1, $t0
	li $t1, 1
	slt $t0, $t0, $t1
	beq $t0, $zero, end_while_0
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	mul $t0, $t0, $t1
	sw $t0, 4($sp)
	lw $t0, 0($sp)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	j loop_0
end_while_0:
	la $a0, StaticVoid
	addi $sp, $sp, 4
	#End Region Let
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_E__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
B_value:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $a0, $t0
	jr $ra
B_set_var:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
B_method1:
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
B_method2:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	lw $t1, 12($sp)
	add $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_B__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
B_method3:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	sub $t0 $zero $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_C__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
B_method4:
	lw $t0, 8($sp)
	lw $t1, 4($sp)
	slt $t0, $t0, $t1
	beq $t0, $zero, else_1
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	lw $t1, 12($sp)
	sub $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_D__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	j endif_1
else_1:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 12($sp)
	lw $t1, 8($sp)
	sub $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_D__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
endif_1:
	jr $ra
B_method5:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	lw $t1, 8($sp)
	mul $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_E__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
C_value:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $a0, $t0
	jr $ra
C_set_var:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
C_method1:
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
C_method2:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	lw $t1, 12($sp)
	add $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_B__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
C_method3:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	sub $t0 $zero $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_C__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
C_method4:
	lw $t0, 8($sp)
	lw $t1, 4($sp)
	slt $t0, $t0, $t1
	beq $t0, $zero, else_2
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	lw $t1, 12($sp)
	sub $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_D__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	j endif_2
else_2:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 12($sp)
	lw $t1, 8($sp)
	sub $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_D__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
endif_2:
	jr $ra
C_method6:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	sub $t0 $zero $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_A__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
C_method5:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	lw $t1, 8($sp)
	mul $t0, $t0, $t1
	lw $t1, 8($sp)
	mul $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_E__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
D_value:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $a0, $t0
	jr $ra
D_set_var:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
D_method1:
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
D_method2:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	lw $t1, 12($sp)
	add $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_B__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
D_method3:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	sub $t0 $zero $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_C__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
D_method4:
	lw $t0, 8($sp)
	lw $t1, 4($sp)
	slt $t0, $t0, $t1
	beq $t0, $zero, else_3
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	lw $t1, 12($sp)
	sub $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_D__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	j endif_3
else_3:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 12($sp)
	lw $t1, 8($sp)
	sub $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_D__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
endif_3:
	jr $ra
D_method5:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	lw $t1, 8($sp)
	mul $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_E__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
D_method7:
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 8($sp)
	sw $t0, 0($sp)
	li $t0, 0
	lw $t1, 0($sp)
	slt $t1, $t1, $t0
	beq $t1, $zero, else_4
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	sub $t0 $zero $t0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal D_method7
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	j endif_4
else_4:
	li $t0, 0
	lw $t1, 0($sp)
	beq $t0, $t1, compare_0
	addi $t0, $zero, 0
	j end_compare_22
	compare_0:
	addi $t0, $zero, 1
	end_compare_22:
	beq $t0, $zero, else_5
	li $t0, 1
	j endif_5
else_5:
	li $t0, 1
	lw $t1, 0($sp)
	beq $t0, $t1, compare_1
	addi $t0, $zero, 0
	j end_compare_23
	compare_1:
	addi $t0, $zero, 1
	end_compare_23:
	beq $t0, $zero, else_6
	li $t0, 0
	j endif_6
else_6:
	li $t0, 2
	lw $t1, 0($sp)
	beq $t0, $t1, compare_2
	addi $t0, $zero, 0
	j end_compare_24
	compare_2:
	addi $t0, $zero, 1
	end_compare_24:
	beq $t0, $zero, else_7
	li $t0, 0
	j endif_7
else_7:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	addi $t0, $t0, -3
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal D_method7
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
endif_7:
endif_6:
endif_5:
	move $a0, $t0
endif_4:
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
E_value:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	move $a0, $t0
	jr $ra
E_set_var:
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	sw $t0, 8($t1)
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
E_method1:
	lw $t0, 0($sp)
	move $a0, $t0
	jr $ra
E_method2:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	lw $t1, 12($sp)
	add $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_B__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
E_method3:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	sub $t0 $zero $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_C__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
E_method4:
	lw $t0, 8($sp)
	lw $t1, 4($sp)
	slt $t0, $t0, $t1
	beq $t0, $zero, else_8
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	lw $t1, 12($sp)
	sub $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_D__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	j endif_8
else_8:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 12($sp)
	lw $t1, 8($sp)
	sub $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_D__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
endif_8:
	jr $ra
E_method5:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	lw $t1, 8($sp)
	mul $t0, $t0, $t1
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_E__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
E_method7:
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 8($sp)
	sw $t0, 0($sp)
	li $t0, 0
	lw $t1, 0($sp)
	slt $t1, $t1, $t0
	beq $t1, $zero, else_9
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	sub $t0 $zero $t0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal D_method7
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	j endif_9
else_9:
	li $t0, 0
	lw $t1, 0($sp)
	beq $t0, $t1, compare_3
	addi $t0, $zero, 0
	j end_compare_25
	compare_3:
	addi $t0, $zero, 1
	end_compare_25:
	beq $t0, $zero, else_10
	li $t0, 1
	j endif_10
else_10:
	li $t0, 1
	lw $t1, 0($sp)
	beq $t0, $t1, compare_4
	addi $t0, $zero, 0
	j end_compare_26
	compare_4:
	addi $t0, $zero, 1
	end_compare_26:
	beq $t0, $zero, else_11
	li $t0, 0
	j endif_11
else_11:
	li $t0, 2
	lw $t1, 0($sp)
	beq $t0, $t1, compare_5
	addi $t0, $zero, 0
	j end_compare_27
	compare_5:
	addi $t0, $zero, 1
	end_compare_27:
	beq $t0, $zero, else_12
	li $t0, 0
	j endif_12
else_12:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	addi $t0, $t0, 3
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal D_method7
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
endif_12:
endif_11:
endif_10:
	move $a0, $t0
endif_9:
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
E_method6:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	lw $t0, 8($sp)
	li $t1, 8
	div $t0, $t1
	mflo $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_A__
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
	lw $t0, 16($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
A2I_c2i:
	lw $t0, 4($sp)
	la $t1, str1
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
	beq $t0, $zero, else_13
	li $t0, 0
	j endif_13
else_13:
	lw $t0, 4($sp)
	la $t1, str2
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
	beq $t0, $zero, else_14
	li $t0, 1
	j endif_14
else_14:
	lw $t0, 4($sp)
	la $t1, str3
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
	beq $t0, $zero, else_15
	li $t0, 2
	j endif_15
else_15:
	lw $t0, 4($sp)
	la $t1, str4
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
	beq $t0, $zero, else_16
	li $t0, 3
	j endif_16
else_16:
	lw $t0, 4($sp)
	la $t1, str5
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
	beq $t0, $zero, else_17
	li $t0, 4
	j endif_17
else_17:
	lw $t0, 4($sp)
	la $t1, str6
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
	beq $t0, $zero, else_18
	li $t0, 5
	j endif_18
else_18:
	lw $t0, 4($sp)
	la $t1, str7
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
	beq $t0, $zero, else_19
	li $t0, 6
	j endif_19
else_19:
	lw $t0, 4($sp)
	la $t1, str8
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
	beq $t0, $zero, else_20
	li $t0, 7
	j endif_20
else_20:
	lw $t0, 4($sp)
	la $t1, str9
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
	beq $t0, $zero, else_21
	li $t0, 8
	j endif_21
else_21:
	lw $t0, 4($sp)
	la $t1, str10
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
	beq $t0, $zero, else_22
	li $t0, 9
	j endif_22
else_22:
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
endif_22:
endif_21:
endif_20:
endif_19:
endif_18:
endif_17:
endif_16:
endif_15:
endif_14:
endif_13:
	move $a0, $t0
	jr $ra
A2I_i2c:
	lw $t0, 4($sp)
	li $t1, 0
	beq $t0, $t1, compare_6
	addi $t0, $zero, 0
	j end_compare_28
	compare_6:
	addi $t0, $zero, 1
	end_compare_28:
	beq $t0, $zero, else_23
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str11
	copy_0:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_0
	move $t0, $v0
	j endif_23
else_23:
	lw $t0, 4($sp)
	li $t1, 1
	beq $t0, $t1, compare_7
	addi $t0, $zero, 0
	j end_compare_29
	compare_7:
	addi $t0, $zero, 1
	end_compare_29:
	beq $t0, $zero, else_24
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str12
	copy_1:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_1
	move $t0, $v0
	j endif_24
else_24:
	lw $t0, 4($sp)
	li $t1, 2
	beq $t0, $t1, compare_8
	addi $t0, $zero, 0
	j end_compare_30
	compare_8:
	addi $t0, $zero, 1
	end_compare_30:
	beq $t0, $zero, else_25
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str13
	copy_2:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_2
	move $t0, $v0
	j endif_25
else_25:
	lw $t0, 4($sp)
	li $t1, 3
	beq $t0, $t1, compare_9
	addi $t0, $zero, 0
	j end_compare_31
	compare_9:
	addi $t0, $zero, 1
	end_compare_31:
	beq $t0, $zero, else_26
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str14
	copy_3:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_3
	move $t0, $v0
	j endif_26
else_26:
	lw $t0, 4($sp)
	li $t1, 4
	beq $t0, $t1, compare_10
	addi $t0, $zero, 0
	j end_compare_32
	compare_10:
	addi $t0, $zero, 1
	end_compare_32:
	beq $t0, $zero, else_27
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str15
	copy_4:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_4
	move $t0, $v0
	j endif_27
else_27:
	lw $t0, 4($sp)
	li $t1, 5
	beq $t0, $t1, compare_11
	addi $t0, $zero, 0
	j end_compare_33
	compare_11:
	addi $t0, $zero, 1
	end_compare_33:
	beq $t0, $zero, else_28
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str16
	copy_5:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_5
	move $t0, $v0
	j endif_28
else_28:
	lw $t0, 4($sp)
	li $t1, 6
	beq $t0, $t1, compare_12
	addi $t0, $zero, 0
	j end_compare_34
	compare_12:
	addi $t0, $zero, 1
	end_compare_34:
	beq $t0, $zero, else_29
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str17
	copy_6:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_6
	move $t0, $v0
	j endif_29
else_29:
	lw $t0, 4($sp)
	li $t1, 7
	beq $t0, $t1, compare_13
	addi $t0, $zero, 0
	j end_compare_35
	compare_13:
	addi $t0, $zero, 1
	end_compare_35:
	beq $t0, $zero, else_30
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str18
	copy_7:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_7
	move $t0, $v0
	j endif_30
else_30:
	lw $t0, 4($sp)
	li $t1, 8
	beq $t0, $t1, compare_14
	addi $t0, $zero, 0
	j end_compare_36
	compare_14:
	addi $t0, $zero, 1
	end_compare_36:
	beq $t0, $zero, else_31
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str19
	copy_8:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_8
	move $t0, $v0
	j endif_31
else_31:
	lw $t0, 4($sp)
	li $t1, 9
	beq $t0, $t1, compare_15
	addi $t0, $zero, 0
	j end_compare_37
	compare_15:
	addi $t0, $zero, 1
	end_compare_37:
	beq $t0, $zero, else_32
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str20
	copy_9:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_9
	move $t0, $v0
	j endif_32
else_32:
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
	la $s3, str21
	copy_10:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_10
	move $t0, $v0
endif_32:
endif_31:
endif_30:
endif_29:
endif_28:
endif_27:
endif_26:
endif_25:
endif_24:
endif_23:
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
	j end_compare_38
	compare_16:
	addi $a0, $zero, 1
	end_compare_38:
	beq $a0, $zero, else_33
	li $t0, 0
	j endif_33
else_33:
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
	la $t0, str22
	loop_compare_10:
	lb $s5, 0($a0)
	lb $s6, 0($t0)
	addiu $a0, $a0, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_10
	bnez $s5, loop_compare_10
	li $a0, 1
	j end_compare_10
	end_not_equals_10:
	li $a0, 0
	end_compare_10:
	beq $a0, $zero, else_34
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
	sub $a0 $zero $a0
	j endif_34
else_34:
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
	la $t0, str23
	loop_compare_11:
	lb $s5, 0($a0)
	lb $s6, 0($t0)
	addiu $a0, $a0, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_11
	bnez $s5, loop_compare_11
	li $a0, 1
	j end_compare_11
	end_not_equals_11:
	li $a0, 0
	end_compare_11:
	beq $a0, $zero, else_35
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
	j endif_35
else_35:
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
endif_35:
endif_34:
	move $t0, $a0
endif_33:
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
loop_1:
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	slt $t0, $t0, $t1
	beq $t0, $zero, end_while_1
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
	j loop_1
end_while_1:
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
	j end_compare_39
	compare_17:
	addi $t0, $zero, 1
	end_compare_39:
	beq $t0, $zero, else_36
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str24
	copy_11:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_11
	move $t0, $v0
	j endif_36
else_36:
	li $t0, 0
	lw $t1, 4($sp)
	slt $t0, $t0, $t1
	beq $t0, $zero, else_37
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
	j endif_37
else_37:
	li $a0, 2
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str25
	copy_12:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_12
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
	sub $t1 $zero $t1
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
endif_37:
	move $t0, $a0
endif_36:
	move $a0, $t0
	jr $ra
A2I_i2a_aux:
	lw $t0, 4($sp)
	li $t1, 0
	beq $t0, $t1, compare_18
	addi $t0, $zero, 0
	j end_compare_40
	compare_18:
	addi $t0, $zero, 1
	end_compare_40:
	beq $t0, $zero, else_38
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str26
	copy_13:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_13
	move $t0, $v0
	j endif_38
else_38:
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
endif_38:
	move $a0, $t0
	jr $ra
Main_menu:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 23
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str29
	copy_14:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_14
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	jal Main_print
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
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str30
	copy_15:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_15
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	li $a0, 12
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str31
	copy_16:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_16
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	jal Main_print
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
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str32
	copy_17:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_17
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	li $a0, 33
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str33
	copy_18:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_18
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	jal Main_print
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
	li $a0, 32
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str34
	copy_19:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_19
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	li $a0, 27
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str35
	copy_20:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_20
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	jal Main_print
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
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str36
	copy_21:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_21
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	li $a0, 12
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str37
	copy_22:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_22
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	jal Main_print
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
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str38
	copy_23:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_23
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	li $a0, 10
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str39
	copy_24:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_24
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	jal Main_print
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
	li $a0, 14
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str40
	copy_25:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_25
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	li $a0, 17
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str41
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
	jal Main_print
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
	li $a0, 32
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str42
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
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 12
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str43
	copy_28:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_28
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	jal Main_print
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
	li $a0, 18
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str44
	copy_29:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_29
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	li $a0, 34
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str45
	copy_30:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_30
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	li $a0, 24
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str46
	copy_31:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_31
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Main_in_string
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
Main_prompt:
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
	la $s3, str47
	copy_32:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_32
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	li $a0, 27
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str48
	copy_33:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_33
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Main_in_string
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
Main_get_int:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_A2I__
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
	jal Main_prompt
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
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
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 28($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
Main_is_even:
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 8($sp)
	sw $t0, 0($sp)
	li $t0, 0
	lw $t1, 0($sp)
	slt $t1, $t1, $t0
	beq $t1, $zero, else_39
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	sub $t0 $zero $t0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_is_even
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	j endif_39
else_39:
	li $t0, 0
	lw $t1, 0($sp)
	beq $t0, $t1, compare_19
	addi $t0, $zero, 0
	j end_compare_41
	compare_19:
	addi $t0, $zero, 1
	end_compare_41:
	beq $t0, $zero, else_40
	li $t0, 1
	j endif_40
else_40:
	li $t0, 1
	lw $t1, 0($sp)
	beq $t0, $t1, compare_20
	addi $t0, $zero, 0
	j end_compare_42
	compare_20:
	addi $t0, $zero, 1
	end_compare_42:
	beq $t0, $zero, else_41
	li $t0, 0
	j endif_41
else_41:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	addi $t0, $t0, -2
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_is_even
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
endif_41:
endif_40:
	move $a0, $t0
endif_39:
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
Main_class_type:
	lw $t0, 4($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
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
	lw $s5, 28($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_5
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_4
	move $t1, $s5
	la $s7, case_2
	end_if_temps_4:
	end_if_temps_5:
	lw $s5, 32($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_7
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_6
	move $t1, $s5
	la $s7, case_3
	end_if_temps_6:
	end_if_temps_7:
	lw $s5, 36($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_9
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_8
	move $t1, $s5
	la $s7, case_4
	end_if_temps_8:
	end_if_temps_9:
	lw $s5, 12($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_11
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_10
	move $t1, $s5
	la $s7, case_5
	end_if_temps_10:
	end_if_temps_11:
	jr $s7
error_case_0:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
case_0:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 22
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str49
	copy_34:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_34
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	j end_case_0
case_1:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 22
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str50
	copy_35:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_35
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	j end_case_0
case_2:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 22
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str51
	copy_36:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_36
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	j end_case_0
case_3:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 22
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str52
	copy_37:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_37
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	j end_case_0
case_4:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 22
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str53
	copy_38:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_38
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	j end_case_0
case_5:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 9
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str54
	copy_39:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_39
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	j end_case_0
end_case_0:
	addi $sp, $sp, 4
	move $a0, $t0
	jr $ra
Main_print:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_A2I__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	sw $t0, 0($sp)
	lw $t0, 4($sp)
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
	lw $t0, 40($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 40($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 36($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 4($sp)
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
	la $s3, str55
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
	addi $sp, $sp, 4
	#End Region Let
	jr $ra
Main_main:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_A__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	lw $t1, 0($sp)
	sw $t0, 12($t1)
loop_2:
	lw $t0, 0($sp)
	lw $t0, 20($t0)
	beq $t0, $zero, end_while_2
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 8
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str56
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
	jal Main_print
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
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	jal Main_is_even
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	beq $a0, $zero, else_42
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 11
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str57
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
	j endif_42
else_42:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 10
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str58
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
endif_42:
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
	jal Main_class_type
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Main_menu
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	sw $a0, 8($t0)
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	la $t1, str59
	loop_compare_12:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_12
	bnez $s5, loop_compare_12
	li $t0, 1
	j end_compare_12
	end_not_equals_12:
	li $t0, 0
	end_compare_12:
	beq $t0, $zero, else_43
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_A__
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
	lw $t0, 16($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Main_get_int
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	sw $a0, 16($t0)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_B__
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
	lw $t0, 20($sp)
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
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $t0, 20($sp)
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
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 8($sp)
	lw $s2, 16($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 32($t0)
	jalr $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	sw $a0, 12($t0)
	j endif_43
else_43:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	la $t1, str60
	loop_compare_13:
	lb $s5, 0($t0)
	lb $s6, 0($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	bne $s5, $s6, end_not_equals_13
	bnez $s5, loop_compare_13
	li $t0, 1
	j end_compare_13
	end_not_equals_13:
	li $t0, 0
	end_compare_13:
	beq $t0, $zero, else_44
	lw $t0, 0($sp)
	lw $t0, 12($t0)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	lw $t0, 4($t0)
	lw $t0, 0($t0)
	la $s7, error_case_1
	li $t1, 100
	lw $s5, 28($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_13
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_12
	move $t1, $s5
	la $s7, case_6
	end_if_temps_12:
	end_if_temps_13:
	lw $s5, 20($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_15
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_14
	move $t1, $s5
	la $s7, case_7
	end_if_temps_14:
	end_if_temps_15:
	lw $s5, 12($t0)
	slt $s6, $s5, $t1
	beqz $s6, end_if_temps_17
	slt $s6, $zero, $s5
	beqz $s6, end_if_temps_16
	move $t1, $s5
	la $s7, case_8
	end_if_temps_16:
	end_if_temps_17:
	jr $s7
error_case_1:
	la $a0, case_error
	li $v0, 4
	syscall
		li $v0, 10
		syscall
case_6:
	lw $t0, 0($sp)
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
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jalr $t0
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
	lw $t0, 4($sp)
	sw $a0, 12($t0)
	move $t0, $a0
	j end_case_1
case_7:
	lw $t0, 0($sp)
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
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 36($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 4($sp)
	sw $a0, 12($t0)
	move $t0, $a0
	j end_case_1
case_8:
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 9
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str61
	copy_44:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_44
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Main_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $t0, 0
	j end_case_1
end_case_1:
	addi $sp, $sp, 4
	j endif_44
else_44:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	la $t1, str62
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
	beq $t0, $zero, else_45
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_A__
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
	lw $t0, 16($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	lw $s2, 8($sp)
	jal Main_get_int
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 24($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	sw $a0, 16($t0)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_D__
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
	lw $t0, 20($sp)
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
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $t0, 20($sp)
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
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 8($sp)
	lw $s2, 16($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 40($t0)
	jalr $t0
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	sw $a0, 12($t0)
	j endif_45
else_45:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	la $t1, str63
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
	beq $t0, $zero, else_46
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_C__
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
	lw $t0, 16($sp)
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
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	jal A_method5
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	sw $a0, 12($t0)
	j endif_46
else_46:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	la $t1, str64
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
	beq $t0, $zero, else_47
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_C__
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
	lw $t0, 16($sp)
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
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	jal B_method5
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	sw $a0, 12($t0)
	j endif_47
else_47:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	la $t1, str65
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
	beq $t0, $zero, else_48
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_C__
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
	lw $t0, 16($sp)
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
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	jal C_method5
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	sw $a0, 12($t0)
	j endif_48
else_48:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	la $t1, str66
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
	beq $t0, $zero, else_49
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_D__
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
	lw $t0, 16($sp)
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
	lw $t0, 20($t0)
	jalr $t0
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
	beq $a0, $zero, else_50
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 8
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str67
	copy_45:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_45
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	jal Main_print
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
	li $a0, 21
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str68
	copy_46:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_46
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	j endif_50
else_50:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 8
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str69
	copy_47:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_47
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
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
	jal Main_print
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
	li $a0, 25
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str70
	copy_48:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_48
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
endif_50:
	j endif_49
else_49:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	la $t1, str71
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
	beq $t0, $zero, else_51
	#Region Let
	addi $sp, $sp, -4
	la $a0, StaticVoid
	sw $a0, 0($sp)
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_E__
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
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 52($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	lw $t0, 8($sp)
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
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
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
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	li $t0, 8
	mul $a0, $a0, $t0
	sub $a0, $a0, $a0
	sw $a0, 0($sp)
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 8
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str72
	copy_49:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_49
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
	lw $t0, 24($sp)
	lw $t0, 12($t0)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_print
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
	li $a0, 13
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str73
	copy_50:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_50
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
	lw $t0, 20($sp)
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_print
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
	li $a0, 29
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str74
	copy_51:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_51
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_A2I__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	sw $t0, 0($sp)
	lw $t0, 12($sp)
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
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 36($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 12($sp)
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
	la $s3, str75
	copy_52:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_52
	move $t0, $v0
	sw $t0, 4($sp)
	lw $s2, 12($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $sp, $sp, 4
	#End Region Let
	addi $sp, $sp, 4
	#End Region Let
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	sw $t0, 12($t1)
	addi $sp, $sp, 4
	#End Region Let
	j endif_51
else_51:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	la $t1, str76
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
	beq $t0, $zero, else_52
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_A__
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	move $t0, $a0
	lw $t1, 0($sp)
	sw $t0, 12($t1)
	j endif_52
else_52:
	lw $t0, 0($sp)
	lw $t0, 8($t0)
	la $t1, str77
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
	beq $t0, $zero, else_53
	li $t0, 0
	lw $t1, 0($sp)
	sw $t0, 20($t1)
	j endif_53
else_53:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	lw $s2, 4($sp)
	jal __init_A__
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
	lw $t0, 16($sp)
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
	lw $t0, 20($t0)
	jalr $t0
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	lw $s2, 12($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 28($t0)
	jalr $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	lw $t0, 0($sp)
	sw $a0, 12($t0)
	move $t0, $a0
endif_53:
endif_52:
endif_51:
	move $a0, $t0
endif_49:
endif_48:
endif_47:
endif_46:
endif_45:
	move $t0, $a0
endif_44:
	move $a0, $t0
endif_43:
	j loop_2
end_while_2:
	la $a0, StaticVoid
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
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $t0, 0
	sw $t0, 8($s1)
	addi $sp, $sp, 4
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
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $t0, 0
	sw $t0, 8($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_C__:
	li $a0, 12
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, C
	sw $t0, 0($s1)
	la $t0, StaticC
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $t0, 0
	sw $t0, 8($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_D__:
	li $a0, 12
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, D
	sw $t0, 0($s1)
	la $t0, StaticD
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $t0, 0
	sw $t0, 8($s1)
	addi $sp, $sp, 4
	move $a0, $s1
	jr $ra
__init_E__:
	li $a0, 12
	li $v0, 9
	syscall
	move $s1, $v0
	la $t0, E
	sw $t0, 0($s1)
	la $t0, StaticE
	sw $t0, 4($s1)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	li $t0, 0
	sw $t0, 8($s1)
	addi $sp, $sp, 4
	move $a0, $s1
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
	li $a0, 1
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str28
	copy_53:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_53
	move $t0, $v0
	sw $t0, 8($s1)
	la $a0, StaticVoid
	sw $a0, 12($s1)
	la $a0, StaticVoid
	sw $a0, 16($s1)
	li $t0, 1
	sw $t0, 20($s1)
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
E_type_name:
	lw $t0, 0($sp)
	lw $t1, 0($t0)
	move $a0, $t1
	jr $ra
E_copy:
	jr $ra
E_abort:
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
VoidError:
	la $a0, void_error
	li $v0, 4
	syscall
	li $v0, 10
	syscall
