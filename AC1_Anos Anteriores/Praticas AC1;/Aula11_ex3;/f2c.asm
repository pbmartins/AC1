#Exercício2b_Aula10;
#Programa que converte uma temperatura em graus Fahrenheit para graus Celsius;

#Funciona!

			.include "tp3_macros.asm"
			.data
k1:			.double 32
str: 			.asciiz "Introduza uma temperatura em graus Fahrenheit: "
str1:			.asciiz "A temperatura em Celsius é: "		
			.text
			.globl f2c
			
main:	
			#$f12 = val;
#			addiu $sp,$sp,-4
#			sw $ra,0($sp)
			
#			print_str(str)
			
			#read_double($t0)
#			li $v0,7
#			syscall
#			mov.d $f12,$f0
#			jal f2c
			
#			print_str(str1)
			
			#print_double(res)
#			mov.d $f12,$f0
#			li $v0,3
#			syscall
			
#			lw $ra,0($sp)
#			addiu $sp,$sp,4
#			jr $ra
			
f2c:
			#poderia considerar-se o 5 e o 9 como parâmetros double no topo do programa;
			li $t0,5			#$t0 = 5;
			li $t1,9			#$t1 = 9;
			
			mtc1 $t0,$f4			#$f4 = 5;
			cvt.d.w $f4,$f4			#converte o 5(Integer) para Double;
			
			mtc1 $t1,$f6			#$f6 = 9;
			cvt.d.w $f6,$f6			#converte o 9(Integer) para Double;
			
			div.d $f6,$f4,$f6		#$f6 = $f4 / $f6 = 5/9;
			
			l.d $f8,k1			#$f8= 32;
			
			sub.d $f8,$f12,$f8		#$f8 = (double) val - 32;
			mul.d $f0,$f6,$f8		#$f0 = 5/9 * ((double) val - 32);

			jr $ra
