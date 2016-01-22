.text
.globl max
max:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	or $s0, $a0, $0
	or $s1, $a1, $0
	
	l.d $f0, 0($s0)
	addiu $s0, $s0, 8
	li $t0, 1

for:
	bge $t0, $s1, endfor
	l.d $f4, 0($s0)
	c.le.d $f4, $f0
	bc1t endif
	sub.d $f0, $f0, $f0
	add.d $f0, $f0, $f4
	
endif:
	addi $t0, $t0, 1
	addiu $s0, $s0, 8
	j for
	
endfor:
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	addi $sp, $sp, 8
	jr $ra