#Exerc�cio1a)_Aula4_home;
#L� uma string do teclado, conta o n�mero de caracteres num�ricos e imprime esse resultado!
#Com �ndices;

#Funciona!

		.data
str:		.space 20
		.align 2
		
str1:		.asciiz "Introduza uma string (comp<20): "
str2:		.asciiz "N�mero de caracteres num�ricos da string: "

		.text
		.globl main
		
main:
		#$t0=num; $t1=i; $t2=str; $t3=str[i]; 
		
		
		#print_str(str1)
		li $v0,4
		la $a0,str1
		syscall 
		
		#read_str(str,20)
		li $v0,8
		la $a0,str
		la $a1,20
		syscall
		
		li $t0,0		#num=0;
		li $t1,0		#i=0;
		
while:
		lb $t3,str($t1)			#$t4 = str[i]
		beqz $t3,end			#str[i] == 0
		#beq $t3,'0',end ia fazer com que contasse sempre um caracter num�rico a mais!
		
		bltu $t3,'0',if			#str[i]<'0'
		bgtu $t3,'9',if			#str[i]>'9'
		
		addi $t0,$t0,1			#num++;
		
if:	
		addi $t1,$t1,1			#i++;
		j while
		
end:

		#print_str(str2)
		li $v0,4
		la $a0,str2
		syscall
		
		#print_10(num=$t0)
		li $v0,1
		move $a0,$t0
		syscall 
		
		jr $ra
