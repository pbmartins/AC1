.data
lista:	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15 # static int lista[]={8, -4, 3, 5, 124, -15, 87, 9, 27, 15}
str: .asciiz "\nConteudo do array:\n"

.text
.globl main
main:
	# int *p; ($t0)
	# int i;  ($t1)
	
	la $t0, lista # p = lista
	
	# print_str("\nConteudo do array:\n");
	la $a0, str
	ori $v0, $0, 4
	syscall
	
	move $t1, $0 # i = 0
	
forloop:
	blt $t1, 10, loopbody # i < SIZE
	j endloop
	
loopbody:
	# print_int10( *p )
	ori $v0, $0, 1
	lw $a0, 0($t0)
	syscall
	
	# print_str("-")
	ori $v0, $0, 11
	ori $a0, $0, 45
	syscall
	
	addi $t0, $t0, 4 # p++
	addi $t1, $t1, 1 # i++ 
	
	j forloop
	
endloop:
	jr $ra
