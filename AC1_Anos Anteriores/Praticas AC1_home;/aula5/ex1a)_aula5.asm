#Exercício1a)_Aula5_home;
#Lê 5 valores da consola e armazena-os no array "lista"
#Programa feito com índices!

#Funciona!

	.data

lista:	.space 20 		#(5*4=20);
	.align 2
			
str:	.asciiz "Introduza um número: "

	.text
	.globl main
	
main:
	#$t0 = i; $t1 = i*4; $t2 = valor teclado;
	
	li $t0,0		#i=0;
	
while:
	bge $t0,5,exit		#while(i<size)
	
	#print_str(str)
	li $v0,4
	la $a0,str
	syscall
	
	#read_int($t2)
	li $v0,5
	syscall
	move $t2,$v0		#não era preciso esta linha, no entanto, o código funciona na mesma!
	
	sll $t1,$t0,2		#$t1 = i * 4;
	sw $v0,lista($t1)	#lista[i] = read_int();
	
	addi $t0,$t0,1		#i++;
	
	j while
	
exit:
	jr $ra
	
	
