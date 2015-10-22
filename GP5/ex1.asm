.data
array: .word 0:5 # static int lista[SIZE]
str: .asciiz "\nIntroduza um numero: "

.text
.globl main
main:
	move $t0, $0 # int i = 0
	la $t1, array # $t1 = &array
	
forloop:
	blt $t0, 20, loopbody
	j endloop
	
loopbody:
	# print_str("\nIntroduza um numero:");
	la $a0, str
	ori $v0, $0, 4
	syscall
	
	# read_int()
	ori $v0, $0, 5
	syscall
	
	# lista[i] = read_int() 
	add $t2, $t0, $t1
	sw $v0, 0($t2)
	
	addiu $t0, $t0, 4 # i++
	
	j forloop
	
endloop:
	jr $ra