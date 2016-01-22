#não está acabado!!!
#falta imprimir; a main;

		.include "tp3_macros.asm"
		.eqv SIZE,10			#pode ser testado com um array mais pequeno prara facilitar, no caso deste não ser
						#inicializado inicialmente e ser pedido para introduzir os valores;
		.eqv LAST_IDX,9			#SIZE-1
		.data
		
lista:		.word 8,-4,3,5,124,-15,87,9,27,15
#lista:		.word 0:SIZE

str:		.asciiz "Introduza um número: "
str1:		.asciiz "\nConteúdo do seq-sorted array:\n"

		.text
		.globl main
		
		
		#(...)
		
Seq_sort:
		li $t0,0
		
for_lp2:
		bge $t0,LAST_IDX,end_for2
		addi $t1,$t0,1
		
for_lp3:
		bge $t1,SIZE,end_for3
		sll $t2,$t0,2
		lw $v0,lista($t2)
		sll $t3,$t1,2
		lw $v1,lista($t3)
		
		ble $v0,$v1,end_if
		move $t4,$v0
		sw $v1,lista($t2)
		sw $t4,lista($t3)
		
end_if:
		addi $t1,$t1,1
		b for_lp3
		
end_for3:
		addi $t0,$t0,1
		b for_lp2
		
end_for2:
		#print
		
exit:		#done
