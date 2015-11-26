.text
.globl average
average:
	li $t0, 0 # unsigned int i = 0;
	# double sum = $f0
	
for:
	bge $t0, $a1, endfor # for (i = 0; i < n; i++)
	# sum += *array++;
	l.d $f4, 0($a0) 
	add.d $f0, $f0, $f4
	addi $a0, $a0, 8 # array++
	addiu $t0, $t0, 1 # i++
	j for
	
endfor:
	mtc1 $a1, $f6
	cvt.d.w $f6, $f6
	div.d $f0, $f0, $f6
	jr $ra