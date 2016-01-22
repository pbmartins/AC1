#Exercício1b)_Aula7_home;
#Alguma dúvidas!

#Funciona!

			.data
			
str:			.asciiz "String de teste"
str1: 			.asciiz "O número de caracteres da string é: "

			.text
			.globl main
			
main:
		#$v0=len; $a0=s; $t0=*s;
			subu $sp,$sp,4			#reserva espaço para a stack
			sw $ra,0($sp)			#salvaguarda o registo $ra
			
			#print_str(str1)
			li $v0,4
			la $a0,str1
			syscall
			
			la $a0,str			#inicialização do registo com a string que queremos medir;
			jal strlen			#salta para a função strlen();
			
			move $a0,$v0			#move o $v0 para $a0 de modo a facilitar a syscall;
							#em que $v0 é o valor do tamanho da string;
			#print_int
			li $v0,1
			syscall
			
			lw $ra,0($sp)			#recupera o valor do registo $ra
			addiu $sp,$sp,4			#liberta espaço na stack
			jr $ra				#retorna

strlen:
			li $v0,0			#$v0=len=0;

while:
			lb $t0,0($a0)			#$t0=*s;
			beq $t0,'\0',end
			
			addiu $v0,$v0,1			#len++;
			addiu $a0,$a0,1			#*s++;
			
			j while
			
end:
			jr $ra