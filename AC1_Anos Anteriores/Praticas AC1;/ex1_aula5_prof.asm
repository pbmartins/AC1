#Exercício1a)_Aula5_Prof;
#Lê 5 valores da consola e armazena-os no array "lista"
		
		.include "tp3_macros.asm"
		.eqv SIZE,5
		.data
		
lista:		.word 0:SIZE			#reserva espaço e inicializa a 0;
str:		.asciiz "Introduza um número: "

		.text
		.globl main
		
main:	
#$t0=i; $t2=i*4; $v0=value;
		li $t0,0			#i=0
		
for_lp1:	bge $t0,SIZE,ex_for		#if(i>SIZE)

		print_str(str)
		read_int			#$v0=value
		
		sll $t2,$t0,2			#$t2=byte_idx=4*i
		sw $v0,lista($t2)		#lista[i]=read_int();
		
		addi $t0,$t0,1			#i++
		b for_lp1
		
ex_for:		done
