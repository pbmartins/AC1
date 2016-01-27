.data
xn: .double 1.0
zero: .double 0.0
half: .double 0.5
.text
.globl sqrt
sqrt:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	l.d $f0, xn # xn = 1.0
	l.d $f4, zero
	l.d $f10, half
	li $t0, 0 # i = 0
	
	c.le.d $f12, $f4 # if(val <= 0.0)
	bc1f do
	# return 0.0;
	mov.d $f0, $f4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

do:
	mov.d $f6, $f4
	add.d $f6, $f6, $f0
	div.d $f8, $f12, $f0
	add.d $f8, $f8, $f0
	mul.d $f0, $f10, $f8
	
	c.eq.d $f6, $f12 # (aux != xn)
	bc1t end
	addi $t0, $t0, 1 # ++i
	blt $t0, 25, do
		
end:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra