.text
.globl max
max:
	li $t0, 1
	# double max = $f0
	l.d $f0, 0($a0) # max = *array;
	addiu $a0, $a0, 8 # array++;

for:
	bge $t0, $a1, endfor # for (i = 1; i < n; i++, array++)
	l.d $f4, 0($a0)
	c.le.d $f4, $f0
	bc1t endif # if (*array > max)
	mov.d $f0, $f4 # max = *array;
	
endif:
	addiu $a0, $a0, 8 # array++;
	addi $t0, $t0, 1 # i++;
	j for
	
endfor:
	jr $ra