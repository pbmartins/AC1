#Exercício1_Aula8_home;
#Função atoi;
#Converte para um inteiro de 32 bits a quantidade representada por uma string numérica em que cada caracter representa o código
#ASCII de um dígito decimal (0-9). A conversão termina quando é encontrado um caracter não numérico;

#usar registos $tn ou $sn?

#Funciona!


		.data
str:		.asciiz "2040, o ano do fim das PPP"
		.text
		.globl main

main:
		addiu $sp,$sp,-4
		sw $ra,0($sp)
		
		la $a0,str			#$a0 = str;
		jal atoi
		
		#print_int10(atoi(str))
		move $a0,$v0
		li $v0,1
		syscall
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		jr $ra
						
atoi:
		#int digit, res=0;
		#$a0 = s; $s0 = res; $s1 = *s; $s2 = digit;
		
		li $s0,0			#res = 0;
		
while:

		lb $s1,0($a0)			#$t1 = *s;
		blt $s1,'0',endwhile
		bgt $s1,'9',endwhile
	
		subu $s2,$s1,'0'		#digit = *s++ - '0'		
		addiu $a0,$a0,1			#*s++;	

		mulu $s0,$s0,10			#res = 10 * res;
		addu $s0,$s0,$s2		#res = 10 * res + digit;			
		
		j while
		
endwhile:
		move $v0,$s0
		
		jr $ra
		