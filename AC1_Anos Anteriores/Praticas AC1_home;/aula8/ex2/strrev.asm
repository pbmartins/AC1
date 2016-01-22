#Exercício2_Aula7_home;
#Função strrev();
#Inverte o conteúdo de uma string;

#Funciona!

		.data
str:		.asciiz "String de teste"	
		.text
		.globl strrev
		
main:
#		addiu $sp,$sp,-4
#		sw $ra,0($sp)
		
#		la $a0,str
#		jal strrev
		
		#print_str(strrev(str))
#		move $a0,$v0
#		li $v0,4
#		syscall
		
#		lw $ra,0($sp)
#		addiu $sp,$sp,4
#		li $v0,0			#return 0;
#		jr $ra
		
strrev:
		addiu $sp,$sp,-8
		sw $ra,0($sp)			#guarda $ra
		sw $s0,4($sp)			#guarda str
		
		move $a1,$a0			#$a1 = p1 = p2 = str;
		
while:
		lb $t0,0($a1)			#$t0 = *p2
		beq $t0,'\0',endwhile		#*p2 != '\0'
		addiu $a1,$a1,1			#p2++
		j while
		
endwhile:
		subiu $a1,$a1,1			#p2--
		move $s0,$a0			#$s0 = p1
		
second_while:
		bge $a0,$a1,sec_endwhile
		jal exchange
		addiu $a0,$a0,1			#p1++;
		addiu $a1,$a1,-1		#p2--;
		j second_while
		
sec_endwhile:
		move $v0,$s0			#return str;   porque a str ficou guardada em $s0, logo aqui está a passar-se o valor 
						#da str para a retornar, daí o $v0;
		
		lw $ra,0($sp)
		lw $s0,4($sp)
		addiu $sp,$sp,8
		jr $ra
		
exchange:
		#char *c1, char *c2
		#$a0 = c1; $a1 = c2; usa $v0 e $v1
		
		lb $v0,0($a0)			#$v0 = aux = *c1;
		lb $v1,0($a1)			#$v1 = *c2;
		
		sb $v1,0($a0)			#*c1 = *c2
		sb $v0,0($a1)			#*c2 = aux			
		
		jr $ra
		
