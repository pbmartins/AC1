#Exercício2b)_Aula2;
#Shifts;

#Funciona!
	
	.text
	.globl main
main: 	ori $t0,$0,0x12345678	#$t0 = op1
	#
	sll $t2,$t0,1	#$t2 = $t0 << 1
	srl $t3,$t0,1	#$t3 = $t0 >> 1
	sra $t4,$t0,1	#$t4 = ($t0 >> 1) | 1*sbit>>
	#
	sll $t2,$t0,4	#$t2 = $t0 << 4
	srl $t3,$t0,4	#$t3 = $t0 >> 4
	sra $t4,$t0,4	#$t4 = ($t0 >> 4) | 4*sbit>>
	#
	sll $t2,$t0,16	#$t2 = $t0 << 16
	srl $t3,$t0,16	#$t3 = $t0 >> 16
	sra $t4,$t0,16	#$t4 = ($t0 >> 16) | 16*sbit>> 
	#
	ori $t0,$0,0x862A5C1B	#$t0 = op1
	#testar com rotações onde os bits que saem do final da palavra passam para o seu início. colocar o valor a trocar numa
	#variável e só depois testar!
	#
	sll $t2,$t0,2	#$t2 = $t0 << 2
	srl $t3,$t0,2	#$t3 = $t0 >> 2
	sra $t4,$t0,2	#$t4 = ($t0 >> 2) | 2*sbit>>
	#
	sll $t2,$t0,4	#$t2 = $t0 << 4
	srl $t3,$t0,4	#$t3 = $t0 >> 4
	sra $t4,$t0,4	#$t4 = ($t0 >> 4) | 4*sbit>> 
	#
	jr $ra		#end
