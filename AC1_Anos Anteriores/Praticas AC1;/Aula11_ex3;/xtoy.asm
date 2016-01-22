#Exercício1b)_Aula11
#Calcula o valor de x^y, com "x" real e "y" inteiro(positivo ou negativo);

#Funciona!

		.include "tp3_macros.asm"
		.data
k1:		.double 1.0
str1:		.asciiz "Introduza um valor real para x: "
str2:		.asciiz "Introduza um valor inteiro para y: "
str_f:		.asciiz "O valor de x^y é: "	
		.text
		.globl xtoy
		
main:
#		addiu $sp,$sp,-4
#		sw $ra,0($sp)
		
#		print_str(str1)
		
		#read_double(x);
#		li $v0,7
#		syscall
#		mov.d $f12,$f0
		
#		print_str(str2)
		
		#read_int(y);
#		read_int($a0)
	
#		jal xtoy
		
#		print_str(str_f)
		
		#print_double
#		mov.d $f12,$f0
#		li $v0,3
#		syscall
		
#		lw $ra,0($sp)
#		addiu $sp,$sp,4
#		jr $ra
		
xtoy:	
		addiu $sp,$sp,-12
		sw $ra,0($sp)
		sw $s0,4($sp)
		sw $s1,8($sp)

		mov.d $f6,$f12			#$f6 = x;
		move $s0,$a0			#$s0 = y;
		li $s1,0			#i=0;
		l.d $f4,k1			#$f4 = 1.0
		
		move $a0,$s0			#$a0 = y;
		jal abs_
		
		move $t0,$v0			#$t0 = abs(y);
		
for:
		bge $s1,$t0,end			#i < abs(y);
		
if:
		ble $s0,$0,else			#y>0
		mul.d $f4,$f4,$f6		#result = result * x;
		j end_for
		
else:
		div.d $f4,$f4,$f6		#result = result / x;
		
end_for:
		addi $s1,$s1,1			#i++;
		j for
		
end:	
		lw $ra,0($sp)
		lw $s0,4($sp)
		lw $s1,8($sp)
		addiu $sp,$sp,12
		
		mov.d $f0,$f4			#return result;
		jr $ra
		
		
abs_:
		#$a0 = val;
		bge $a0,$0,end_abs		#val < 0;
		sub $a0,$0,$a0			#val = 0 - val;
		
end_abs:
		move $v0,$a0			#return val;
		jr $ra
