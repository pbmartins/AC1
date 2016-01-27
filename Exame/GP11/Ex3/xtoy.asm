.data
result: .double 1.0
.text
.globl xtoy
xtoy:
	addi $sp, $sp, -16
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	swc1 $f20, 8($sp)
	swc1 $f21, 12($sp)
	mov.d $f20, $f12 # x = $f20
	or $s0, $a0, $0 # y = $s0
	# i = $t0
	# $f4 = result
	li $t0, 0 # i = 0
	l.d $f0, result # result = 1.0
	
	# $t1 = abs(y)
	or $a0, $s0, $0
	jal absf
	or $t1, $v0, $0
	
for:
	bge $t0, $t1, endfor
	ble $s0, $0, else # if(y > 0)
	mul.d $f0, $f0, $f20
	j endif
	
else:
	div.d $f0, $f0, $f20
	
endif:
	addi $t0, $t0, 1 # i++
	j for
	
endfor:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lwc1 $f20, 8($sp)
	lwc1 $f21, 12($sp)
	addi $sp, $sp, 16
	jr $ra

# int abs(int val)
absf:
	or $v0, $a0, $0
	bge $a0, $0, endabsif # if(val < 0)
	sub $v0, $0, $a0 # val = -val;
	
endabsif:
	jr $ra # return val;
	
