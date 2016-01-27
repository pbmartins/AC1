#Exercício2b_Aula8_home;
#Função itoa();
#Determina a representação do inteiro "n" na base "b" (2 e 16), colocando o resultado no array de caracteres "s" em ASCII;

#

		.data
str:		.asciiz "Introduza o número que quer representar: "
str1: 		.asciiz "Introduza em que base quer apresentar esse número (2 a 16): "
str2:		.asciiz "O número na base pedida é: "
		.text
		.globl main
		
main:
		addiu $sp,$sp-4
		sw $ra,0($sp)
		
		#print_str(str)
		li $v0,4
		la $a0,str
		syscall
		
		#read_int($a0)
		li $v0,5
		syscall
		move $v0,$a0
		
		#print_str(str1)
		li $v0,4
		la $a0,str1
		syscall
		
		#read_int($a1)
		li $v0,5
		syscall
		move $v0,$a1
		
		jal itoa
		
		#print_str(str3)
		li $v0,4
		la $a0,str3
		syscall
		
		#print_int($v0)
		move $a0,$v0
		li $v0,1
		syscall
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		jr $ra

toascii:
		#char v;
		#entrada: $a0 = char; saída: $v0 = v;  ->  ????
		
		addu $v0,$a0,'0'

if_toascii:
		ble $v0,'9',endif_toascii
		addiu $v0,$v0,7
		j if_toascii
		
endif_toascii:
		jr $ra			
						
itoa:
		#$a0=n; $a1=b; $a2=s; $0=res;
		
		addiu $sp,$sp,-12
		sw $ra,0($sp)
		sw $s0,4($sp)
		sw $s1,8($sp)
		
		move $s1,$a2			#$s1 = s;
		move $s0,$a0			#$s0 = n; 
		
do_itoa:
		
		
		
