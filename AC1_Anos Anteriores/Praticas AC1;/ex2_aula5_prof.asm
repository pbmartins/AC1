#Exerc�cio2a)_Aula5_Prof;
#Envia para o ecr� um array de 10 inteiros, previamente inicializado, declara espa�o para um array de inteiros de 10 posi��es e inicializa-o
#com os valores especializados;
		
		.include "tp3_macros.asm"
		.eqv SIZE,10
		.data
		
lista:		.word 8,-4,3,5,124,-15,87,9,27,15
str:		.asciiz "\nConte�do do array:\n"
str1:		.asciiz " , "

		.text
		.globl main
		
main:
#$t0=i; $t2=i*4; $v0=value
		print_str(str)
		li $t0,0			#i=0
		la $t2,lista			#p=lista
		
for_lp1:	
		bge $t0,SIZE,ex_for		#if(i>=SIZE)
		
		lw $a0,0($t2)			#print_int10(*p)
		
		print_int			#$a0=int to print
		print_str(str1)			
		
		addiu $t2,$t2,4			#p++
		addiu $t0,$t0,1			#i++
		
		j for_lp1
		
ex_for:		done
