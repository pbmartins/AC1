.text
.globl main
main:	ori $t0, $0, 2
	ori $t2, $0, 8
	add $t1, $t0, $t0
	add $t1, $t1, $t2
	jr $ra