.text
.globl soma
soma:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	beq $a1, $0, else
	addiu $a0, $a0, 4
	addiu $a1, $a1, -1
	jal soma
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $t0, 0($a0)
	add $v0, $v0, $t0
	addi $sp, $sp, 8
	jr $ra
	
else:
	li $v0, 0
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	jr $ra