	.include "tp3_macros.asm"
	
	.data
	
#str: 	.space 20
#str1:	.asciiz "\nIntroduza uma String (length<20): "
str2:	.asciiz "\nnMinusculas: "
str3:	.asciiz "\nnMaiusculas: "
str4:	.asciiz "\nPalavra com maior nuemero de caracteres: "
	
	.text
	.globl main
	
main:
	#print_str(str1)
	#read_str(str, 20)
	
	or $t1, $zero, $a0	# argc
	or $t5, $zero, $a1	# argv
	ori $t2, $0, -1
	ori $t3, $0, -1
	li $t0, 0		# i=0
	
for_loop:
	bge $t0, $t1, end_for
	li $t4, 0		# cont_size=0
	li $t7, 0		# cont_Min=0
	li $t6, 0		# cont_Ma=0
	sll $t8, $t0, 2
	addu $t8, $t8, $t5
	lw $t8, 0($t8)
	
while:
	lbu $t9, 0($t8)
	beq $t9, '\0', end_while
	blt $t9, 'a', else_if
	bgt $t9, 'z', else_if
	addi $t7, $t7, 1
	j end_if
	
else_if:
	blt $t9, 'A', end_if
	bgt $t9, 'Z', end_if
	addi $t6, $t6, 1
	
end_if:
	addi $t4, $t4, 1
	addiu $t8, $t8, 1
	j while

end_while:
	bge $t3, $t4, end_if2
	or $t3, $0, $t4
	or $t2, $0, $t0
	
end_if2:
	sll $t8, $t0, 2
	add $t8, $t8, $t5
	lw $a0, 0($t8)

	li $v0,4
		syscall
	
	
	print_str(str2)	# Minúsculas
	print_int($t7)
	
	print_str(str3)	# Maiúsculas
	print_int($t6)
	
	print_str(str4)
	print_int($t2)
	
	addi $t0, $t0, 1
	j for_loop
	
end_for:

exit:
	done