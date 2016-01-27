	.data

lista:	.space 40 #define size 10; static int lista(10); cada int ocupa 4 bits
	.align 2
str1:	.asciiz "\nIntroduza um numero: "
	.align 2
str2:	.asciiz "\nConteudo do array:\n"
	.align 2
str3:	.asciiz ";"
	
	.text
	.globl main

main:
	la $t1, lista
	li $t2, 10
	sll $t0, $t2, 2
	addu $t0, $t0, $t1
	
while:	bgeu $t1, $t0, do
	
	la $a0, str1
	ori $v0, $0, 4
	syscall
	
	ori $v0, $0, 5		# read_int()
	syscall
	
	or $t2, $0, $v0
	
	sw $t2, 0($t1)
	
	addiu $t1, $t1, 4

	j while
	

do: 	li $t4, 0		# houveTroca=false(0)
	li $t0, 0		# i=0
for: 	bge $t0, 9, endf	# for (i=0; i<size-1

if:	sll $t3, $t0, 2		# temp=i*4
	la $t1, lista		# $t1 < &(lista(0))
	addu $t1, $t1, $t3	# $t1=&lista(i)
	
	lw $t5, 0($t1)		# lista(i)<$t5
	lw $t6, 4($t1)		# lista(i+1)<$t6
	
	bleu $t5, $t6, endif	# if(lista(i)>lista(i+1)
	
	sw $t5, 4($t1)
	sw $t6, 0($t1)
	
	ori $t4, $t4, 1		# houveTroca=true(1)
	
endif:	addi $t0, $t0, 1	# i++

	j for

endf:	beq $t4, 1, do		# while(houveTroca==true)

#c—digo de impressao do conteudo do array

	la $t1, lista		# p=lista
	
	la $a0, str2
	ori $v0, $0, 4		# print_str(str2)
	syscall
	
	li $t2, 0		# i=0

	
while1:	bge $t2,10, endw1	# for(i=0; i<10;

	sll $t3, $t2, 2		# tem=i*4
	addu $t3, $t1, $t3	# temp=&lista(i)
	lw $t4, 0($t3)		# $t4=*lista(i)
	
	or $a0, $0, $t4
	ori $v0, $0, 1		# print_int10(lista(i))
	syscall
	
	la $a0, str3
	ori $v0, $0, 4		# print_str(str3)
	syscall
	
	addi $t2, $t2, 1	# ;i++)
	
	j while1
	
endw1: jr $ra