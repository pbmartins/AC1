.text
.globl strcpy
strcpy:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	lb $t0, 0($a1)
	sb $t0, 0($a0)
	beq $t0, '\0', else
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	jal strcpy
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
else:
	or $v0, $a0, $0
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
