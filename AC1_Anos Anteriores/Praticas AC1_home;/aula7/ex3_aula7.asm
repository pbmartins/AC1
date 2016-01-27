#Exercício3_Aula7_home;
#Função strcpy();
#Copia uma string residente numa zona de memória para outra zona de memória;

#

		.data
str:		.asciiz "String de teste"	
		.text
		.globl main
	
		
strcpy:
		addiu $sp,$sp,-8
		sw $ra,0($sp)
		sw $s0,4($sp)
		
		li $t0,0			#i=0;
		
do:
		
		
			