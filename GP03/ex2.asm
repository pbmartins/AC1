.data
str1: .asciiz "Introduza um numero: "
str2: .asciiz "\nO valor em hexadecimal: "

.text
.globl main

main:
	# Print str1
	ori $v0, $0, 4 # set to print_str
	la $a0, str1
	syscall
	
	# Read value
	ori $v0, $0, 5 # set to read_int
	syscall
	or $t0, $v0, $0 # $t0 = value

	# Print str2
	ori $v0, $0, 4 # set to print_str
	la $a0, str2
	syscall
	
	ori $v0, $0, 11 # set to print_char
	
	ori $t5, $0, 8 # i = 8
	
whileloop:
	# Check the conditions od the while loop
	andi $t1, $t0, 0xF0000000 # value & 0xF0000000
	seq $t1, $t1, $zero # (value & 0xF0000000) == 0
	sgt $t2, $t5, $zero # i > 0
	and $t4, $t1, $t2 # (value & 0xF0000000) == 0 && i > 0
	beq $t4, 0, dowhileloop
	
	sll $t0, $t0, 4 # value = value << 4
	subi $t5, $t5, 1 # i--
	j whileloop

dowhileloop:
	andi $t1, $t0, 0xF0000000 # value & 0xF0000000
	srl $t1, $t1, 28 # digito = (value & 0xF0000000) >> 28
	ble $t1, 9, printchar # if(digito <= 9)
	j elseprintchar
	
printchar:
	addi $a0, $t1, 48 # print_char(digito + '0')
	syscall
	j enddowhileloop

elseprintchar:
	addi $a0, $t1, 55 # print_char(digito + '0' + 7)
	syscall
	j enddowhileloop

enddowhileloop:
	sll $t0, $t0, 4 # value = value << 4
	subi $t5, $t5, 1 # i--
	
	bgt $t5, 0, dowhileloop # while(i > 0)
	jr $ra