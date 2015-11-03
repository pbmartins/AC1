.eqv SIZE3, 12
.data 
str1: .asciiz "Array"
str2: .asciiz "de"
str3: .asciiz "ponteiros"
array: .word str1, str2, str3
.text
.globl main
main:
	la $t0, array # $t0 = &array = p
	addiu $t1, $t0, SIZE3 # $t1 = pultimo
for:
	blt $t0, $t1, forbody
	j endfor
forbody:
	lw $t4, 0($t0) # $a0 = *p
	la $a0, 0($t4)
	li $v0, 4
	syscall # print_str(*p)
	li $v0, 11
	li $a0, '\n'
	syscall # print_char('\n')
	addiu $t0, $t0, 4 # p++
	j for
endfor:
	jr $ra
	
	
