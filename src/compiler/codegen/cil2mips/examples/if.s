.data
.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_IO__
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -8
	sw $s2, 0($sp)
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal __init_IF___
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $t0, $a0
	move $s2, $t0
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -12
	sw $s2, 0($sp)
	li $t0 3
	sw $t0, 4($sp)
	li $t0 2
	sw $t0, 8($sp)
	jal IF__test
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $a0, 4($sp)
	jal out_int
	addi $sp, $sp, 8
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	li $v0, 10
	syscall
IF__test:
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	slt $t2, $t0, $t1
	addi $t2 $t2 -1
	subu $t2 $zero $t2
	addi $t2 $t2 -1
	subu $t2 $zero $t2
	addi $t2 $t2 -1
	subu $t2 $zero $t2
	beq $t2, $zero, else_0
	li $t0 1
	move $a0, $t0
	j endif_0
else_0:
	li $t1 0
	move $a0, $t1
endif_0:
	jr $ra
__init_IF___:
	li $a0, 4
	li $v0, 9
	syscall
	move $s1, $v0
	move $a0, $s1
	jr $ra
__init_Main__:
	li $a0, 4
	li $v0, 9
	syscall
	move $s1, $v0
	move $a0, $s1
	jr $ra
__init_IO__:
	li $a0, 4
	li $v0, 9
	syscall
	move $a0, $v0
	jr $ra
out_string:
	lw $a0, 4($sp)
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	jr $ra
out_int:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	lw $a0, 0($sp)
	jr $ra
