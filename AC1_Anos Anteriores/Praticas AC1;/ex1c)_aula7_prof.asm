#Exercício1c)_Aula7_prof;
#Usando a convenção estabelecida;
#Tem de ser incluído o ficheiro de exception handler

#Não imprime o número de caracteres!
		
		.include "tp3_macros.asm"
		.data
		
s_sep:		.asciiz " - "

		.text
		.globl main
		
main:	
		addiu $sp,$sp,-16		#space $ra+$s0+$s1+$s2
		sw $ra,0($sp)			#save $ra
		
		sw $s0,4($sp)			#save $s0 = i
		sw $s1,8($sp)			#save $s1 = argc
		sw $s2,12($sp)			#save $s2 = argv
		
		move $s1,$a0			#$s1 = argc;
		#move $s2,$a1			#$s2 = argv;
		li $s0,0			#i=0;
		
for_loop1:
		bge $s0,$s1,end_for		#if(i=argc) end_for
		print_char('\n')
		
		sll $t2,$s0,2			#$t2 = i * 4;
		addu $a2,$a1,$t2		#locate: argv + i * 4;	
		lw $a2,0($a2)			#$a0 = argv[i];
		
#		move $a2,$a0			#$a2 = argv[i];
		print_str_simple
		
		print_str(s_sep)
		
		move $a0,$s2
		jal strlen
		
		move $v1,$v0
		print_int($v1)
		
		addiu $s0,$s0,1
		j for_loop1
		
end_for:
		lw $ra,0($sp)
		lw $s0,4($sp)
		lw $s1,8($sp)
		lw $s2,12($sp)
		
		addiu $sp,$sp,16
		
		li $v0,0
		jr $ra
		
strlen:
		li $v0,0
		
sln_lp:
		lb $t0,0($a0)
		beqz $t0,sln_ex
		addi $v0,$v0,1
		
		addi $a0,$a0,1
		j sln_lp
		
sln_ex:
		jr $ra
		
		
