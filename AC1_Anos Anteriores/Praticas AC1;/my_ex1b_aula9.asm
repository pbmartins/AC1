#Exercício1b)_Aula9

#Funciona!

			.include "tp3_macros.asm"
			.data
str:			.asciiz "O comprimento da string é: "
str1:			.asciiz "String de teste"	
			.text 
			.globl main
			
			
main:
			addiu $sp,$sp,-4		#guarda espaço para $ra
			sw $ra,0($sp)			#salvaguarda o resgisto $ra
			
			print_str(str)
			
			la $a0,str1			#passa arg0 para $a0
			jal strlen			#salta para a função strlen
			
			move $a0,$v0			#$a0=strlen(str)
			print_int			#print_int10(strlen(str))
			
			lw $ra,0($sp)			#restaura $ra
			addiu $sp,$sp,4			#liberta espaço na stack
			
			li $v0,0			#return 0
			jr $ra
			
strlen:
			addiu $sp,$sp,-4		#guarda espaço para $ra
			sw $ra,0($sp)			#salvaguarda o registo $ra
			lb $t0,0($a0)			#$t0=*s;
			
if:
			beq $t0,'\0',else		#if(*s != '\0')
			addiu $a0,$a0,1			#return 1
			jal strlen
			addiu $v0,$v0,1			#return (1+strlen(s+1));
			j end_if
else:
			li $v0,0			#return 0;
			
end_if:
			lw $ra,0($sp)
			addiu $sp,$sp,4
			jr $ra