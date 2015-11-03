.eqv SIZE, 3
.data 
str1: .asciiz "Array"
str2: .asciiz "de"
str3: .asciiz "ponteiros"
array: .word str1, str2, str3
.text
.globl main
main:
	or $t0, $0, $0 # $t0 = 0 = i
	la $t1, array # $t1 = &array
for:
	blt $t0, SIZE, forbody
	j endfor
forbody:
	sll $t3, $t0, 2
	addu $t2, $t1, $t3 # $t2 = &array[i]
	lw $t4, 0($t2) # $a0 = *array[i]
	la $a0, 0($t4)
	li $v0, 4
	syscall # print_str(array[i])
	li $v0, 11
	li $a0, '\n'
	syscall # print_char('\n')
	addi $t0, $t0, 1 # i++
	j for
endfor:
	jr $ra
	
	
