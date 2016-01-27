	.include "tp3_macros.asm"
	.data
str1:	.asciiz "Introduza um número para efectuar a operação pretendida: "
str2:	.asciiz "O resultado obtido é: "

	.text
	.globl main
main:
	#print_str(str1)
	li $v0,4
	la $a0,str1 	#%str_label = str1
	syscall
	
	#read_int($t0)
	li $v0,5
	syscall
	move	$t0,$v0 	#%rreg = $t0
	
	ori $t2,$0,8		#$t2 = 8;
	add $t1,$t0,$t0		#$t1 = x + x = 2*x;
	sub $t1,$t1,$t2		#st1 = 2*x - 8 = y;
	
	#print_str(str2)
	li $v0,4
	la $a0,str2 	#%str_label = str2
	syscall
	
	#print_int10u($t1) alínea d)
	#li $v0,36
	#move $a0,$t1
	#syscall
	
	#print_int16($t1) alínea c)
	#li $v0,34
	#move $a0,$t1
	#syscall
	
	#print_int($t1) alínea a)
	li $v0,1
	move $a0,$t1	#%sreg=$t1
	syscall
	
	jr $ra
	
	
