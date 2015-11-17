.text
.globl main
main:
	li $a0, 4

sum:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	bne $a0, $0, else
	li $v0, 0
	addi $sp, $sp, 8
	jr $ra

else:
	addi $a0, $a0, -1
	jal sum
	lw $a0, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	addu $v0, $a0, $v0
	jr $ra
