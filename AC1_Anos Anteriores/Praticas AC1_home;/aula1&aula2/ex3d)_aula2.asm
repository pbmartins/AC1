#Exercício3d)_Aula2_home;
#Impressão de strings e soma de valores!

#Funciona!

#Dúvida:
#Porquê usar $a0 para guardar o valor da soma dos 2 números e não uma variável temporária, por exemplo, $t3?
	
	.data
	
str1:	.asciiz "Introduza 2 números:\n"
str2:	.asciiz "A soma dos 2 números é: "

	.text
	.globl main
	
main:
	#$t0 = a; $t1 = b;

	#print_str(str1)
	li $v0,4
	la $a0,str1
	syscall
	
	#read_int($t0)
	li $v0,5
	syscall
	move $t0,$v0		#lê primeiro o valor e só depois é que o coloca em $t0!
	
	#read_int($t1)
	li $v0,5
	syscall
	move $t1,$v0		#lê primeiro o valor e só depois é que o coloca em $t1!
	
	#print_str(str2)
	li $v0,4
	la $a0,str2
	syscall
	
	add $a0,$t1,$t0		#$a0 = $t0 + $t1 ($a0 = a + b);
	#porquê $a0? não podia ser uma temporária? $t3?
	
	#print_int10($t3)
	li $v0,1
	#move $t3,$v0
	syscall
	
	jr $ra
	
