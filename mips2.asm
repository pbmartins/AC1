.text
.globl main
main:
	li $a0, 3

fact:
	li $t0, 1
	li $v0, 1
	
for:
	bgt $t0, $a0, endfor
	mul $v0, $v0, $t0
	addi $t0, $t0, 1
	j for
	
endfor:
	jr $ra