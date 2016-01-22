#Exercício1a_Aula12;
#Imprime o nMec, nome e nota do estudante;

#PROF;
#Funciona;

#
#	typedef struct
#	{
#		unsigned int id_number;
#		char first_name[18];
#		char last_name[15]
#		float grade;
#	} student;
# -----------------------------------------
#		.data
#student:	.align 2
#i_id:		.word 0		# 0 <- offset
#c_fname:	.byte 18	# 4
#c_lname:	.byte 15	# 22 = 4 + 18
#		.align 2	
#f_grade:	.float 0	# 40 = 4 + 18 + 15 = 37 + pad3 = 40
		
		.include "tp3_macros.asm"
		.eqv std_id, 0
		.eqv std_fname, 4
		.eqv std_lname, 22
		.eqv std_grade, 40
		.data
		.align 2
		
stg:
		.word 72343
		.asciiz "Maria"
		
		.space 12
		.asciiz "Simplesmente"
		
		.space 2
		.align 2
		.float 17.9
		
s_NMec:		.asciiz "\nN. Mec:\t"
s_Nome:		.asciiz "\nNome:\t"
s_Nota:		.asciiz "\nNota:\t"
	
		.text
		.globl main
		
main:
		la $t0,stg
		
		print_str(s_NMec)
		lw $a0,std_id($t0)
		print_int
		
		print_str(s_Nome)
		la $a0,std_lname($t0)
		print_str_simple
		
		print_char(',')
		
		la $a0,std_fname($t0)
		print_str_simple
		
		print_str(s_Nota)
		l.s $f12,std_grade($t0)
		
		#print_float
		li $v0,2
		syscall
		
		jr $ra
		