#Exercício1c_Aula7_home;
#Função strlen();
#Determina e afixa no ecrã o número de caracteres de cada uma das strings passadas como argumentos na linha de comando;

#NÃO FUNCIONA!


		.data
str2:		.asciiz "O tamanho da string é: "
str:		.asciiz " - "
		.text
		.globl main
		
main:
		#int argc -> número de caracteres da string;
		#char *argv[] -> strings introduzidas na linha de comando;
		#$a0 = argc; $a1 = argv; $t0 = i; $t1 = *argv;
		 
		addiu $sp,$sp,-16
		sw $ra,0($sp)
		sw $s0,4($sp)			#guarda o i;
		sw $s1,8($sp)			#guarda o argc;
		sw $s2,12($sp)			#guarda o argv;
		
		move $s1,$a0			#$s1 = argc;
		move $s2,$a1			#$s2 = argv;
		li $s0,0			#i=0;
		
for:
		bge $s0,$s1,endfor
		
		#print_char('\n')
		li $a0,'\n'
		li $v0,11
		syscall
		
		sll $t2,$s0,2		#$t2 = i * 4;
		addu $a2,$s2,$t2	#$a2 = argv + i * 4;
		lw $a1,0($a2)		#$a1 = argv[i];			
		
		move $a2,$a1		#$a2 = argv[i];
		#print_str(argv[i])
		li $v0,4
		syscall
		
		move $a0,$s2
		jal strlen
		
		move $v1,$v0
		#print_int10(strlen(argv[i]))
		li $v0,1
		syscall
		
		addiu $s0,$s0,1			#i++;
		j for
		
endfor:
		
		lw $ra,0($sp)
		lw $s0,4($sp)
		addiu $sp,$sp,8
		li $v0,0			#return 0
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