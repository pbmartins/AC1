#Exercício5_Aula6_prof
#Imprime os valores passados como argumento e diz qual a maior string e quantas letras e números tem!

			.include "tp3_macros.asm"
			.data
		
s_nbr_params:		.asciiz "Nr. de parâmetros: "
s_param_p:		.asciiz "\nP"
s_sep:			.asciiz ": "
s_length: 		.asciiz "; Length: "
s_alphalength:		.asciiz "; AlphaLength: "
s_longest:		.asciiz "\nLongest String is: "

		.text
		.globl main
		
main:
		#$a0 = argc; $a1 = argv; $a2 = argv + i * 4; $t0 = i; $t2 = i*4; $v0=value;
		
		move $t1,$a0			#save $a0, used by syscalls!
		
		print_str(s_nbr_params)
		print_int($t1)
		
		li $t0,0			#i=0
		li $t7,0			#maxlen=0
		li $t8,-1			#i_maxlen=-1
		
for_lp1:
		bge $t0,$t1,end_for		#if(i<argc)
		
		print_str(s_param_p)
		print_int($t0)
		print_str(s_sep)
		
		sll $t2,$t0,2			#$t2 =i * 4
		addu $a2,$a1,$t2		#locate: argv + i * 4
		lw $a0,0($a2)			#$a0 = argv[i] = s_i
		
		print_str_simple		#faz print de uma string sem parâmetros;
	
		
strlen:		li $v1,0
		move $a2,$a0			#manter $a0!
		
sl_lp:
		lb $t4,0($a2)			#$t4=char
		beqz $t4,sl_exit		#str_end
		addi $v1,$v1,1			
		addi $a2,$a2,1			#next char
		b sl_lp				#continue
		
sl_exit:
		ble $v1,$t7,sl_not_max		
		move $t7,$v1			#$t7=maxlen=len
		move $t8,$t0			#$t8=i_maxlen=i
		
sl_not_max:
		move $a2,$a0			
		print_str(s_length)
		#print_int(strlen(argv[i]))
		print_int($v1)
		
#end_for1:
#		print_str(s_longest)
#		sll $t2,$t8,2
#		print_int($v1) 
		
al_len:
		li $v1,0
		
al_lp:
		lb $t4,0($a2)
		beqz $t4,al_exit
		bltu $t4,'A',al_cont
		bgtu $t4,'z',al_cont
		
		bleu $t4,'Z',al_is
		bltu $t4,'a',al_cont
		
al_is:
		addi $v1,$v1,1
		
al_cont:
		addi $a2,$a2,1
		j al_lp

al_exit:
		print_str(s_alphalength)
		print_int($v1)
		
		addiu $t0,$t0,1			#i++;			
		b for_lp1
		
end_for:
		print_str(s_longest)
		sll $t2,$t8,2
		
		addu $a2,$a1,$t2
		lw $a0,0($a2)
		print_str_simple
		
		done
