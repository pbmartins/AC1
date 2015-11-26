.eqv TRUE 1
.eqv FALSE 0
.text
.globl sort
sort:
	# $t0 = houveTroca
	# $t1 = i
	# $f4 = aux
	addi $t3, $a1, -1 # $t3 = nval - 1
	
do:
	li $t0, FALSE # houveTroca = FALSE;
	li $t1, 0 # i = 0;
	
for:
	bge $t1, $t3, endfor
	sll $t4, $t1, 3 # i * 8
	addi $t5, $t4, 8 # i + 1
	add $t4, $t4, $a0 # &array[i]
	add $t5, $t5, $a0 # &array[i + 1]
	l.d $f6, 0($t4)
	l.d $f8, 0($t5)
	
	c.le.d $f6, $f8 # if (array[i] > array[i+1])
	bc1t endif
	mov.d $f4, $f6 # aux = array[i];
	s.d $f8, 0($t4) # array[i] = array[i+1];
	s.d $f4, 0($t5) # array[i+1] = aux;
	li $t0, TRUE # houveTroca = TRUE;
	
endif:
	addi $t1, $t1, 1 # i++
	j for
	
endfor:
	beq $t0, TRUE, do # while (houveTroca==TRUE);
	div $t0, $a1, 2 # nval / 2
	sll $t0, $t0, 3
	add $t0, $t0, $a0 # &array[nval / 2]
	l.d $f0, 0($t0) # return array[nval / 2];
	jr $ra
	