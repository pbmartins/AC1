.data
soma: .double 0.0
.text
.globl var
var:
	addi $sp, $sp, -32
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	swc1 $f20, 16($sp)
	swc1 $f21, 20($sp)
	swc1 $f22, 24($sp)
	swc1 $f23, 28($sp)
	
	or $s0, $a0, $0
	or $s1, $a1, $0
	
	# $a0 = $a0
	# $a1 = $a1
	jal average
	mov.d $f22, $f0
	
	li $s2, 0
	l.d $f20, soma
	
for:
	bge $s2, $s1, endfor
	sll $t0, $s2, 3
	add $t0, $t0, $s0
	lwc1 $f12, 0($t0)
	lwc1 $f13, 4($t0)
	sub.d $f12, $f12, $f22
	li $a0, 2
	jal xtoy
	add.d $f20, $f20, $f0
	
	addi $s2, $s2, 1 # i++
	j for
	
endfor:
	#sub.d $f4, $f4, $f4 # clean $f4 double register
	mtc1 $s1, $f4
	cvt.d.w $f4, $f4
	div.d $f0, $f20, $f4
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lwc1 $f20, 16($sp)
	lwc1 $f21, 20($sp)
	lwc1 $f22, 24($sp)
	lwc1 $f23, 28($sp)
	addi $sp, $sp, 32
	jr $ra