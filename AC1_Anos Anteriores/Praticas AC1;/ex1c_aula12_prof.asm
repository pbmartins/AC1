#Exercício1c_Aula12;
#Pede o número mecanográfico e o primeiro nome do estudante;

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
		
		.eqv STD_FNAME_LEN,17		#reservar na estrutura um espaço para o terminador e ocupa o espaço 18, sendo que nos
						#17 espaços está a palavra;
		
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
s_Nota:		.asciiz "Nota:\t"
s_FName:	.asciiz "\nPrimeiro nome:"
	
		.text
		.globl main
		
main:
		la $t0,stg
		print_str(s_NMec)
		read_int
		
		sw $v0,std_id($t0)
		
		print_str(s_FName)
		la $a0,std_fname($t0)
		li $a1,STD_FNAME_LEN
		#read_str_simple
		li $v0,8
		syscall
		
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
		