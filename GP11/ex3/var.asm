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
	# i = $s2
	# media = $f20
	# soma = $f22
	# res = $f0
	
	jal average
	mov.d $f20, $f0
	
	li $s2, 0 # i = 0;
	l.d $f22, soma # soma = 0.0;
for:
	bge $s2, $s1, endfor
	
	sll $t1, $s2, 3 # j = i * 8
	addu $t1, $s0, $t1 # &array[i]
	ldc1 $f8, 0($t1) # *array[i]
	sub.d $f12, $f8, $f20 # array[i] - media
	li $a0, 2
	jal xtoy
	add.d $f22, $f22, $f0
	
	addi $s2, $s2, 1 # i++
	j for
	
endfor:
	mtc1.d $s1, $f4
	cvt.d.w $f4, $f4
	div.d $f0, $f22, $f4 # return res = soma / nval;
	
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
