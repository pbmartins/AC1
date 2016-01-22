#problemas em imprimir!
#ex3_aula5_prof com problemas em imprimir!
		
		.include "tp3_macros.asm"
		.eqv SIZE,4
		.eqv LAST_IDX,3			#SIZE-1
		.data
		
#lista:		.word 8,-4,3,5,124,-15,87,9,27,15
lista:		.word 0:SIZE

str:		.asciiz "Introduza um número: "
str1:		.asciiz "\nConteúdo do b-sorted array:\n"

		.text
		.globl main
		
main:	

		li $t0,0			#i=0
		
		
for_lp1:	
		bge $t0,SIZE,bubble_sort	
		
		print_str(str)
		read_int			#$v0=decimal value
			
		sll $t2,$t0,2			#$t3=int_byte_idx=4*i
		sw $v0,lista($t2)		#lista[i]=read_int();
		
		addi $t0,$t0,1			#i++
		b for_lp1
		
	#$t0=i; $t2=byte_i; $t3=byte_i_next;
	#$t4=aux; $t5=houveTroca;
	#$v0=value; $v1=value_i_next;
	#$t6=
	
bubble_sort:
		li $t6,SIZE
		addiu $t6,$t6,-1
		
bubble_sort_do:
		li $t5,0		#houveTroca=0
		li $t0,0		#i=0
		
for_lp2:	
		bge $t0,$t6,end_for2	#if(i>=SIZE)
		
		sll $t2,$t0,2			#$t2=4*i
		lw $v0,lista($t2)		#$v0=lista[i]
		addi $t3,$t2,4			#$t3=4*(i+1)
		lw $v1,lista($t3)		#$v1=lista[i+1]
		
		ble $v0,$v1,end_if		
		move $t4,$v0			#aux=lista[i]
		sw $v1,lista($t2)		#lista[i]=lista[i+1]
		sw $t4,lista($t3)		#lista[i+1]=aux
		li $t5,1			#houveTrocas=TRUE;
		
end_if:	
		addi $t0,$t0,1			#i++
		b for_lp2
		
end_for2:
		addiu $t6,$t6,-1		#last_i--;
		#while(houverTroca==TRUE);
		bnez $t5,bubble_sort
		
		#erros de impressão!!!
		print_str(str1)
		lw $a0,0($t2)
		print_int
		addiu $t0,$t0,1			#i++
		
exit:		done