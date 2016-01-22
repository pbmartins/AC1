.data
sum: .double 0.0
.text
.globl average
average:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	or $s0, $a0, $0
	or $s1, $a1, $0
	
	l.d $f0, sum
	li $t0, 0

for:
	bge $t0, $s1, endfor
	l.d $f4, 0($s0)
	add.d $f0, $f0, $f4
	addi $s0, $s0, 8
	addi $t0, $t0, 1
	j for
	
endfor:
	mtc1 $s1, $f4
	cvt.d.w $f4, $f4
	div.d $f0, $f0, $f4
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	addi $sp, $sp, 8
	jr $ra