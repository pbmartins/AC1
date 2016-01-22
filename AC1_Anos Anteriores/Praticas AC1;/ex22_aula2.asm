#Exercício2d)_Aula2;
#Imprime cada um dos 8 dígitos da quantidade armazenada em $t0;

#Funciona!
	
	.text
	.globl main
	
main: 	ori $t0,$0,0x12345678	#$t0 = op1
	#
	ori $t1,$0,0xF0000000	#$t1 = mask
	and $a0,$t0,$t1		#$a0 = $t0 & 0xF0000000
	srl $a0,$a0,28		#$a0 = $a0 >> 28  desloca 28 dígitos para a direita
	#
	
	#print_int16 '1'
	li $v0,34		
	syscall
	
	#print_char '\n'
	li $a0,'\n'		
	li $v0,11		
	syscall
	#
	
	srl $t1,$t1,4		#$t1 = $t1 >> 4
	and $a0,$t0,$t1		#$a0 = $t0 & 0x0F000000
	srl $a0,$a0,24		#$a0 = $a0 >> 24  desloca 24 dígitos para a direita
	#
	#print_int16 '2'
	li $v0,34		
	syscall	
	
	#print_char '\n'	
	li $a0,'\n'		
	li $v0,11		
	syscall
	#
	
	srl $t1,$t1,4		#$t1 = $t1 >> 4
	and $a0,$t0,$t1		#$a0 = $t0 & 0x00F00000
	srl $a0,$a0,20		#$a0 = $ao >> 20  desloca 20 dígitos para a direita
	#
	#print_int16 '3'
	li $v0,34		
	syscall	
	
	#print_char '\n'	
	li $a0,'\n'		
	li $v0,11		
	syscall
	#
	
	srl $t1,$t1,4		#$t1 = $t1 >> 4
	and $a0,$t0,$t1		#$a0 = $t0 & 0x000F0000
	srl $a0,$a0,16		#$a0 = $ao >> 16  desloca 16 dígitos para a direita
	#
	#print_int16 '4'
	li $v0,34		
	syscall	
	
	#print_char '\n'	
	li $a0,'\n'		
	li $v0,11		
	syscall
	#
	
	srl $t1,$t1,4		#$t1 = $t1 >> 4
	and $a0,$t0,$t1		#$a0 = $t0 & 0x0000F000
	srl $a0,$a0,12		#$a0 = $ao >> 12  desloca 12 dígitos para a direita
	#
	#print_int16 '5'
	li $v0,34		
	syscall	
	
	#print_char '\n'	
	li $a0,'\n'		
	li $v0,11		
	syscall
	#
	
	srl $t1,$t1,4		#$t1 = $t1 >> 4
	and $a0,$t0,$t1		#$a0 = $t0 & 0x00000F00
	srl $a0,$a0,8		#$a0 = $ao >> 8  desloca 8 dígitos para a direita
	#
	#print_int16 '6'
	li $v0,34		
	syscall	
	
	#print_char '\n'	
	li $a0,'\n'		
	li $v0,11		
	syscall
	#
	
	srl $t1,$t1,4		#$t1 = $t1 >> 4
	and $a0,$t0,$t1		#$a0 = $t0 & 0x000000F0
	srl $a0,$a0,4		#$a0 = $ao >> 4  desloca 4 dígitos para a direita
	#
	#print_int16 '7'
	li $v0,34		
	syscall	
	
	#print_char '\n'	
	li $a0,'\n'		
	li $v0,11		
	syscall
	#
	
	srl $t1,$t1,4		#$t1 = $t1 >> 4
	and $a0,$t0,$t1		#$a0 = $t0 & 0x0000000F
	srl $a0,$a0,0		#$a0 = $ao >> 0  desloca 0 dígitos para a direita
	#
	#print_int16 '8'
	li $v0,34		
	syscall	
	
	#print_char '\n'	
	li $a0,'\n'		
	li $v0,11		
	syscall
	#
	
	li $v0,10		#system call for exit
	syscall			
