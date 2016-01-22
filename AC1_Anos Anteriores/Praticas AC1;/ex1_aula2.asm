#Exercício1_Aula2;
#Operações lógicas bit a bit (bitwise);

#Funciona!
	
	.text
	.globl main
main: 	ori $t0,$0,0x12345678	#$t0 = op1
	ori $t1,$0,0x0000000F	#$t1 = op2
	#
	and $t2,$t1,$t0		#$t2 = $t0 AND $t1
	or $t3,$t1,$t0		#$t3 = $t0 OR $t1
	nor $t4,$t1,$t0		#$t4 = $t0 NOR $t1
	xor $t5,$t1,$t0		#$t5 = $t0 XOR $t1 
	#
	ori $t0,$0,0x12345678	#$t0 = op1
	ori $t1,$0,0x000FF000	#$t1 = op2
	and $t2,$t1,$t0		#$t2 = $t0 AND $t1 
	or $t3,$t1,$t0		#$t3 = $t0 OR $t1
	nor $t4,$t1,$t0		#$t4 = $t0 NOR $t1
	xor $t5,$t1,$t0		#$t5 = $t0 XOR $t1
	#
	ori $t0,$0,0x762A5C1B	#$t0 = op1;
	ori $t1,$0,0x89D5A3E4	#$t1 = op2;
	and $t2,$t1,$t0		#$t2 = $t0 AND $t1; 
	or $t3,$t1,$t0		#$t3 = $t0 OR $t1;
	nor $t4,$t1,$t0		#$t4 = $t0 NOR $t1;
	xor $t5,$t1,$t0		#$t5 = $t0 XOR $t1;
	#
	jr $ra			
	#li $v0,10		#exit
	#syscall		#
