#Exercício2a)_Aula7_prof;
#Função strrev;
		
		.include "tp3_macros.asm"
		.data
		
str:		.asciiz "String a ser invertida"
#str_r:		.asciiz "aditrevni res a gnirtS"

		.text
		.globl strrev
		
#main:	
#		addiu $sp,$sp,-8		#espaço para $ra
#		sw $ra,0($sp)			#guarda $ra
		#
#		la $a0,str			#passa arg0 para $a0
#		jal strrev		
		#	
#		move $a0,$v0			
#		print_str_simple
		#
#		lw $ra,0($sp)			#restore $ra
#		addiu $sp,$sp,8			#restore $sp
		#
#		li $v0,0			#return0
#		jr $ra
		
strrev:
		addiu $sp,$sp,-8		#espaço para $ra
		sw $ra,0($sp)			#guarda $ra
		sw $s0,4($sp)			##
		#	
		move $a1,$a0			#$a1=p2=p1=str
		
srv_lp:
		lb $t0,0($a1)			
		beqz $t0,srv_lchar		#string end?
		#
		addi $a1,$a1,1			#p2++
		j srv_lp
		
srv_lchar:
		#$a1=p2
		addi $a1,$a1,-1			#p2--			
		#move $a2,$a0			#guarda p1 = str em $a2
		move $s0,$a0			##
		
srv_wh:
		#while(p1<p2)
		bge $a0,$a1,srv_wh_end		
		jal exchange
		addi $a0,$a0,1			#p1++
		addi $a1,$a1,-1			#p2--
		j srv_wh
		
srv_wh_end:
		#move $v0,$a2			#ret initial 'str'
		move $v0,$s0			##
		#
		lw $ra,0($sp)			#restore $ra
		lw $s0,4($sp)			##
		addiu $sp,$sp,8			#restore $sp
		#
		jr $ra
		
exchange:
		#$a0=c1; $a1=c2; usa $v0 e $v1
		lb $v0,0($a0)			#($v0=aux) = *c1
		lb $v1,0($a1)			#$v1=*c2
		sb $v1,0($a0)			#*c1=*c2
		sb $v0,0($a1)			#*c2=aux
		jr $ra
		
