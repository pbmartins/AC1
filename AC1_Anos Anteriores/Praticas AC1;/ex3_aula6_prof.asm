#Exercício3_Aula6_prof
#Define 3 strings e imprime-as caracter a caracter (usando índices);

		.include "tp3_macros.asm"
		.data
		
str1:		.asciiz "Array"
str2:		.asciiz "de"
str3:		.asciiz "ponteiros"
str4:		.asciiz "\nString #"
str5:		.asciiz ": "

array:		.word str1, str2, str3
		.align 2
		
		.text
		.globl main
		
main:
		#$t0=i; $t1=i*4; $t2=array; $t3=j; $a1=array[i];
		li $t0,0			#i=0
		
for_lp1:
		bge $t0,3,end_for		#if(i<SIZE)
		sll $t2,$t0,2			#$t2 = i * 4;
		
		print_str(str4)
		print_int($t0)
		print_str(str5)
		
		lw $a1,array($t2)		#$a1 = array[i];
		
		li $t3,0			#j=0;
		
w_lp1:	
		addu $a2,$a1,$t3		#$a2 = array[i] + j
		lb $t1,0($a2)			#$t1 = array[i][j]
		beqz $t1,w_exit			
		
		
		print_char_reg($t1)		#print_char(array[i][j])
		print_char('-')			
		#li $a0,'-'
		#li $v0,11
		#syscall
		
		addiu $t3,$t3,1			#j++;
		b w_lp1				#
		
w_exit:
		addiu $t0,$t0,1			#i++;
		b for_lp1
		
end_for:
		done
