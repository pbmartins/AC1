#Exercício1a)_Aula10;
#Programa que lê um valor inteiro multiplica-o por uma constante real e apresenta o resultado;

#Funciona!
		
		.include "tp3_macros.asm"
		.data
str:		.asciiz "\nIntroduza um número inteiro: "
str1: 		.asciiz "O resultado é: "
k1:		.float 2.59375
k2: 		.float 0.0
		.text
		.globl main
		
main:
	#$f0=val; $f12=res;
	 	 
		print_str(str)
		read_int($t0)
		
		mtc1 $t0,$f0			#$f0 = val;
		cvt.s.w $f0,$f0			#$f0 = (float) val;
		l.s $f1,k1			#$f1 = res = 2.59375;
		mul.s $f1,$f0,$f1		#$f1 = (float) val * 2.59375;
		#se colocasse $f12 em vez de $f1 já não era preciso colocar o mov.s $f12,$f1 para o print;
		
		print_str(str1)
		#print_float(res)
		mov.s $f12,$f1			#$f12 = (float) val * 2.59375;
		li $v0,2
		syscall
		
		l.s $f2,k2			#$f2 = res = 0.0;
		c.eq.s $f1,$f2			#$f1 == 0.0
		bc1f main
		
endif:		
		li $v0,0			#return 0;		
		jr $ra
		
		
		
		
		
