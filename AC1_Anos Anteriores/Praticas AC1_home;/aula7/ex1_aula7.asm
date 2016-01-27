#Exercício1_Aula7_home;
#Função strlen();
#Determina e devolve a dimensão de uma string;

#Funciona!


		.data
str1:		.asciiz "String de teste"
str2:		.asciiz "O tamanho da string é: "
		.text
		.globl main
		
main:
		addiu $sp,$sp,-4
		sw $ra,0($sp)
		
		#print_str(str2)
		li $v0,4
		la $a0,str2
		syscall
		
		la $a0,str1			#$a0 = str1 = "String de teste"
		jal strlen
		
		#print_int10(strlen(str))
		move $a0,$v0
		li $v0,1
		syscall
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		jr $ra
		
strlen:
		#$v0 = len; $a0 = s; $t0 = *s;
		li $v0,0			#$v0 = len = 0;
		
while:
		lb $t0,0($a0)			#$t0 = *s;
		beq $t0,'\0',endwhile
		addi $v0,$v0,1			#len++;
		addiu $a0,$a0,1			#s++;
		j while
		
endwhile:
		jr $ra
		
