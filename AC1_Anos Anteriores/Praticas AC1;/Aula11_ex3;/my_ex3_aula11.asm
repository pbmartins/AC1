#Exercício3_Aula11
#Calcular a variância e o desvio padrão dos elementos de um array;
#PROF;

#Não funciona! ACABAR!!!


		.include "tp3_macros.asm"
		.data
		.eqv SIZE,11
		.align 3
d_A:		.double 8.0,-4.0,3.0,5.0,12.0,-15.0,87.0,9.0,27.0,15.0,35.0
s_hdr:		.asciiz "Introduza 11 inteiros: "
s_A_F:		.asciiz "O array de temperaturas ºF é: "
s_A_C:		.asciiz "O array de temperaturas ºC é: "
s_TMax:		.asciiz "\nA temperatura máxima (ºC): " 
s_TAvg:		.asciiz "\nA temperatura média (ºC): "
s_TMed:		.asciiz "\nA temperatura mediana (ºC): "
s_Vari: 	.asciiz "\nA variância térmica (ºC): "
s_StdDev:	.asciiz "\nO desvio padrão térmico (ºC): "

d_const_0:	.double 0.0
		.text
		.globl main
		
main:
		addiu $sp,$sp,-8			#reserva espaço na stack para $ra e $s0;
		sw $ra,0($sp)				#guarda $ra
		sw $s0,4($sp)				#guarda $s0
		
		#j j_ler

		print_str(s_hdr)
		li $t0,0
	
rd_lp:
		bge $t0,SIZE,rd_ex
		read_int($t1)
		mtc1 $t1,$f6
		cvt.d.w $f6,$f6
		
		sll $t1,$t0,3
		s.d $f6,d_A($t1)
		
		addi $t0,$t0,1
		b rd_lp
		
rd_ex:
		la $a0,d_A				#$a0 = array;
		move $s0,$a0				#guarda $a0
		li $a1,SIZE				#$a1 = SIZE = 11; 
		
		print_str(s_A_F)
		move $a0,$s0
		jal d_print				#falta fazer!
		
		li $t0,0

cv2c_for:
		bge $t0,SIZE,cv2c_ex
		
		sll $t1,$t0,3
		l.d $f12,d_A($t1)
		jal f2c
		
		s.d $f0,d_A($t1)
		
		addiu $t0,$t0,1
		b cv2c_for
		
cv2c_ex:
		#Print ºC array
		print_str(s_A_C)
		la $a0,d_A
		li $a1,SIZE
		jal d_print
		
		#Temperatura Máxima
		print_str(s_TMax)
		la $a0,d_A
		li $a1,SIZE
		jal max
		
		mov.d $f12,$f0
		
		#print_double
		mov.d $f12,$f0
		li $v0,3
		syscall
		
		#Temperatura Média
		print_str(s_TAvg)
		la $a0,d_A
		li $a1,SIZE
		jal media
		
		#Temperatura Mediana
		#print_str(s_TMed)
		#la $a0,d_A
		#li $a1,SIZE
		#jal mediana
		
		#Variância Térmica
		print_str(s_Var)
		la $a0,d_A
		li $a1,SIZE
		jal var
		
		#Desvio Padrão
		print_str(s_StdDev)
		la $a0,d_A
		li $a1,SIZE
		jal stddev
		
		lw $ra,0($sp)				#restaura $ra
		lw $s0,4($sp)				#restaura $s0
		addiu $sp,$sp,8				#liberta espaço na stack;
		jr $ra
		
						
j_ler:		

		
		#print_str(str)
		#move $a0,$s0
		#falta fazer o print do array inicial!
			
		#jal d_avg				#result in $f0
		
#		print_str(str1)
		
#		mov.d $f12,$f0				#passa para $f12 o valor de $f0 para fazer a syscall;
		#print_double		
#		li $v0,3
#		syscall
		
#		li $v0,0				#return 0
	
		
##		
var:
		#double *array; int nval;
		#int i = $s1; double media = $f2; double soma = $f4; double res = $f6;
		
		addiu $sp,$sp,-16
		sw $ra,0($sp)
		sw $s0,4($sp)
		sw $s1,8($sp)
		sw $s2,12($sp)
		
		move $s0,$a0			#guarda A
		move $s1,$a1			#guarda nval
		jal average
						#$f0 = average
		mov.d $f6,$f0
		l.d $f4,d_const_0		#sum = 0.0
		li $s2,0			#i=0
		
var_for:
		bge $s2,$s1,var_ex		#if(i >= SIZE)
		
		sll $t0,$s2,3			#
		addu $t0,$s0,$t0		#&A[i]
		
		l.d $f12,0($t0)			#A[i]
		sub.d $f12,$f12,$f6		#A[i] - media	
		li $a0,2			
						#double xtoy(double x, int y)
		jal xtoy
						#soma += xtoy(A[i] - media, 2);
		add.d $f4,$f4,$f0
		
		addiu $s2,$s2,1			#i++;
		b var_for
		
var_ex:
		mtc1 $s1,$f8			#nval
		cvt.d.w $f8,$f8			#nval -> double
		div.d $f0,$f4,$f8		#res = soma / nval;
	
		lw $ra,0($sp)			
		lw $s0,4($sp)
		lw $s1,8($sp)
		lw $s2,12($sp)
		addiu $sp,$sp,-16
		
		jr $ra
		
stddev:
		addiu $sp,$sp,-4
		sw $ra,0($sp)
						#double var(double *A, int nval);
		jal var
		
		mov.d $f12,$f0
						#double sqrt(double val);
		jal sqrt
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		jr $ra
		
d_print:
		addiu $sp,$sp,-4
		sw $s0,0($sp)
		move $s0,$a0			#save A
		
		li $t0,0			#i=0
		move $t2,$a0			#p = A
		
pr_for_lp:
		bge $t0,$a1,pr_ex		#if (i >= len)
		
		l.d $f12,0($t2)			#print_double(*p)
		
		#print_double
		mov.d $f12,$f0	
		li $v0,3
		syscall
		
		print_char(',')
		  	
		addiu $t2,$t2,8			#p++(double = 8 bytes)
		addiu $t0,$t0,1			#i++
		b pr_for_lp
		
pr_ex:
		move $a0,$s0			#restore A
		lw $s0,0($sp)
		addiu $sp,$sp,4
		
		jr $ra
