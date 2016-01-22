.text
.globl strcpy
strcpy:
	li $t0, 0 # int i = 0;

doloop:
	addu $t1, $a1, $t0
	lb $t2, 0($t1) # $t1 = *src[i];
	addu $t3, $a0, $t0
	sb $t2, 0($t3) # *dst[i] = $t1;
	
	sne $t4, $t2, '\0' # (src[i++] != '\0')
	addi $t0, $t0, 1 # i++
	beq $t4, 1, doloop
	
	or $v0, $a0, $0
	jr $ra