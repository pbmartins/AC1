#Exercício5_Aula10
#PROF
#A função seguinte ordena, por ordem crescente, um array de quantidades reais, precisão dupla.
#A função retorna a mediana dos valores do array.

#Não funciona!



		.include "tp3_macros.asm"
		.data
		.eqv SIZE,10
		.eqv TRUE,1
		.eqv FALSE,0
		.eqv SIZE_,11
d_A:		.double 8.1,-4.35,3.25,5.1,12.4,-15.0,87.45,9.5,27.3,15.8,35.19
#str:		.asciiz "O array de doubles inicial é: "
str1:		.asciiz "\nArray ordenado: "
str2: 		.asciiz "\nA mediana: "
		.text
		.globl main
		
main:
		addiu $sp,$sp,-8			#reserva espaço na stack para $ra e $s0;
		sw $ra,0($sp)				#guarda $ra
		sw $s0,4($sp)				#guarda $s0
		
		la $a0,d_A
		move $s0,$a0
		li $a1,SIZE
		#jal d_print
		
		jal do_bubble_sort
		
		print_str(str1)
		move $a0,$s0
		#jal d_print
		
		print_str(str2)
		mov.d $f12,$f0
		
		#print_double
		
		li $v0,0
		lw $ra,0($sp)
		lw $s0,4($sp)
		addiu $sp,$sp,8
		jr $ra
		
do_bubble_sort:
		li $t5,0
		li $t0,FALSE
		
bs_for_lp:
		bge $t0,$a1,bd_end_for
		
		sll $t2,$t0,3
		addi $t3,$t2,8
		
		addu $t2,$a0,$t2
		addu $t3,$a0,$t3
		l.d $f12,0($t2)
		l.d $f14,0($t3)
		
		c.le.d $f12,$f14
		bc1t bs_end_if
		s.d $f12,0($t3)
		s.d $f14,0($t2)
		
		li $t5,TRUE
		
bs_end_if:
		addi $t0,$t0,1
		j bs_for_lp
		
bd_end_for:
		bnez $t5,do_bubble_sort
		
		srl $t0,$a1,1
		sll $t2,$t0,3
		addu $t2,$a0,$t2
		l.d $f0,0($t2)
		jr $ra
