#Exercício4_Aula6_prof
#Imprime os valores passados como argumento

		.include "tp3_macros.asm"
		.data
		
str1:		.asciiz "Nr. de parâmetros: "
str2:		.asciiz "\nP"
str3:		.asciiz ": "

		.text
		.globl main
		
main:
		#$a0 = argc; $a1 = argv; $t0 = i; $t2 = i*4;
		move $t1,$a0			#save $a0, used by syscalls!
		
		print_str(str1)
		print_int($t1)
		
		li $t0,0			#i=0
		
for_lp1:
		bge $t0,$t1,end_for		#if(i<argc)
		
		print_str(str2)
		print_int($t0)
		print_str(str3)
		
		sll $t2,$t0,2			#u$t2 =i * 4
		addu $a2,$a1,$t2		#locate: argv + i * 4
		lw $a0,0($a2)			#$a0 = argv[i] = s_i
		
		print_str_simple		#faz print de uma string sem parâmetros;
		
		addiu $t0,$t0,1			#i++;
		b for_lp1
		
end_for:
		done
