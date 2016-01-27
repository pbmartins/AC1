	.include "tp3_macros.asm"
	.data
	
str:	.space 20
str1:	.asciiz "Introduza uma string (comp <20): "
str2:	.asciiz "O número de caracteres numéricos na string: "

	.text
	.globl main
	
main:	
	print_str(str1)
	read_str(str, 20)
	#$t0 = num; $t1 = i; $t2 = str; $t3 = str[i]
	
	li $t0,0		#num=0
	li $t1,0		#i=0
	#la $t2,str		
	
while_loop:
	#while (str[i] != '\0')
	lb $t3,str($t1)		#$t3 = str[i]
	beqz $t3,w_end
	#if ((str[i] >= '0') && (str[i] <= '9'))
	bltu $t3,'0',not_dig		#if (str[i] < '0')
	bgtu $t3, '9', not_dig		#if (str[i] > '9')
	addi $t0,$t0,1			#num++
	
not_dig:

	addi $t1,$t1,1			#i++
	j while_loop
	
w_end:

	print_str(str2)			
	print_int($t0)			#print_int10(num);
	
exit:	done