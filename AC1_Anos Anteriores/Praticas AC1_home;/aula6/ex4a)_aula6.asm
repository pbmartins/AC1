#Exercício4a)_Aula6_home;
#Imprime os argumentos introduzidos na linha de comando

#Funciona!


			.data
str:			.asciiz "Nr. de parâmetros: "
str1: 			.asciiz ": "
str2:			.asciiz "\nP"

 			.text
 			.globl main
 			
main:
		#$t0=i; $a0=$t1=argc; $a1=$t2=argv; $t3=argv[i];
		
			move $t1,$a0			#$t1=argc;
			
			#print_str(str)
			li $v0,4
			la $a0,str
			syscall
			
			#print_int($t1)
			li $v0,1
			move $a0,$t1
			syscall
			
for:
			bge $t0,$t1,end_for
			
			#print_str(str2)
			li $v0,4
			la $a0,str2
			syscall
			
			#print_int($t0)
			li $v0,1
			move $a0,$t0
			syscall
			
			#print_str(str1)
			li $v0,4
			la $a0,str1
			syscall
			
			sll $t2,$t0,2			#$t2=i*4;
			
			#não percebo a próxima linha de código!
			addu $a2,$a1,$t2		#locate: argv + i * 4
			
			lw $a0,0($a2)			#$t3=argv[i];
			
			#print_str($t3)
			li $v0,4
			syscall
			
			addi $t0,$t0,1			#i++;
			j for

end_for:
			#como fazer o return 0?
			jr $ra			
			
			
			 	