#Exercicio4)_Aula7_prof;

		.include "tp3_macros.asm"
		.eqv STR_MAX_SIZE,10
		.data
		
str1:		.asciiz "Arquitectura de "
str2:		.space STR_MAX_SIZE
str3:		.asciiz "Computadores"

		.text
		.globl main
		
main:
		addiu $sp,$sp,-4
		sw $ra,0($sp)
		#
		la $a0,str2			#$a0=dst=str2
		la $a1,str1			#$a1=src=str1
		#
		jal strcpy			#retorna para $v0 = src = str2
		#
		move $a0,$v0			#$a0=src=str2
		la $a1,str3			#$a1=dst=str3
		#
		jal strcat			#retorna para $v0=src=str2
		
		move $a0,$v0
		print_str_simple
		#
		lw $ra,0($sp)			#restore $ra
		addiu $sp,$sp,4			#restore $sp
		#
		li $v0,0			#return 0
		jr $ra
		
strcpy:
		li $t0,0			#i=0
			
scp_do_w:
		addu $t1,$0,$t0			#dst = dst + i
		addu $t2,$a1,$t0		#src = src + i
		#
		lb $v0,0($t2)			#$v0=src[i]
		sb $v0,0($t1)			#dst[i]=src[i]
		beqz $v0,scp_end		#if(src[i]==0) exit
		#
		addiu $t0,$t0,1			#i++
		j scp_do_w
		
			
scp_end:
		move $v0,$a0			#return 'dst'
		jr $ra	
	
strcat:
		addiu $sp,$sp,-4		#espaço para $ra
		sw $ra,0($sp)			#guarda $ra
		#
		move $a2,$a0			#guara dst!
		
stc_lp:
		lb $t0,0($a0)			#while(*p!='\0') p++
		beqz $t0,stc_cpy		
		addiu $a0,$a0,1			#p++
		j stc_lp	
		
stc_cpy:
	
		jal strcpy
		move $v0,$a2
		#
		lw $ra,0($sp)
		addiu $sp,$sp,4
		jr $ra
		