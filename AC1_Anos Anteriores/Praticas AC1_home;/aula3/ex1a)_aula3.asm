#Exerc�cio1a)_Aula3_home;
#Passar um n�mero decimal para um n�mero bin�rio;

#Funciona!
	
	.data
	
str1:	.asciiz "Introduza um n�mero: "
str2: 	.asciiz "O n�mero em bin�rio: "	

	.text
	.globl main
	
main:
	#$t0 = value; $t1 = bit; $t2 = i;
	
	li $t2,0		#i=0;
	
	#print_str(str1)
	li $v0,4
	la $a0,str1
	syscall
	
	#read_int($t0)
	li $v0,5
	syscall
	move $t0,$v0
	
	#print_str(str2)
	li $v0,4
	la $a0,str2
	syscall
	
while:
	bge $t2,32,exit
	
	andi $t1,$t0,0x80000000
	
	beqz $t1,bit_is_zero
	
	li $v0,11		#print_char('1')
	li $a0,'1'		
	syscall
	
	j end_if
	
bit_is_zero:
	li $v0,11		#print_char('0')
	li $a0,'0'		
	syscall
	
end_if:
	sll $t0,$t0,1
	addi $t2,$t2,1
	j while
	
exit:
	jr $ra