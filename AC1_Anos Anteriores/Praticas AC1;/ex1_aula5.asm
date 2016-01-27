#Exercício1a)_Aula5;

#Feito antes da aula5;
#Funciona!
	
	.include "tp3_macros.asm"
	.data

lista:	.space 20		#armazena 5 espaços no array (5*4 = 20)
	.align 2		#garante que o endereço inicial do array é múltiplo de 4
	
str: 	.asciiz "Introduza um número: "

	.text
	.globl main
	
main:	
	#$t0=i; $t1=lista; $t2=lista[i]; $v0=valor lido do teclado;

	#la $t1,lista		#carrega o endereço da lista para $t1
	
	li $t0,0		#inicializa i=0;
	
	
while:	bge $t0,5,end		#branch if greater or equal
				#while(i<size){
	
	print_str(str)		
	read_int()
	
	sll $t2,$t0,2		#temp = i * 4;
	#addu $t3,$t2,$t3	#temp = &(lista[i]);
	
	sw $v0,lista($t2)		#lista[i]=read_int();
				
	addi $t0,$t0,1		#i++;
				#
	j while			#}

end:	done	
	
