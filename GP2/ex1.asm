.text
.globl main
main:	ori $t0, $0, 0xF5A30614
	ori $t1, $0, 0x89D5A3E4
	and $t2, $t0, $t1
	or $t3, $t0, $t1
	nor $t4, $t0, $t1
	xor $t5, $t0, $t1
	ori $t6, $0, 0
	nor $t7, $t0, $t6