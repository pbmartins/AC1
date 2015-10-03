.text
.globl main
main:	ori $t0, $0, 0x862A5C1B
	ori $t1, $0, 4
	sllv $t2, $t0, $t1
	srlv $t3, $t0, $t1
	srav $t4, $t0, $t1