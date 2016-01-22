.eqv TRUE, 1
.eqv FALSE, 0
.text
.globl sort
sort:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	or $s0, $a0, $0
	or $s1, $a1, $0
	
do:
	li $t0, FALSE
	li $t1, 0
	addi $t2, $s1, -1
	
for:
	bge $t1, $t2, endfor
	sll $t3, $t1, 3
	addu $t3, $t3, $s0
	l.d $f4, 0($t3)
	l.d $f6, 8($t3)
	c.le.d $f4, $f6
	bc1t endif
	s.d $f6, 0($t3)
	s.d $f4, 8($t3)
	li $t0, TRUE
	
endif:
	addi $t1, $t1, 1
	j for
	
endfor:
	beq $t0, TRUE, do
	
end:
	li $t0, 2
	div $t0, $s1, $t0
	sll $t0, $t0, 3
	add $t0, $s0, $t0
	l.d $f0, 0($t0)
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	addi $sp, $sp, 8
	jr $ra