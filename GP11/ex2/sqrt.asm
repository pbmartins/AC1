.data
xn: .double 1.0
val1: .double 0.0
val2: .double 0.5
.text
.globl sqrt
sqrt:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	swc1 $f20, 4($sp)
	mov.d $f20, $f12 
	
	# double aux = $f6
	l.d $f0, xn # double xn = 1.0;
	li $t0, 0 # int i = 0;
	
	# if(val <= 0.0)
	l.d $f8, val1
	c.le.d $f20, $f8 
	bc1f do
	# return 0.0;
	mov.d $f0, $f8
	j end 
	
do:
	# aux = xn;
	l.d $f6, val1
	add.d $f6, $f6, $f0
	l.d $f8, val2 # $f8 = 0.5
	div.d $f4, $f20, $f0 # val / xn
	add.d $f4, $f4, $f0 # (xn + val/xn)
	mul.d $f0, $f4, $f8 # xn = 0.5 * (xn + val/xn);
	
	c.eq.d $f6, $f4 # (aux != xn)
	bc1t end
	addi $t0, $t0, 1 # ++i
	blt $t0, 25, do
	
end:
	lw $ra, 0($sp)
	lwc1 $f20, 4($sp) 
	addi $sp, $sp, 12
	jr $ra