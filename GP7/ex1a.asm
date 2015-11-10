.text
.globl strlen
strlen:
	li $t1, 0 # int i = 0
	
while:
	lb $t0, 0($a0) # $t0 = *s
	addiu $a0, $a0, 1 # s++
	beq $t0, '\0', endwhile
	
	addi $t1, $t1, 1
	j while
	
endwhile:
	or $v0, $t1, $0
	jr $ra
	 
	
