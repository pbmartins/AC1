.text
.globl main
main:
	li $a0, 3

fact:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	bne $a0, $0, else
	li $v0, 1
	addi $sp, $sp, 8
	jr $ra

else:
	addi $a0, $a0, -1
	jal fact
	lw $a0, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	mul $v0, $a0, $v0
	jr $ra