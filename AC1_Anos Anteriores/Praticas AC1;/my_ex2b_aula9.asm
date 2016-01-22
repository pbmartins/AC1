#Exercício2b_Aula9;
#Função strcpy recursivamente;

#Funciona!

			.include "tp3_macros.asm"
			.data
str:			.asciiz "AC1"
str_dst:		.space 2		#que espaço reservar?
			.text
			.globl main
			
main:
			addiu $sp,$sp,-4		#guarda espaço para $ra
			sw $ra,0($sp)			#salvaguarda o registo $ra
			
			la $a0,str_dst			#passa arg0 para $a0
			la $a1,str			#passa arg1 para $a1
			
			jal strcpy			#salta para a função strcpy
			
			move $a0,$v0			#$a0=strcpy(str)
			print_str_simple		#print_str(strcpy(str))
			
			lw $ra,0($sp)			#restaura $ra
			addiu $sp,$sp,4			#liberta espaço na stack
			
			li $v0,0			#return 0
			jr $ra
			
strcpy:
			#$a0=dst; $a1=src;
			addiu $sp,$sp,-8		#reserva espaço para $ra e $s0
			#porque temos 2 parâmetros;
			sw $ra,0($sp)			#guarda $ra
			sw $s0,4($sp)			#guarda $s0
			
			#sw $a0,4($sp)			#no caso de não usar registos s
			
			move $s0,$a0			#põe dst no registo $s0
			
			lb $t1,0($a1)			#*src;
			sb $t1,0($a0)			#*dst;
			
if:
			beq $t1,'\0',endif		#if((*dst=*src)!='\0')
			addiu $a0,$a0,1			#dst+1;
			addiu $a1,$a1,1			#src+1;
			jal strcpy			#return strcpy(dst+1, src+1);
			
endif:
			move $v0,$s0			#passa o valor de $s0(dst) para $v0 = return dst
			
			#lw $a0,4($sp)			#no caso de não usar registos s
			
			lw $ra,0($sp)			#restaura $ra
			lw $s0,4($sp)			#restaura $s0
			addiu $sp,$sp,8			#liberta espaço na stack
			jr $ra