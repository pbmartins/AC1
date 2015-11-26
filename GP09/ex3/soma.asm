.text
.globl soma
soma:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	
	beq $a1, 0, else
	lw $t0, 0($a0)
	addiu $a0, $a0, 4
	addi $a1, $a1, -1
	jal soma # return *array + soma(array + 1, nelem - 1);
	
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addi $sp, $sp, 12
	
	lw $t0, 0($a0)
	add $v0, $v0, $t0
	
	j endif
	
else:
	li $v0, 0
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addi $sp, $sp, 12
	
endif:
	jr $ra
	