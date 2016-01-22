.text
.globl stdev
stdev:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal var
	mov.d $f12, $f0
	jal sqrt
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra