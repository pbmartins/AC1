#Exercício2a)_Aula5_home;
#Feito antes da aula5;
#Envia para o ecrã o conteúdo de um array de 10 inteiros

#Funciona!

		.data
lista:		.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
str1:		.asciiz "Conteúdo do array: "
str2:		.asciiz " , "

		.text
		.globl main
		
main:
	#$t0=p; $t1=i; $t2=*p
	
		la $t0,lista
		li $t1,0
	
		#print_str(str1)
		li $v0,4
		la $a0,str1
		syscall
	
for:
		bge,$t1,10,exit		#while(i<size)
		
		lw $t2,0($t0)		#$t0 = p = lista = *p = $t2
		
		#print_int10($t2)
		li $v0,1
		move $a0,$t2
		syscall

		#print_str(str2)
		li $v0,4
		la $a0,str2
		syscall
		
		addiu $t0,$t0,4		#p++; (4, porque é um inteiro e o próximo inteiro só aparece 4 espaços à frente)
		addi $t1,$t1,1		#i++;
		j for
	
exit:
		jr $ra
		
