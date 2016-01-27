#Exercício4a)_Aula4_home;
#Calcula e imprime a soma dos elementos de um array de 4 posições;

#Funciona!
#Ter em atenção linha 20 e linha 28!

			.data
array:			.word 7692, 23, 5, 234

str: 			.asciiz "A soma dos elementos do array é: "

			.text
			.globl main
			
main:
		#$t0=p; $t1=pultimo; $t2=*p; $t3 = soma;
			li $t3,0		#soma = 0;
			la $t0,array		#p = array;
			
			addi $t1,$t0,12		#pultimo = array + 12(3*4bits para cada inteiro);
			
while:	
			bgt $t0,$t1,end		#while(p>pultimo)
			
			lw $t2,0($t0)		#$t2=*p;
			add $t3,$t3,$t2		#soma = soma + (*p);
			
			addiu $t0,$t0,4		#p++; (sendo inteiros ter em atenção que o próximo está sempre 4 bits depois do anterior)
			j while
			
end:
			#print_str(str)
			li $v0,4
			la $a0,str
			syscall
			
			#print_int10(soma=$t3)
			li $v0,1
			move $a0,$t3
			syscall
			
			jr $ra