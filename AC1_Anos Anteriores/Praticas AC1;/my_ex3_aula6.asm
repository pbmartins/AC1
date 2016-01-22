#Exercício3_Aula6
#Define 3 strings e imprime-as caracter a caracter (usando índices);
#Ter em atenção a linha 23, onde o tamanho usado é o SIZE*4;

#Não funciona!

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
	#$t0=i; $t1=j;
		li $t0,0		#i=0;
		li $t1,0		#j=0;
		la $t3,array		#$t2 = array;
		
for:
		bge $t0,3,exit		#while(i<SIZE)
		
		#print_str(str4)
		li $v0,4
		la $a0,str4
		syscall
		
		#print_int10($t0)
		li $v0,1
		move $a0,$t0
		syscall
		
		#print_str(str5)
		li $v0,4
		la $a0,str5
		syscall
		
		sll $t2,$t0,2		#$t2 = i * 4;
		addu $t2,$t2,$t3	#$t3 = array + i * 4;
		lw $t4,0($t2)		#$t4 = array[i];
		addu $t5,$t4,$t1	#$t5 = array[i]+[j];	
		lw $t6,0($t5)		#$t6 = array[i][j];
		
while:
		beq $t6,'0',end_while	#while(array[i][j] != '\0')
		
		#print_char(array[i][j])
		la $a0,0($t6)
		li $v0,11
		syscall
		
		#print_char('-')
		li $a0,'-'
		li $v0,11
		syscall
		
		addi $t1,$t1,1		#j++;
		
		#addu $t5, $t4, $t1
		#lb $t6, 0($t5)
		
		j while
		
end_while:
		addi $t0,$t0,1		#i++;
		j for
		
exit:
		jr $ra
		
		
