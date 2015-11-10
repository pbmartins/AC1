.text
.globl strcpypointer
strcpypointer:
	or $t0, $a0, $0 # $t0 = pdest
	or $t1, $a1, $0 # $t1 = psrc

doloop:
	lb $t2, 0($t0) # $t2 = *psrc;
	sb $t2, 0($t1) # *pdst = $t2;
	addiu $t1, $t1, 1 # pdst++
	
	sne $t4, $t2, '\0' # (src[i++] != '\0')
	addi $t0, $t0, 1 # psrc++
	beq $t4, 1, doloop
	
	or $v0, $a0, $0
	jr $ra