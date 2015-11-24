.text 
.globl strcpy
strcpy:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	
	lb $t0, 0($a1) # (*dst = *src)
	sb $t0, 0($a0)
	beq $t0, '\0', endif
	addi $a0, $a0, 1 # dst + 1
	addi $a1, $a1, 1 # src + 1
	jal strcpy
	
endif:	
	or $v0, $a0, $0 # return dst;
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addi $sp, $sp, 12
	jr $ra