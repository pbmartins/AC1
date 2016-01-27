#Exercício2b)_Aula11
#Implementa o cálculo da raiz quadrada;

#Funciona!


		.include "tp3_macros.asm"
		.data
xn:		.double 1.0
xn1:		.double 0.5
xn2:		.double 0.0
str:		.asciiz "Introduza o valor do qual pretende calcular a raiz: "
str1:		.asciiz "O resultado é: "
		.text
		.globl sqrt
		
main:
#		addiu $sp,$sp,-4
#		sw $ra,0($sp)
		
#		print_str(str)
		
		#read_double()
#		li $v0,7
#		syscall
#		mov.d $f12,$f0
		
#		print_str(str1)
		
#		jal sqrt
		
		#print_double()
#		mov.d $f12,$f0
#		li $v0,3
#		syscall
		
#		lw $ra,0($sp)
#		addiu $sp,$sp,4
		
#		jr $ra
		
sqrt:
		#$f4 = xn = 1.0; $f6 = 0.0; $f8 = aux; $f10 = 0.5; $f12 = val; $f14 = xn(final);
		 
		l.d $f4,xn			#$f4 = 1.0;
		li $s0,0			#$s0 = i = 0;
		
		l.d $f6,xn2			#$f6 = 0.0;
		
if:		
		c.lt.d $f12,$f6			#$f12(val) < 0.0
		bc1f 0,do			#$f12(val) != 0.0
		mov.d $f0,$f6			#return 0.0;
		jr $ra
		
do:
		mov.d $f8,$f4			#$f8(aux) = xn = 1.0;
		l.d $f10,xn1			#$f10 = 0.5;
		div.d $f14,$f12,$f4		#$f14 = val/xn;
		add.d $f14,$f4,$f14		#$f14 = xn + val/xn;
		mul.d $f4,$f14,$f10		#$f4 = 0.5 * (xn + val/xn);
		
		c.eq.d $f8,$f4			#aux == xn
		bc1f 0,do			#se a condição em cima for false;
		
		addiu $s0,$s0,1			#i++
		bge $s0,25,do			#(++i <25)
		
while:
		mov.d $f0,$f4
		jr $ra
