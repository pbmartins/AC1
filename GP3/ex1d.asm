.data
str1: .asciiz "Introduza um numero:\n"
str2: .asciiz "\nO valor em binario: "
space: .asciiz " "

.text
.globl main
main:	la $a0, str1
	ori $v0, $0, 4
	syscall
	
	ori $v0, $0, 5
	syscall
	or $s0, $0, $v0
	
	la $a0, str2
	ori $v0, $0, 4
	syscall
	
	# $s0 = value
	# $t1 = i
	# $t2 = 31
	# $t3 = bit
	# $t4 = 4bit counter
	# $t5 = 4
	# $t6 = boolean value (1 or 0)
	
	ori $t1, $0, 0
	ori $t2, $0, 32
	ori $t4, $0, 1
	ori $t5, $0, 4
	ori $t6, $0, 0
for:	beq $t1, $t2, exit

	# Set to print char
	ori $v0, $0, 11
	
	andi $t3, $s0, 0x80000000
	srl $t3, $t3, 31
	or $t6, $t6, $t3
	ori $t3, $t3, 48
	
	beq $t6, $zero, shift
	or $a0, $t3, $0
	syscall
	ori $t6, $0, 1
	
shift:	sll $s0, $s0, 1

	beq $t4, $t5, psp
	j addlp

psp:	ori $t4, $0, 0
	beq $t6, $zero, addlp
	la $a0, space # print space
	ori $v0, $0, 4
	syscall

addlp:	addi $t1, $t1, 1
	addi $t4, $t4, 1
	j for

exit:	jr $ra
