#Exercício3_Aula10;
#PROF;
#Função para calcular o valor médio de um array de reais codificados em formato de vírgula flutuante em precisão dupla;

#Funciona!


		.include "tp3_macros.asm"
		.data
		.eqv SIZE,11
array:		.double 8.1,-4.35,3.25,5.1,12.4,-15.0,87.45,9.5,27.3,15.8,35.19
k1:		.double 0.0
#str:		.asciiz "O array de doubles inicial é: "
str1:		.asciiz "\nO valor médio do array é: " 
		.text
		.globl media
		
main:
#		addiu $sp,$sp,-8			#reserva espaço na stack para $ra e $s0;
#		sw $ra,0($sp)				#guarda $ra
#		sw $s0,4($sp)				#guarda $s0
		
#		la $a0,array				#$a0 = array;
#		move $s0,$a0				#guarda $a0
#		li $a1,SIZE				#$a1 = SIZE = 11; 
		
		#print_str(str)
		#move $a0,$s0
		#falta fazer o print do array inicial!
			
#		jal d_avg				#result in $f0
		
#		print_str(str1)
		
#		mov.d $f12,$f0				#passa para $f12 o valor de $f0 para fazer a syscall;
		#print_double		
#		li $v0,3
#		syscall
		
#		li $v0,0				#return 0
#		lw $ra,0($sp)				#restaura $ra
#		lw $s0,4($sp)				#restaura $s0
#		addiu $sp,$sp,8				#liberta espaço na stack;
#		jr $ra

media:
		l.d $f0,k1				#soma = 0.0
		li $t0,0				#i = 0;
		
avg_for:
		#for(; i<n; ){
		bge $t0,$a1,avg_ef			
		sll $t1,$t0,3				#$t1 = 8xi
		addu $t1,$t1,$a0			#$t1 = &A[i]
		l.d $f4,0($t1)				#$f4 = A[i]
		add.d $f0,$f0,$f4			#soma += A[i]
		addi $t0,$t0,1				#i++
		b avg_for				#}
		
avg_ef:
		beqz $a1,avg_eif			#if(n==0) avg_eif
		mtc1 $a1,$f4				
		cvt.d.w $f4,$f4				#$f4 = (double) n;
		div.d $f0,$f0,$f4			#return soma/(double)n;
		
avg_eif:
		jr $ra					#}
