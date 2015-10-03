.text
.globl main
main:	ori $v0, $0, 5
	syscall
	or $t0, $0, $v0
	ori $t1, $0, 8
	add $t2, $t0, $t0
	sub $t2, $t2, $t1
	or $a0, $0, $t2
	ori $v0, $0, 36
	syscall