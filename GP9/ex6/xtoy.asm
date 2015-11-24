.text
.globl xtoy
xtoy:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s1, 4($sp)
	
	or $s0, $a0, $0
	or $s1, $a1, $0
	
	beq $s1, $0, else
	addiu $a1, $a1, -1
	jal xtoy
	mul $v0, $v0, $a0
	j endif
	
else:
	li $v0, 1
	
endif:
	lw $ra, 0($sp)
	lw $s1, 4($sp)
	addi $sp, $sp, 8
	jr $ra