		
		.include "tp3_macros.asm"
		.data
	
lista:		.space 40 		#reserva 10 espaços (4*10 = 40);

str1:		.asciiz "Introduza um número inteiro: "
str2:		.asciiz "\nArray ordenado: "
str3: 		.asciiz " , "

		.text
		.globl main
		
main:		
	#$t0=i; $t1=p; $t2=lista; $t3=lista[i]; $t4=temp; $t5=aux; $t6=houveTroca;
	#$t7=j; $t8=k;
	#$v0=valor lido do teclado; 
		
		la $t1,lista		#carrega o endereço da lista para $t1
		li $t0,0		#i=0;
		li $t7,0		#j=0;
		li $t8,0		#k=0;
		
while_ins:	
		
