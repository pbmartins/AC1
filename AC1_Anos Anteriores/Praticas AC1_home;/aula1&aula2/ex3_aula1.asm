#Exercício3_Aula1_home;
#Funciona!
#dúvida no read_int();
	
	.data
	
str1:	.asciiz "Introduza um número: "
str2: 	.asciiz "O resultado obtido é: "

	.text
	.globl main
	
main:
	#print_str1
	li $v0, 4
	la $a0,str1
	syscall
	
	#read_int
	li $v0, 5
	syscall			#porque é preciso fazer a syscall antes de mover o valor?
	move $t0,$v0

	ori $t2,$0,8
	add $t1,$t0,$t0
	sub $t1,$t1,$t2
	
	#print_str2
	li $v0,4
	la $a0,str2
	syscall
	
	#print_int
	li $v0,1
	move $a0,$t1
	syscall
	
	jr $ra
	
