#Exercício5b_Aula9
#Cálculo do fatorial de n recursivamente;

#PROF;

#Funciona!

			.include "tp3_macros.asm"
			.eqv MAX_N,12
			.data
error_ex_sp:		.word 0
s_ask:			.asciiz "Dê-me um inteiro (<12): "
s_fact:			.asciiz "O factorial é: "
s_toobig:		.asciiz "Erro: o inteiro é >12!"
			.text
			.globl main
			
main:
			addiu $sp,$sp,-8			#reserva espaço na stack;
			sw $ra,0($sp)				#guarda $ra
			sw $s0,4($sp)				#guarda $s0
			sw $sp,error_ex_sp			#error exit $sp
			
			print_str(s_ask)
			read_int()
	
dofact:
			move $a0,$v0				#prepare arg0
			jal fact
			move $s0,$v0				#guarda resultado
			
			print_str(s_fact)
			print_int($s0)
			li $v0,0				#return 0
				
exit_:
			lw $ra,0($sp)				#restaura $ra
			lw $s0,4($sp)				#restaura $s0
			addiu $sp,$sp,8				#liberta espaço na stack;
			
			jr $ra
			
fact:
			ble $a0,MAX_N,f_gn			
			print_str(s_toobig)
			
			lw $sp,error_ex_sp			#error exit $sp
			li $v0,1				#$v0 = 1
			j exit_
			
f_gn:
			addiu $sp,$sp,-8
			sw $ra,0($sp)				#guarda $ra
			sw $s0,4($sp)				#guarda $s0
			
			bgt $a0,1,gt_1				#if(n>1) gt_1
			li $v0,1				#$v0=1
			j fact_ex				#return
			
gt_1:
			move $s0,$a0				#usa $s0 e preserva 'n'
			addiu $a0,$s0,-1			#n-1
			jal fact				#fact(n-1)
			
			mul $v0,$s0,$v0				#$v0 = n * fact(n-1)
			
fact_ex:
			lw $ra,0($sp)				#restaura $ra
			lw $s0,4($sp)				#restaura $s0
			addiu $sp,$sp,8				#liberta espaço na stack;
			
			jr $ra
