#Exerc�cio3_Aula7_home;
#Fun��o strcpy();
#Copia uma string residente numa zona de mem�ria para outra zona de mem�ria;

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
		
		
			