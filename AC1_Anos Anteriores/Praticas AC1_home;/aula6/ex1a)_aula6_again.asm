#Exercício1a)_Aula6_home_again;
#Define 3 strings e imprime-as;

#Funciona!
#Porquê aumentar o array? ou seja, $t1?

			.data
			.eqv SIZE,3
array:			.word str1, str2, str3
			.align 2
			
str1:			.asciiz "Array"
str2: 			.asciiz "de"
str3: 			.asciiz "ponteiros"
		
			.text
			.globl main
			
main:
		#$t0=i; $t1=array; $t2=array[i];
			li $t0,0		#i=0;
			
for:
			bge $t0,SIZE,end_for		#i>=SIZE
			sll $t1,$t0,2			#$t1=i*4;
			lw $a0,array($t1)		#$a0=array[i];
			
			#print_str(array[i])
			li $v0,4
			#la $a0,$t2
			syscall
			
			#print_char('\n')
			li $a0,'\n'
			li $v0,11
			syscall
			
			addi $t0,$t0,1			#i++;
			
			j for
			
end_for:
			jr $ra