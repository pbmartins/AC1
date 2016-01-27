.text
.globl strlen
strlen:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	lb $t0, 0($a0)
	beq $t0, '\0', else
	addiu $a0, $a0, 1
	jal strlen
	addi $v0, $v0, 1
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
else:
	li $v0, 0
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra