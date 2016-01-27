	.data
str1:	.asciiz "Introduza um número: "
str2: 	.asciiz "O valor em binário: "

	.text
	.globl main
main:	la $a0, str1	#declaração de uma string
	ori $v0,$0,4	#não entendo! porquê ori? print_string()
	syscall
	
	ori $v0, $0, 5	#read_int()
	syscall		#ler o número introduzido pelo utilizador
	move $t5,$v0	#vai colocar o valor que o utilizador introduziu em $t5
	
	la $a0,str2	#declaração de uma string
	ori $v0,$0,4	#print_string()
	syscall		#vai mostrar o valor em binário do valor que foi introduzido pelo utilizador
	
	#a partir daqui, começa as operações de transformação do número decimal em número binário!
	
	li $t0,0	#à variável $t0 é colocado o valor '0'
	
	#faz enquanto:
while:	bge $t0,32,endw	#bge(branch if greater or equal); avança para endw (final do programa) se $t0>=32
	andi $t1,$t5,0x80000000	#$t1 = $t5 + 0x80000000
	
	bne $t1,$0,else	#bne(branch if not equal); avança para o 'else' se $t1 for diferente de $0
	ori $a0,$0,'0'	#$a0 = $0 + '0'
	ori $v0,$0,11	#print_char()
	syscall		
	
	j end_if	#termina a instrução do if
	
	#começa a instrução do else
else:	ori $a0,$0,'1'	#$a0 = $0 + '1'
	ori $v0,$0,11	#print_char()
	syscall
	
	#acaba se:
end_if:	sll $t5,$t5,1	#sll(shift left logical); $t5 = $t5 << 1
	addi $t0,$t0,1	#$t0 = $t0 + 1
	j while		#volta ao while...
	
endw:	jr $ra		#termina a execução do programa
