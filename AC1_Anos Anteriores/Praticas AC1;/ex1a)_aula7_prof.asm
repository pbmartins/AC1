#Exercício1a)_Aula7_prof;
		
		.include "tp3_macros.asm"
		.data
		
s_hdr:		.asciiz "O comprimento da string é: "
str:		.asciiz "String de teste"

		.text
		.globl main
		
main:
		addiu $sp,$sp,-4		#espaço para guardar $ra
		sw $ra,0($sp)			#guarda $ra
		#
		print_str(s_hdr)
		#		
		la $a0,str			#passa arg0 para $a0
		jal strlen			#chama 'strlen'
		#
		move $a0,$v0			#
		print_int			#print_int10(strlen(str))
		#
		lw $ra,0($sp)			#restore $ra
		addiu $sp,$sp,4			#restore $sp
		#retorna para a main
		li $v0,0			#return 0
		jr $ra
		
strlen:
		li $v0,0			#len=0
		#s=$a0

sln_lp:
		lb $t0,0($a0)			#$t0=$a0(str)
		beqz $t0,sln_ex			#while(*s!='\0')
		addi $v0,$v0,1			#len++
		#
		addiu $a0,$a0,1			#s++
		j sln_lp
		#				#$v0=len!
sln_ex:
		jr $ra				
