#Exercício3c)_Aula2_home;
#Impressão de strings;

#Funciona!
	
	.data
str1:	.asciiz "So para chatear"
str2: 	.asciiz "AC1 - aulas praticas"

	.text
	.globl main
	
main:
	#print_str(str1)
	li $v0,4
	la $a0,str1
	syscall
	
	#print_char '\n'
	li $v0,11
	la $a0,'\n'
	syscall
	
	#print_str(str2)
	li $v0,4
	la $a0,str2
	syscall
	
	jr $ra
