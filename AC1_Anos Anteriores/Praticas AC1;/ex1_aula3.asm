#Exercício 1a_Aula3
	.data
str1:	.asciiz "Introduza um número: "
str2:	.asciiz "O valor em binário: "

	.macro print_str(%str_label)
		li $v0,4
		la $a0,%str_label
		syscall
	.end_macro
		
	#returns 'int' in '$v0'
	.macro read_int(%rreg)
		li $v0,5
		syscall
		move	%rreg,$v0
	.end_macro
	
	.macro print_char(%char)
		li $v0,11
		li $a0, %char
		syscall
	.end_macro
	
	.macro done
		li $v0,10
		syscall
	.end_macro
	
	.text
	.globl main
main:	print_str(str1)
	read_int($t0)
	print_str(str2)
	
	li	$t2,0 	#i=0
	
for_loop1:	
	bge	$t2,32,exit		#if(i<=32)
	andi	$t1,$t0,0x80000000	#bit = value & 0x80000000
	
	beqz 	$t1,bit_is_zero		#if(bit==0)
	print_char('1')
	j	next_bit
	
bit_is_zero:
	print_char('0')
	
next_bit:
	sll	$t0,$t0,1		#value = value << 1
	
	addi	$t2,$t2,1		#i++
	j	for_loop1
	
exit:	done
	
