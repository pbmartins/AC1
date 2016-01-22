.data
lista: .word 0:10 # static int lista[SIZE]
str1: .asciiz "\nIntroduza um numero: "
str2: .asciiz "\nConteudo do array:\n"

.text
.globl main
main:
	la $t0, lista # $t0 = &array = p
	addiu $t1, $t0, 40 # $t1 = &array + 40 = *pUltimo
	
forloopread:
	bne $t0, $t1, flbodyread
	j endloopread
	
flbodyread:
	# print_str("\nIntroduza um numero:");
	la $a0, str1
	ori $v0, $0, 4
	syscall
	
	# read_int()
	ori $v0, $0, 5
	syscall
	
	# lista[i] = read_int()
	sw $v0, 0($t0)
	
	addiu $t0, $t0, 4 # p++
	
	j forloopread
	
endloopread:
	# Start sorting
	
	# int i, aux
	or $t1, $0, $0 # $t1 = i = 0
	or $t3, $0, $0 # $t3 = aux
	la $t0, lista # $t0 = &lista
	
externalloop:
	blt $t1, 9, externalbody # i < SIZE-1	
	j print
	
externalbody:
	addi $t2, $t1, 1 # $t2 = j = i + 1
	sll $t4, $t1, 2 # $t4 = 4 * i
	add $t5, $t0, $t4 # $t5 = &lista[i]
	j internalloop
	
internalloop:
	blt $t2, 10, internalbody # i < SIZE
	j externalend
	
internalbody:
	# Update values
	lw $t6, 0($t5) # $t6 = lista[i]

	sll $t7, $t2, 2 # $t7 = 4 * j
	add $t8, $t0, $t7 # $t8 = &lista[j]
	lw $t9, 0($t8) # $t9 = lista[j]
	
	bgt $t6, $t9, ifbody # if (lista[i] > lista[j])
	j internalend

ifbody:
	or $t3, $0, $t6 # aux = lista[i]
	sw $t9, 0($t5) # lista[i] = lista[j]
	sw $t3, 0($t8) # lista[j] = aux
	
	j internalend
	
internalend:
	addi $t2, $t2, 1 # j++
	j internalloop
	
externalend:
	addi $t1, $t1, 1 # i++
	j externalloop
	
print:
	# Start printing
	
	# *p = lista; ($t0)
	# int i;  ($t1)
	
	la $t0, lista # p = lista
	
	# print_str("\nConteudo do array:\n");
	la $a0, str2
	ori $v0, $0, 4
	syscall
	
	move $t1, $0 # i = 0
	
	j flprint
	
flprint:
	blt $t1, 40, flprintbody # i < SIZE * 4
	j endloop
	
flprintbody:
	# print_int10( lista[i] )
	ori $v0, $0, 1
	addu $t2, $t0, $t1 # $t2 = lista[i]
	lw $a0, 0($t2)
	syscall
	
	# print_str("-")
	ori $v0, $0, 11
	ori $a0, $0, 45
	syscall
	
	addi $t1, $t1, 4 # i++ 
	
	j flprint
	
endloop:
	jr $ra
