.text
.globl xtoy
xtoy:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	beq $a1, $0, else
	addiu $a1, $a1, -1
	jal xtoy
	mul $v0, $v0, $a0
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
else:
	li $v0, 1
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra