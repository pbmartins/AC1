#Exercício3a)_Aula3_home
#Multiplicações!

#

		.data
		
str:		.asciiz "Introduza dois números: "
str1:		.asciiz "Resultado: "

		.text
		.globl main
		
main:
	#$t0=res; $t1=i; $t2=mdor; $t3=mdo
	
		#print_str(str)
		li $v0,4
		la $a0,str
		syscall
	
		#read_int($t2)
		li $v0,5
		syscall
		move $t2,$v0
	
		#read_int($t3)
		li $v0,5
		syscall
		move $t3,$v0
	
		li $t0,0		#res=0;
		li $t1,0		#i=0;
	
while:		
		beqz $t2,end_for		#(mdor==0)
		bge $t1,4,end_for		#(i++>=4)
		addi $t1,$t1,1			#i++
		
		andi $t4,$t2,0x00000001		#$t4 = mdor & 0x00000001
		beqz $t4,if			#$t4 == 0
		add $t0,$t0,$t3			#res = res + mdo
		
if:
		sll $t3,$t3,1			#mdo = mdo << 1;
		srl $t2,$t2,1 			#mdor = mdor >> 1;
		
		j while
end_for:
		
		#print_str(str1)
		li $v0,4
		la $a0,str1
		syscall
		
		#print_intu(res=$t0)
		li $v0,36
		move $a0,$t0
		syscall
		
exit:
		jr $ra
	
