#Exercício2a)_Aula3_home;
#Imprimir um número decimal em hexadecimal;

#Funciona!
#Dúvidas!!!

	.data
	
str1:	.asciiz "Introduza um número: "
str2: 	.asciiz "\nO valor em hexadecimal: 0x"

	.text
	.globl main
	
main:
	#$t0 = value; $t1 = i; $t2 = digito;
	
	#print_str(str1)
	li $v0,4
	la $a0,str1
	syscall
	
	#read_int($t0)
	li $v0,5
	syscall
	move $t0,$v0
	
	#print_str(str2)
	li $v0,4
	la $a0,str2
	syscall
	
	li $t1,8		#i=8;
	
while:
	andi $t3,$t0,0xF0000000		#$t3 = value & 0xF0000000;
	bnez $t3,do_while		#$t3 = value & 0xF0000000 != 0;
	beqz $t1,do_while		#$t1 = i <= 0;	#beqz porquê?(resolução do prof)
	
	sll $t0,$t0,4			#value = value << 4;
	subi $t1,$t1,1			#i--;
	
	j while
	
do_while:
	addi $t3,$t0,0xF0000000		#$t3 = value & 0xF0000000;
	srl $t2,$t3,28			#digito = (value & 0xF00000000) >> 28
	bgt $t2,9,greater_9		#if(digito<9)
	
	add $t4,$t2,'0'			#$t4 = dígito + '0'
	j next_value
	
greater_9:
	add $t4,$t2,'0'			#$t4 = dígito + '0'
	addi $t4,$t4,7			#$t4 = dígito + '0' + 7
	
next_value:
	#print_char($t4)
	li $v0,11
	move $a0,$t4
	syscall

	sll $t0,$t0,4			#value = value << 4
	sub $t1,$t1,1			#i--;
	
	bnez $t1,do_while		#while(i>0); #bnez porquê? (resolução prof)
	
exit:
	jr $ra	
	

	
