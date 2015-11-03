.eqv SIZE, 3
.data 
str1: .asciiz "Array"
str2: .asciiz "de"
str3: .asciiz "ponteiros"
array: .word str1, str2, str3
str4: .asciiz "\nString #"
str5: .asciiz ": "
.text
.globl main
main:
	or $t0, $0, $0 # $t0 = 0 = i
	la $t1, array # $t1 = &array
for:
	blt $t0, SIZE, forbody
	j endfor
forbody:
	li $v0, 4 # print_str( "\nString #" );
	la $a0, str4
	syscall
	li $v0, 1 # print_int10( i );
	or $a0, $t0, $0
	syscall 
	li $v0, 4 # print_str( ": " );
	la $a0, str5
	syscall
	li $t6, 0 # $t6 = j = 0
	
	sll $t3, $t0, 2
	addu $t2, $t1, $t3 # $t2 = &array[i]
	lw $t4, 0($t2) # $a0 = *array[i]
	
while:	
	addu $t5, $t4, $t6 # $t5 = &array[i][j]
	lb $t7, 0($t5) # t7 = *array[i][0]
	
	beq $t7, '\0', endwhile 
	
	li $v0, 11
	or $a0, $t7, $0
	syscall # print_char(array[i][j])
	li $v0, 11
	li $a0, '-'
	syscall # print_char('\n')
	addi $t6, $t6, 1 # j++
	j while
	
endwhile:
	addi $t0, $t0, 1 # i++
	j for
endfor:
	jr $ra
	
	
