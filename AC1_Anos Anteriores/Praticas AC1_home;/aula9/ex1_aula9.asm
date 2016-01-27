#Exercício1_Aula9_home;
#Função de contagem do número de caracteres de uma string;
#RECURSIVIDADE;

#


		.data
str:		.asciiz "String de teste"
str1:		.asciiz "O comprimento da string é: "		
		.text
		.globl main
		
main:
		addiu $sp,$sp,-4
		sw $ra,0($sp)
		
		#print_str(str1)
		li $v0,4
		la $a0,str1
		syscall
		
		la $a0,str
		jal strlen
		
		#print_int10(strlen(str))
		move $a0,$v0
		li $v0,1
		syscall		
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		
		jr $ra
		
strlen:
		#$a0 = *s;
		addiu $sp,$sp,-4
		sw $ra,0($sp)
		
if:		
		beq $a0,'\0',else
		li $v0,1			#return 1
		jal strlen
		
	