#Exercício3b_Aula9
#Função soma recursivamente; 

#Funciona!

			.include "tp3_macros.asm"
			.data
str:			.asciiz "A soma do array é: "
array:			.word 2,3
			#.align 2	
			.text
			.globl main
		
main:	
			addiu $sp,$sp,-4		#reserva espaço para $ra	
			sw $ra,0($sp)			#guarda $ra
			
			print_str(str)
			
			la $a0,array			#$a0=array;
			li $a1,2			#$a1=nelem=2;
			jal soma
			
			move $a0,$v0			#$a0=soma(array);
			print_int			#print_int10(soma(array));
			
			lw $ra,0($sp)			#restaura $ra
			addiu $sp,$sp,4			#liberta espaço na stack
			
			li $v0,0			#return 0;
			jr $ra
soma:
			#$a0=array; $a1=nelem;
			addiu $sp,$sp,-8		#reserva espaço na stack para $ra e $s0
			sw $ra,0($sp)			#guarda $ra
			sw $s0,4($sp)			#guarda $s0
			
			move $s0,$a0			#$s0=array;
			
if:
			beqz $a1,else			#if(nelem==0)
			addiu $a0,$a0,4			#array+1;  não esquecer que os inteiros ocupam 4 espaços;
			subiu $a1,$a1,1			#nelem-1;
			jal soma			#soma(array+1, nelem-1);
						
			lb $t0,0($s0)			#$t0 = *array;
			add $v0,$t0,$v0			#$v0 = *array + soma(array+1, nelem-1);
			j endif
			
else:
			li $v0,0			#return 0;
			
endif:
			lw $ra,0($sp)			#restaura $ra
			lw $s0,4($sp)			#restaura $s0
			addiu $sp,$sp,8			#liberta espaço da stack;
			jr $ra
