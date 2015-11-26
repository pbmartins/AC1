.data
str: .space 20 # static char str[20]
str1: .asciiz "Introduza uma string:\n"

.text
.globl main
main:
	# print_str("Introduza uma string: ")
	ori $v0, $0, 4
	la $a0, str1
	syscall
	
	# read_str(str, 20)
	ori $v0, $0, 8
	la $a0, str # Buffer
	ori $a1, $0, 20 # size of array of char
	syscall
	
	la $t0, str # p = str
	
whileloop:
	lb $t1, 0($t0) # $t1 = *p
	bgt $t1, 0x20, loopbody # *p >= 'space'
	j endloop
	
loopbody:
	sge $t2, $t1, 0x61 # *p >= 'a'
	sle $t3, $t1, 0x7A # *p <= 'z'
	and $t4, $t2, $t3 # *p >= 'a' && *p <= 'z' 
	beq $t4, 1, ifchange # if (*p >= 'a' && *p <= 'z')
	
	j addpointer
	
ifchange:
	# *p = *p – 'a' + 'A'
	subiu $t1, $t1, 0x61
	addiu $t1, $t1, 0x41
	
	# store the value to string register
	sb $t1, 0($t0)
	
	j addpointer

addpointer:
	addiu $t0, $t0, 1 # p++
	j whileloop
	
endloop:
	# print_str(str)
	la $a0, str
	ori $v0, $0, 4
	syscall 
	
	jr $ra
	
	
