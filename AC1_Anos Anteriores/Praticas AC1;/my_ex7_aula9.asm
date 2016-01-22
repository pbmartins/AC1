#Exercício7_Aula9
#Problema das Torres de Hanoi usando recursividade;

#usar a função print_int_ac1;

#....

#


			.include "tp3_macros.asm"
			.data
str:			.asciiz "\nIntroduza o número de discos: "
str1: 			.asciiz "\n"
str2: 			.asciiz " - Mover disco de topo de "
str3: 			.asciiz " para "
			.text 
			.globl main
			
main:
			#int ndiscs;
			#$t0=ndisc;
			
			print_str(str)
			
			#read_int($t0)
			li $v0,5
			syscall
			move $t0,$v0
			
			blez $t0,endif			#if(ndiscs <= 0)
			
			#tohanoi(ndiscs,1,3,2);
			#???
			
			jr $ra
			
endif:
			li $v0,0			#return 0;
			jr $ra
		
print_msg:
			#int t1, int t2, int cnt
			
			print_str(str1)
			
			#print_int_ac1(cnt,10)
			##
			print_str(str2)
			
			#print_int_ac1(t1,10)
			##
			
			print_str(str3)
			
			#print_int_ac1(t2,10)
			##
