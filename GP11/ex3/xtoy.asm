.data
result: .double 1.0
.text
.globl xtoy
xtoy:
	addi $sp, $sp, -16
	sw $ra, 0($sp)
	swc1 $f20, 4($sp)
	swc1 $f21, 8($sp)
	sw $s0, 12($sp)
	
	mov.d $f20, $f12
	or $s0, $a0, $0
	
	li $t0, 0 # i = 0;
	l.d $f4, result # result = 1.0;
	
for:
	# abs(y)
	or $a0, $s0, $0
	jal abso
	bge $t0, $v0, endfor
	
	ble $s0, 0, else
	mul.d $f4, $f4, $f20
	j endif
	
else:
	div.d $f4, $f4, $f20
	
endif:
	addi $t0, $t0, 1 # i++;
	j for
	
endfor:
	mov.d $f0, $f4 # return result;
	lw $ra, 0($sp)
	lwc1 $f20, 4($sp)
	lwc1 $f21, 8($sp)
	lw $s0, 12($sp)
	addi $sp, $sp, 16
	jr $ra
	
abso:
	or $v0, $a0, $0
	bge $a0, 0, endifabs # if(val < 0)
	sub $v0, $0, $a0 # val = -val;
	
endifabs:
	# return val;
	jr $ra
