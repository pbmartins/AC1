#Exercício1a)_Aula5_home_again;
#Lê 5 valores da consola e armazena-os no array "lista"

#Funciona!

			.data
lista:			.space 20 			#(5 valores * 4 bits cada = espaço 20)
			.align 2
			
str:			.asciiz "Introduza um número: "

			.text
			.globl main
			
main:
		#$t0=i; $t1=lista; $t2=lista[i]; $v0=value;
			li $t0,0			#i=0;
			
for:
			bge $t0,5,end			#(i<SIZE(5))
			
			#print_str(str)
			li $v0,4
			la $a0,str
			syscall
			
			#read_int()
			li $v0,5
			syscall
			
			sll $t2,$t0,2			#$t2=4*i=lista[i]
			sb $v0,lista($t2)		#lista[i] = read_int();
			
			addi $t0,$t0,1			#i++;
			
			j for
			
end:
			jr $ra