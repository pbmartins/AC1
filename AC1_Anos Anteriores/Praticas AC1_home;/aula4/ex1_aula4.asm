#Feito antes da aula4!
#Feito pelos exerc�cios da dropbox!
#Resolu��o mais complexa!
		
		.include "tp3_macros.asm"
		.data
	
str1:		.asciiz	"Introduza uma string: "
str2:		.asciiz "N�mero de caracteres num�ricos: "


charArray:	.space 21		#temos 20 posi��es + 1 para o terminador do charArray '\n0'
		.align 2		#como 21 n�o � m�ltiplo de 4, vamos alinhar a mem�ria em 2^2
	
		.text
		.globl main
main:	
		print_str(str1)
		
		la $a0, charArray
		ori $a1, $0, 21		# tem a ver com as 21 posi��es necess�rias??
		ori $v0, $0, 8		# para que serve??
		syscall
		move $t2, $a0
		
		ori $t0,$0,0
		ori $t1,$0,0
		
while:		add $t3,$t1,$t2
		lb $t4,0($t3)
		
		beq $t4,0x0,endWhile
		bgt $t4,0x39,endIf
		blt $t4,0x30,endIf
		
		addi $t0,$t0,1
		
endIf:		
		addi $t1,$t1,1
		j while
		
endWhile:
		print_str(str2)
		
		or $a0,$0,$t0
		ori $v0,$0,1
		syscall
		
		done
