#Exercício5a)_Aula5_home;
#Sequential_sort
#Feito apenas a parte da ordenação, falta leitura e impressão dos valores!
#Dimuição do valor introduzido de 10 para 4;

#Falta algoritmo para ler os valores e imprimi-los ordenados!

			.data
			.eqv SIZE,4
			.eqv LAST_IDX,3
			
lista:			.word 0:SIZE
			.align 2
			
str:			.asciiz "Introduza um número: "
str1:			.asciiz "Conteúdo do array ordenado: "

			.text
			.globl main
			
main:
		#$t0=i; $t1=j; $t2=aux;
		#$t3=lista; $t4=lista[i]; $t5=lista[j];
		
			li $t0,0			#i=0;
			la $t3,lista			#$t3=lista;
			
for_1:
			bge $t0,LAST_IDX,end		#i>=SIZE-1;
			
			addi $t1,$t0,1			#j=i+1;
			bge $t1,SIZE,end_for1		#j>=SIZE
			
			sll $t3,$t0,2			#$t3=i*4;
			lw $t4,lista($t0)		#$t4=lista[i];
			lw $t5,lista($t1)		#$t5=lista[j];
			
			ble $t4,$t5,end_for_2		#lista[i]<=lista[j];
			
			move $t2,$t4			#aux=lista[i];
			move $t4,$t5			#lista[i]=lista[j];
			move $t5,$t2			#lista[j]=aux;

end_for_2:
			addi $t1,$t1,1			#j++;
				
end_for_1:
			addi $t0,$t0,1			#i++;
			
end:			
			jr $ra
			
			