#print_int_ac1
			.include "tp3_macros.asm"
			.data
s_buf:			.space 33
str:			.asciiz "D�-me um n�mero inteiro: "
str1:			.asciiz "D�-me uma base(2,3..16): "
str2: 			.asciiz "Esse inteiro nessa base �: "

			.text
			.globl print_int_ac1
			
#main:
			#unsigned int n, b;
			#print_str("D�-me um n�mero inteiro: ")
			#n = read_int;
			#print_str("D�-me uma base(2,3..16)")
			#b=read_int;
			#print_str("Esse inteiro nessa base �:")
			#
			
#			addiu $sp,$sp,-4
#			sw $ra,0($sp)
			
#			print_str(str)
#			read_int($v1)
			
#			print_str(str1)
#			read_int($a1)
			
#			print_str(str2)
#			move $a0,$v1
			
#			jal print_int_ac1
			
#			lw $ra,0($sp)
#			addiu $sp,$sp,4
			
#			li $v0,0
#			jr $ra

print_int_ac1:
			#static char str[33];
			#print_str(itoa(2413,10,str));
			addiu $sp,$sp,-4		#reserva espa�o para a stack		
			sw $ra,0($sp)			#guarda $ra
						
			la $a2,s_buf
			jal itoa
			move $a0,$v0
			print_str_simple
			
			lw $ra,0($sp)			#restore $ra
			addiu $sp,$sp,4			#liberta espa�o na stack
			jr $ra
