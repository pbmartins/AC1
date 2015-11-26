.text
.globl main
main:	ori $t0, $0, 0x12345678
	ori $t1, $0, 28
	ori $t2, $0, 0xF0000000

loop:	bltz $t1, exit
	and $t3, $t0, $t2
	srlv $a0, $t3, $t1
	ori $v0, $0, 34
	syscall
	ori $a0, $0, 0x0000000A
	ori $v0, $0, 11
	syscall
	subi $t1, $t1, 4
	srl $t2, $t2, 4
	j loop
	
exit: 	li $v0, 10
	syscall
	jr $ra