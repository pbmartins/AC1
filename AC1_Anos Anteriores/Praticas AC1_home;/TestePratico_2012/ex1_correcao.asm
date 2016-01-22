#Exercício1_TestePrático_13.Janeiro.2012;
#CORREÇÃO!

#Função eval();	
#Problemas graves! 
	
		.data
um:		.double 1.0
dois:	 	.double 2.0
str:		.asciiz "Número: "
str_r:		.asciiz "Resultado: "
		.text
		.globl main

main:
		addiu $sp,$sp,-4
		lw $ra,0($sp)
		
		#print_str(str)
		li $v0,4
		la $a0,str
		syscall
		
		jal eval
		
		#print_double
		mov.d $f12,$f0
		li $v0,3
		syscall
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		jr $ra
		
eval:
		subu $sp,$sp,20
		sw $ra,0($sp)
		sw $s0,4($sp)
		sw $s1,8($sp)
		s.d $f20,12($sp)
		
		move $s0,$a0
	
if:
		bne $s0,$0,else
		l.d $f0,um
		j final
		
else:
		sub.d $f20,$f20,$f20
		
		li $s1,0
		
for:
		bge $s1,$s0,endfor
		
		move $a0,$s1
		jal eval
		
		add.d $f20,$f20,$f0
		addi $s1,$s1,1
		j for
		
endfor:
		l.d $f0,dois
		mul.d $f0,$f0,$f20
		mtc1 $s0,$f2
		cvt.d.w $f2,$f2
		div.d $f0,$f0,$f2
		add.d $f0,$f0,$f2
		
final:
		lw $ra,0($sp)
		lw $s0,4($sp)
		lw $s1,8($sp)
		l.d $f20,12($sp)
		addu $sp,$sp,20
		
		jr $ra
