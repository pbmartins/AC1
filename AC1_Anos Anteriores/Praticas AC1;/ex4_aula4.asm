#Exercício4a)_Aula4_Prof
#Soma de elementos dum array: ponteiros;

#fazer com INDICES!

		.include "tp3_macros.asm"
		.data
	
arr_ints:	.word 7692,23,5,234

str:		.asciiz "\nA soma do array de inteiros: "

		.text
		.globl main
		
main:
		#soma=0
		#p=arr_ints;
		#while(p<=pultimo){
		#	soma = soma + (*p)
		#	p++;	//incrementa o ponteiro
		#	}
		
		#$t0 = p; $t1 = pUltimo;
		#$t2 = *p; $t3 = soma

		li $t3,0		#soma=0
		la $t0,arr_ints		#$t0 = p = arr_ints
		
		move $t1,$t0		#$t1 = p = arr_ints
		addiu $t1,$t1,12	#$t1 = arr_ints + 3*4 (*4 por serem inteiros e ocuparem 4 posições!)
		
w_lp1:		
		bgtu $t0,$t1,end_lp1	#if(p>pUltimo)end_lp1
		lw $t2,0($t0)		#$t2=*p
		add $t3,$t3,$t2		#soma = soma + (*p)
		addiu $t0,$t0,4		#p++
		
		j w_lp1
		
end_lp1:
		print_str(str)		#imprime o resultado direitinho!
		print_int($t3)
		
exit:		done
		
