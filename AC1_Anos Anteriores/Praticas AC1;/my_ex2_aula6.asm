#Exercício2_Aula6
#Define 3 strings e imprime-as (usando ponteiros);
#Ter em atenção a linha 23, onde o tamanho usado é o SIZE*4;

#Funciona!

		.data
		
str1:		.asciiz "Array"
str2:		.asciiz "de"
str3:		.asciiz "ponteiros"

array:		.word str1, str2, str3
		.align 2
		
		.text
		.globl main
		
main:
	#$t0=i; $t1=p; $t2=pultimo; $t3=*p; $t4=**pultimo;
	
		la $t1,array		#$t1 = p = array;
		addi $t2,$t1,12		#pultimo = array + 12; $t2(pultimo) = $t1(array) + 12 (SIZE*4); 
		
for:	
		bge $t1,$t2,exit	#while(p<pultimo)
		
		lw $a0,0($t1)
		
		#print_str()
		li $v0,4
		syscall
		
		#print_char('\n')
		li $a0,'\n'
		li $v0,11
		syscall
		
		addi $t1,$t1,4		#p++;
		
		j for
		
exit:
		jr $ra
		