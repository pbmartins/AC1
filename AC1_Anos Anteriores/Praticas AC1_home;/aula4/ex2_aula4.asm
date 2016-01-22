#Feito antes da aula4!
#Feito pelos exercícios da dropbox!
		
		.include "tp3_macros.asm"
		.data
		
arrayChar:	.space 21
		.align 2
		
stringIn:	.asciiz "Introduza uma string: "
stringOut:	.asciiz "numero de digitos: "

		.text
		.globl main
		
		## $t0 = num
		## $t1 = p
		## $t2 = *p
main:		
		print_str(stringIn)
		
		#read_str(arrayChar,20)
		la $a0, arrayChar
		ori $a1, $0, 21
		ori $v0, $0, 8
		syscall	
		move $t1, $a0
	
		ori $t0, $0, 0			#num=0;

while:		lb $t2, 0($t1)			#$t2=*p;

		beq $t2, '\0', endWhile		#while(*p='0')
		
		bgt $t2, '9', endIf		#*p>'9'
		blt $t2, '0', endIf		#*p<'0'
			
		addi $t0, $t0, 1		#num++;
endIf:		
		addi $t1, $t1, 1		#p++;
		j while
endWhile:	
		#print_str(stringOut)
		la $a0, stringOut
		li $v0, 4
		syscall
		
		#print_int10(num)
		or $a0, $0, $t0
		ori $v0, $0, 1
		syscall
		
		jr $ra
