#Exerc�cio2_Aula12;
#

#PROF;

#


		.include "tp3_macros.asm"
		.eqv std_id, 0
		.eqv std_fname, 4
		.eqv std_lname, 22
		.eqv std_grade, 40
		
		.eqv STD_FNAME_LEN, 17
		.eqv STD_LNAME_LEN, 14
		.eqv STD_SIZEOF, 44		#4+18+15+3pad+4=44
		.eqv MAX_STUDENTS, 4
		
		.data
		.align 2
		
st_A:		.space 176			#4*44
f_media:	.float 13.44			#usar uma m�dia qualquer

s_Media:	.asciiz "\nM�dia: \t"
s_Maxima:	.asciiz "\nM�xima: \t"

		.text
		.globl main
		
main:
		addiu $sp,$sp,-12
		sw $ra,0($sp)
		sw $s0,4($sp)
		sw $s1,8($sp)
		
		la $a0,st_A
		li $a1,MAX_STUDENTS
		move $s0,$a0
		move $s1,$a1
		
		jal read_data
		
		move $a0,$s0
		move $a1,$a1
		la $a2,f_media
		
		jal max
		
		move $a3,$v0
		
m_pr_m:	
		print_str(s_Media)
		
		l.s $f12,f_media
		#print_float
		li $v0,2
		syscall
		
		print_str(s_Maxima)
		move $a0,$a3
		
		jal print_student
		
m_ex:
		lw $ra,0($sp)
		lw $s0,4($sp)
		lw $s1,8($sp)
		addiu $sp,$sp,12
		jr $ra
		
#		
#	

		.data
		
s_NMec:		.asciiz "\nN. Mec:\t"
s_FName:	.asciiz "\nPrimeiro nome:\t"
s_UNome:	.asciiz "\n�ltimo nome:\t"
s_Nota:		.asciiz "\nNota:\t"

		.text
		
read_data:
		addiu $sp,$sp,-8
		sw $s0,0($sp)
		sw $s1,4($sp)
		
		move $s0,$a0
		move $s1,$a1
		
		li $t0,0
		
rd_for:
		bge $t0,$s1,rd_ex
		
		print_str(s_NMec)
		read_int
		
		sw $v0,std_id($s0)
		
		print_str(s_FName)
		la $a0,std_fname($s0)
		li $a1,STD_FNAME_LEN
		
		#read_str_simple
		li $v0,8
		syscall
		
		print_str(s_UNome)
		la $a0,std_lname($s0)
		li $a1,STD_LNAME_LEN
		
		#read_str_simple
		li $v0,8
		syscall
		
		print_str(s_Nota)
		#read_float
		li $v0,6
		syscall
		s.s $f0,std_grade($s0)
		
		addi $t0,$t0,1			#i++
		
		addu $s0,$s0,STD_SIZEOF
		b rd_for
	
rd_ex:
		lw $s0,0($sp)
		lw $s1,4($sp)
		addiu $sp,$sp,8
		jr $ra
#
#

		.data
		.align 2
		
f_const_0:	.float 0.0
f_const_m20:	.float -20.0

		.text
		
max:
		move $t0,$a0
		
		mulu $t1,$a1,STD_SIZEOF
		addu $t1,$t0,$t1
		
		l.s $f0,f_const_0
		l.s $f1,f_const_m20
		li $v0,0
		
max_for:
		bgeu $t0,$t1,max_efor
		
		l.s $f2,std_grade($t0)
		add.s $f0,$f0,$f2
		
		c.le.s $f2,$f1
		bc1t max_fnext
		mov.s $f1,$f2
		move $v0,$t0
		
max_fnext:
		addiu $t0,$t0,STD_SIZEOF		#p++ - pointer bump
		b max_for
		
max_efor:
		mtc1 $a1,$f2
		cvt.s.w $f2,$f2
		div.s $f0,$f0,$f2
		s.s $f0,0($a2)
		
max_ex:
		jr $ra
			
		.text
		
print_student:
		move $a1,$a0
		lw $a0,std_id($a1)
		print_int
		
		print_char('\n')
		
		la $a0,std_fname($a1)
		print_str_simple
		
		la $a0,std_lname($a1)
		print_str_simple
		
		la $a0,std_grade($a1)
		#print_float
		li $v0,2
		syscall
		
		jr $ra	
