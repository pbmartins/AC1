#Exercício1_Aula6
#Define 3 strings e imprime-as (usando índices);

#Funciona!

		.data

array:		.word str1, str2, str3
		#.align 2
						
str1:		.asciiz "Array"
str2:		.asciiz "de"
str3:		.asciiz "ponteiros"


		
		.text
		.globl main
		
main:
	#$t0=i; $t1=array; $t2=array[i];
		li $t0,0		#i=0;
		la $t1,array		#$t1=array;
		
for:	
		bge $t0,3,exit
		
		#sll $t1,$t0,2		#$t1 = i * 4;
		lw $a0,0($t1)		#$a0 = array[i];
		
		#print_str(array[i])
		li $v0,4
		syscall
		
		#print_char('\n')
		li $a0,'\n'
		li $v0,11
		syscall
		
		addi $t1,$t1,4		#p++;
		addi $t0,$t0,1		#i++;
		
		j for
		
exit:
		jr $ra
		
