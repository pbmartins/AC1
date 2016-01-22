#Exerc�cio1b)_Aula3_home;
#Passar um n�mero decimal para um n�mero bin�rio;
#Imprimir com espa�o entre cada 4 bits;

#IFunciona!
	
	.data
	
str1:	.asciiz "Introduza um n�mero: "
str2: 	.asciiz "O n�mero em bin�rio: "	

	.text
	.globl main
	
main:
	#$t0 = value; $t1 = bit; $t2 = i;
	
	li $t2,0		#i=0;
	li $t3,1		#cont=1 (inicializar contador para fazer contagem a cada 4 bits e dar espa�o entre eles);
				#come�a a contar a partir do 1� bit!
	
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
	
while:
	bge $t2,32,exit
	
	andi $t1,$t0,0x80000000
	
	beqz $t1,bit_is_zero
	
	li $v0,11		#print_char('1')
	li $a0,'1'		
	syscall
	
	j end_if
	
bit_is_zero:
	li $v0,11		#print_char('0')
	li $a0,'0'		
	syscall
	
end_if:
	sll $t0,$t0,1		#value = value << 1;
	
end_if2:
	bne $t3,4,else2		#if(cont==4)
	li $t3,0		#cont = 0;
	
	#print_char(' ')
	li $v0,11
	li $a0, ' '
	syscall
	
	
else2:	addi $t3,$t3,1		#cont++;
	addi $t2,$t2,1		#i++;
	j while
	
exit:
	jr $ra