#Exercício6b)_Aula9
#Cálculo de x^y recursivamente;

#PROF;

#Funciona!


			.include "tp3_macros.asm"
			.data
str:			.asciiz "O valor de x^y é: "
			.text
			.globl main
			
main:
			addiu $sp,$sp,-4
			sw $ra,0($sp)
			
			print_str(str)
			
			li $a0,-5			#x = -5
			li $a1,7			#y = 7
			jal xtoy
			
xtoy_ret:
			#print result
			move $a0,$v0
			print_int
			
			lw $ra,0($sp)
			addiu $sp,$sp,4
			jr $ra
			
			
xtoy:
			#int x; unsigned int y;
			addiu $sp,$sp,-4
			sw $ra,0($sp)
			#não é preciso usar o registo $s0 porque o valor de x nunca vai ser mudado;
			
			bnez $a1,else				#if(y!=0) else
			li $v0,1				#$v0 = 1 => return 1
			j xtoy_ex				#exit
			
else:
			addiu $a1,$a1,-1			#y-1
			jal xtoy				#xtoy(x,y-1)
			
			mul $v0,$a0,$v0				#x * xtoy(x, y-1)
xtoy_ex:
			lw $ra,0($sp)
			addiu $sp,$sp,4
			jr $ra