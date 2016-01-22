#Exercício3_Aula6_home;
#Define 3 strings e imprime-as caracter a caracter (usando índices);
##Ter em atenção a linha 23, onde o tamanho usado é o SIZE*4;

#Não funciona!
#Imprime apenas String#0: A-


		.data
		.eqv SIZE,3
		
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
	#$t0=i; $t1=j; $t2=array[i][j]; $a0=array[i];
	
		li $t0,0			#i=0;
		
for:
		bge $t0,SIZE,end_for		#i>=SIZE;
		
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
		
		sll $t2,$t0,2			#$t2=i*4;
		lw $a0,array($t2)		#$a0=array[i];
		li $t1,0			#j=0;
		
while:	
		
		addu $a1,$a0,$t1		#$a1=array[i]+j;
		lb $t2,0($a1)			#$t2=array[i][j];
		
		beqz $t2,end_while
		
		#print_char($t5)
		li  $v0,11
		move $a0,$t2
		syscall
		
		#print_char('-')
		li $a0,'-'
		li $v0,11
		syscall
		
		addi $t1,$t1,1			#j++;
		j while
		
end_while:
		addiu $t0,$t0,1			#i++;
		j for		
end_for:
		jr $ra
		
