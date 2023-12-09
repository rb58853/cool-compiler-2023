.data
abort: .asciiz "Abort called from class "
substring_error: .asciiz "error substring is out of range."
String: .asciiz "String"
Bool: .asciiz "Bool"
Int: .asciiz "Int"
Void: .asciiz "Void"
string_space: .space 1024
newline: .asciiz "\n"
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
str27: .asciiz "678987"
str28: .asciiz " == "
str29: .asciiz "\n"
StaticVoid: .word Void, 4
StaticIO: .word StaticObject, 8, IO_type_name, IO_abort, IO_copy, IO_out_string, IO_out_int, IO_in_string, IO_in_int

StaticObject: .word StaticVoid, 8, Object_type_name, Object_abort, Object_copy

StaticA2I: .word StaticObject, 8, A2I_type_name, A2I_abort, A2I_copy, A2I_c2i, A2I_i2c, A2I_a2i, A2I_a2i_aux, A2I_i2a, A2I_i2a_aux

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
A2I_c2i:
	lw $t1, 4($sp)
	la $t0, str1
	loop_compare_0:
	lb $s5, 0($t1)
	lb $s6, 0($t0)
	addiu $t1, $t1, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_0
	bnez $s5, loop_compare_0
	li $t1, 1
	j end_compare_0
	end_not_equals_0:
	li $t1, 0
	end_compare_0:
	beq $t1, $zero, else_0
	li $t0, 0
	j endif_0
else_0:
	lw $t1, 4($sp)
	la $t0, str2
	loop_compare_1:
	lb $s5, 0($t1)
	lb $s6, 0($t0)
	addiu $t1, $t1, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_1
	bnez $s5, loop_compare_1
	li $t1, 1
	j end_compare_1
	end_not_equals_1:
	li $t1, 0
	end_compare_1:
	beq $t1, $zero, else_1
	li $t0, 1
	j endif_1
else_1:
	lw $t1, 4($sp)
	la $t0, str3
	loop_compare_2:
	lb $s5, 0($t1)
	lb $s6, 0($t0)
	addiu $t1, $t1, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_2
	bnez $s5, loop_compare_2
	li $t1, 1
	j end_compare_2
	end_not_equals_2:
	li $t1, 0
	end_compare_2:
	beq $t1, $zero, else_2
	li $t0, 2
	j endif_2
else_2:
	lw $t1, 4($sp)
	la $t0, str4
	loop_compare_3:
	lb $s5, 0($t1)
	lb $s6, 0($t0)
	addiu $t1, $t1, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_3
	bnez $s5, loop_compare_3
	li $t1, 1
	j end_compare_3
	end_not_equals_3:
	li $t1, 0
	end_compare_3:
	beq $t1, $zero, else_3
	li $t0, 3
	j endif_3
else_3:
	lw $t1, 4($sp)
	la $t0, str5
	loop_compare_4:
	lb $s5, 0($t1)
	lb $s6, 0($t0)
	addiu $t1, $t1, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_4
	bnez $s5, loop_compare_4
	li $t1, 1
	j end_compare_4
	end_not_equals_4:
	li $t1, 0
	end_compare_4:
	beq $t1, $zero, else_4
	li $t0, 4
	j endif_4
else_4:
	lw $t1, 4($sp)
	la $t0, str6
	loop_compare_5:
	lb $s5, 0($t1)
	lb $s6, 0($t0)
	addiu $t1, $t1, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_5
	bnez $s5, loop_compare_5
	li $t1, 1
	j end_compare_5
	end_not_equals_5:
	li $t1, 0
	end_compare_5:
	beq $t1, $zero, else_5
	li $t0, 5
	j endif_5
else_5:
	lw $t1, 4($sp)
	la $t0, str7
	loop_compare_6:
	lb $s5, 0($t1)
	lb $s6, 0($t0)
	addiu $t1, $t1, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_6
	bnez $s5, loop_compare_6
	li $t1, 1
	j end_compare_6
	end_not_equals_6:
	li $t1, 0
	end_compare_6:
	beq $t1, $zero, else_6
	li $t0, 6
	j endif_6
else_6:
	lw $t1, 4($sp)
	la $t0, str8
	loop_compare_7:
	lb $s5, 0($t1)
	lb $s6, 0($t0)
	addiu $t1, $t1, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_7
	bnez $s5, loop_compare_7
	li $t1, 1
	j end_compare_7
	end_not_equals_7:
	li $t1, 0
	end_compare_7:
	beq $t1, $zero, else_7
	li $t0, 7
	j endif_7
else_7:
	lw $t1, 4($sp)
	la $t0, str9
	loop_compare_8:
	lb $s5, 0($t1)
	lb $s6, 0($t0)
	addiu $t1, $t1, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_8
	bnez $s5, loop_compare_8
	li $t1, 1
	j end_compare_8
	end_not_equals_8:
	li $t1, 0
	end_compare_8:
	beq $t1, $zero, else_8
	li $t0, 8
	j endif_8
else_8:
	lw $t1, 4($sp)
	la $t0, str10
	loop_compare_9:
	lb $s5, 0($t1)
	lb $s6, 0($t0)
	addiu $t1, $t1, 1
	addiu $t0, $t0, 1
	bne $s5, $s6, end_not_equals_9
	bnez $s5, loop_compare_9
	li $t1, 1
	j end_compare_9
	end_not_equals_9:
	li $t1, 0
	end_compare_9:
	beq $t1, $zero, else_9
	li $t0, 9
	j endif_9
else_9:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal A2I_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	li $t0, 0
endif_9:
endif_8:
endif_7:
endif_6:
endif_5:
endif_4:
endif_3:
endif_2:
endif_1:
endif_0:
	move $a0, $t0
	jr $ra
A2I_i2c:
	lw $t1, 4($sp)
	li $t0, 0
	beq $t1, $t0, compare_0
	addi $t0, $zero, 0
	j end_compare_12
	compare_0:
	addi $t0, $zero, 1
	end_compare_12:
	beq $t0, $zero, else_10
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
	j endif_10
else_10:
	lw $t1, 4($sp)
	li $t0, 1
	beq $t1, $t0, compare_1
	addi $t0, $zero, 0
	j end_compare_13
	compare_1:
	addi $t0, $zero, 1
	end_compare_13:
	beq $t0, $zero, else_11
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
	j endif_11
else_11:
	lw $t1, 4($sp)
	li $t0, 2
	beq $t1, $t0, compare_2
	addi $t0, $zero, 0
	j end_compare_14
	compare_2:
	addi $t0, $zero, 1
	end_compare_14:
	beq $t0, $zero, else_12
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
	j endif_12
else_12:
	lw $t1, 4($sp)
	li $t0, 3
	beq $t1, $t0, compare_3
	addi $t0, $zero, 0
	j end_compare_15
	compare_3:
	addi $t0, $zero, 1
	end_compare_15:
	beq $t0, $zero, else_13
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
	j endif_13
else_13:
	lw $t1, 4($sp)
	li $t0, 4
	beq $t1, $t0, compare_4
	addi $t0, $zero, 0
	j end_compare_16
	compare_4:
	addi $t0, $zero, 1
	end_compare_16:
	beq $t0, $zero, else_14
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
	j endif_14
else_14:
	lw $t1, 4($sp)
	li $t0, 5
	beq $t1, $t0, compare_5
	addi $t0, $zero, 0
	j end_compare_17
	compare_5:
	addi $t0, $zero, 1
	end_compare_17:
	beq $t0, $zero, else_15
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
	j endif_15
else_15:
	lw $t1, 4($sp)
	li $t0, 6
	beq $t1, $t0, compare_6
	addi $t0, $zero, 0
	j end_compare_18
	compare_6:
	addi $t0, $zero, 1
	end_compare_18:
	beq $t0, $zero, else_16
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
	j endif_16
else_16:
	lw $t1, 4($sp)
	li $t0, 7
	beq $t1, $t0, compare_7
	addi $t0, $zero, 0
	j end_compare_19
	compare_7:
	addi $t0, $zero, 1
	end_compare_19:
	beq $t0, $zero, else_17
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
	j endif_17
else_17:
	lw $t1, 4($sp)
	li $t0, 8
	beq $t1, $t0, compare_8
	addi $t0, $zero, 0
	j end_compare_20
	compare_8:
	addi $t0, $zero, 1
	end_compare_20:
	beq $t0, $zero, else_18
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
	j endif_18
else_18:
	lw $t1, 4($sp)
	li $t0, 9
	beq $t1, $t0, compare_9
	addi $t0, $zero, 0
	j end_compare_21
	compare_9:
	addi $t0, $zero, 1
	end_compare_21:
	beq $t0, $zero, else_19
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
	j endif_19
else_19:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal A2I_abort
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
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
endif_19:
endif_18:
endif_17:
endif_16:
endif_15:
endif_14:
endif_13:
endif_12:
endif_11:
endif_10:
	move $a0, $t0
	jr $ra
A2I_a2i:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	li $t1, 0
	beq $t0, $t1, compare_10
	addi $t0, $zero, 0
	j end_compare_22
	compare_10:
	addi $t0, $zero, 1
	end_compare_22:
	beq $t0, $zero, else_20
	li $t0, 0
	j endif_20
else_20:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0, 0
	sw $t0, 4($sp)
	li $t0, 1
	sw $t0, 8($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	la $t1, str22
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
	beq $t0, $zero, else_21
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 16($sp)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0, 1
	sw $t0, 4($sp)
	lw $t1, 32($sp)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $a0, -1
	sw $t0, 8($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 4($sp)
	jal A2I_a2i_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $a0 $a0 -1
	subu $a0 $zero $a0
	j endif_21
else_21:
	lw $t1, 4($sp)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0, 0
	sw $t0, 4($sp)
	li $t0, 1
	sw $t0, 8($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	la $t1, str23
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
	beq $t0, $zero, else_22
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 16($sp)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0, 1
	sw $t0, 4($sp)
	lw $t1, 32($sp)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $a0, -1
	sw $t0, 8($sp)
	jal substr
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 4($sp)
	jal A2I_a2i_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	j endif_22
else_22:
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 16($sp)
	sw $t1, 4($sp)
	jal A2I_a2i_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
endif_22:
endif_21:
endif_20:
	jr $ra
A2I_a2i_aux:
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	lw $t1, 12($sp)
	move $s2, $t1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	jal length
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 0($sp)
	#Region Let
	addi $sp, $sp, -4
	li $t0, 0
	sw $t0, 0($sp)
loop_0:
	lw $t1, 0($sp)
	lw $t2, 4($sp)
	slt $t0, $t1, $t2
	beq $t0, $zero, end_while_0
	lw $t1, 8($sp)
	li $t0, 10
	mul $t2, $t1, $t0
	lw $t0, 12($sp)
	move $s2, $t0
	addi $sp, $sp, -8
	sw $t2, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 32($sp)
	move $s2, $t1
	addi $sp, $sp, -8
	sw $t2, 0($sp)
	sw $ra, 4($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	lw $t1, 36($sp)
	sw $t1, 4($sp)
	li $t0, 1
	sw $t0, 8($sp)
	jal substr
	addi $sp, $sp, 12
	lw $t2, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	sw $a0, 4($sp)
	jal A2I_c2i
	addi $sp, $sp, 8
	lw $t2, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	add $t0, $t2, $a0
	sw $t0, 8($sp)
	lw $t1, 0($sp)
	addi $t0, $t1, 1
	sw $t0, 0($sp)
	j loop_0
end_while_0:
	la $a0, StaticVoid
	addi $sp, $sp, 4
	#End Region Let
	addi $sp, $sp, 4
	#End Region Let
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	#End Region Let
	move $a0, $t1
	jr $ra
A2I_i2a:
	lw $t1, 4($sp)
	li $t0, 0
	beq $t1, $t0, compare_11
	addi $t0, $zero, 0
	j end_compare_23
	compare_11:
	addi $t0, $zero, 1
	end_compare_23:
	beq $t0, $zero, else_23
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
	j endif_23
else_23:
	li $t0, 0
	lw $t2, 4($sp)
	slt $t1, $t0, $t2
	beq $t1, $zero, else_24
	lw $t0, 0($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 16($sp)
	sw $t1, 4($sp)
	jal A2I_i2a_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	j endif_24
else_24:
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
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 12($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 28($sp)
	li $t0, 1
	addi $t0 $t0 -1
	subu $t0 $zero $t0
	mul $t0, $t1, $t0
	sw $t0, 4($sp)
	jal A2I_i2a_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 4($sp)
	jal concat
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
endif_24:
endif_23:
	jr $ra
A2I_i2a_aux:
	lw $t1, 4($sp)
	li $t0, 0
	beq $t1, $t0, compare_12
	addi $t0, $zero, 0
	j end_compare_24
	compare_12:
	addi $t0, $zero, 1
	end_compare_24:
	beq $t0, $zero, else_25
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
	j endif_25
else_25:
	#Region Let
	addi $sp, $sp, -4
	lw $t1, 8($sp)
	li $t0, 10
	div $t1, $t0
	mflo $t2
	sw $t2, 0($sp)
	lw $t0, 4($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 12($sp)
	sw $t1, 4($sp)
	jal A2I_i2a_aux
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $s2, $a0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t0, 16($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 32($sp)
	lw $t2, 24($sp)
	li $t0, 10
	mul $t3, $t2, $t0
	sub $t0, $t1, $t3
	sw $t0, 4($sp)
	jal A2I_i2c
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 4($sp)
	jal concat
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $sp, $sp, 4
	#End Region Let
endif_25:
	jr $ra
Main_main:
	#Region Let
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_A2I__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 7
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str27
	copy_14:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_14
	move $t0, $v0
	sw $t0, 4($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 28($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_A2I__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $t0, 678987
	sw $t0, 4($sp)
	move $t0, $s2
	lw $t0, 4($t0)
	lw $t0, 36($t0)
	jal $t0
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 0($sp)
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 16($sp)
	sw $t1, 4($sp)
	jal Main_out_int
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 5
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str28
	copy_15:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_15
	move $t0, $v0
	sw $t0, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	lw $t1, 12($sp)
	sw $t1, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 8($sp)
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	li $a0, 3
	li $v0, 9
	syscall
	move $s4, $v0
	la $s3, str29
	copy_16:
	lb $t0, 0($s3)
	sb $t0, 0($s4)
	addiu $s3, $s3, 1
	addiu $s4, $s4, 1
	bnez $t0, copy_16
	move $t0, $v0
	sw $t0, 4($sp)
	jal Main_out_string
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
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
addi $t0, 1
addi $t1, 1
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
