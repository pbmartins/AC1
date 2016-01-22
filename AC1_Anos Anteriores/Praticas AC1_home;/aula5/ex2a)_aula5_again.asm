#Exercício2a)_Aula5_home_again;
#Envia para o ecrã um array de 10 inteiros, previamente inicializado, declara espaço para um array de inteiros de 10 posições e inicializa-o
#com os valores especializados;

#Funciona!

			.data
lista:			.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
str1:			.asciiz "\nConteúdo do array: "
str2: 			.asciiz " , "

 			.text
 			.globl main
 			
main:
		#$t0=i; $t1=p; $t2=*p;
		
		  	li $t0,0			#i=0;
		  	la $t1,lista  			#p=lista;
		  	
		  	#print_str(str1)
		  	li $v0,4
		  	la $a0,str1
		  	syscall
		  	
for:
			bgeu $t0,10,end			#(i>=SIZE(10))
			
			lw $t2,0($t1)			#$t2 = *p;
			
			#print_int10(*p=$t2)
			li $v0,1
			move $a0,$t2
			syscall
			
			#print_str(str2)
			li $v0,4
			la $a0,str2
			syscall
			
			addiu $t1,$t1,4			#p++; (como são inteiros, são lidos de 4 em 4 bits);
			addi $t0,$t0,1			#i++;
			
			j for

end:
			jr $ra			