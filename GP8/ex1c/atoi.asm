.text
.globl atoi
atoi:
	li $t0, 0 # res = 0;
	# digit = $t2
	
while:
	lb $t1, 0($a0)
	blt $t1, '0', endwhile # while( (*s >= '0') && (*s <= '9') )
	bgt $t1, '9', endwhile
	
	subiu $t2, $t1, '0' # digit = *s++ - '0';
	addiu $a0, $a0, 1 # s++
	mulu $t0, $t0, 10
	addu $t0, $t0, $t2
	j while
	
endwhile:
	or $v0, $t0, $0
	jr $ra
