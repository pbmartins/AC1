#Exercício4b_Aula9;
#Função print_int_ac1 recursivamente;

#PROF;

#Funciona!

			.include "tp3_macros.asm"
			.data
s_ask_int:		.asciiz "Dê-me um inteiro: "
s_ask_base:		.asciiz "Dê-me uma base (2,3..16): "
s_res:			.asciiz "Esse inteiro nessa base: "
			.text
			.globl main
			
main:
			addiu $sp,$sp,-8			#reserva espaço na stack;
			sw $ra,0($sp)				#guarda $ra
			sw $s0,4($sp)				#guarda $s0
			
			print_str(s_ask_int)
			read_int($s0)				#ler o inteiro para o registo $s0, de modo a preservar o valor do inteiro;
			#poderia ter usado o registo $t0, por exemplo; não faria diferença;
			
			print_str(s_ask_base)
			read_int($a1)
			
			print_str(s_res)
			move $a0,$s0				#recupera $a0
			
			jal print_int_ac1
				
			lw $ra,0($sp)				#restaura $ra
			lw $s0,4($sp)				#restaura $s0
			addiu $sp,$sp,8				#liberta espaço na stack;
			
			jr $ra
			
print_int_ac1:
			#$a0=num; $a1=base;
			addiu $sp,$sp,-8			#reserva espaço para $ra e $s0
			sw $ra,0($sp)				#guarda $ra	
			sw $s0,4($sp)				#guarda $s0
			
			div $a0,$a1				#num/base
			mflo $t0				#$t0 = quociente = num/base
			mfhi $a0				#$a0 = num % base;
			beqz $t0,pr_ret
			
			move $s0,$a0				#preserva 'num % base'
			move $a0,$t0				#$a0 = num / base
			
			jal print_int_ac1
			
			move $a0,$s0				#restaura $s0
			
pr_ret:
			jal toascii
			move $a0,$v0
			
			#print_char_simple				
			li $v0,11
			syscall
			
			lw $ra,0($sp)				#restaura $ra
			lw $s0,4($sp)				#restaura $s0
			addi $sp,$sp,8				#liberta espaço na stack
			jr $ra
			
toascii:
			addiu $v0,$a0,'0'			#v += '0'
			ble $v0,'9',toa_exit			#v > '9'
			addiu $v0,$v0,7				#v += 7
			
toa_exit:
			jr $ra
