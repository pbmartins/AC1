.data
array: .double 2.5, 1.3, 7.4, 4.1 # double array[] = {1, 3, 7, 4};
str1: .asciiz "Sorted!\nMediana: "
str2: .asciiz "\nMax: "
.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	# Sort
	la $a0, array
	li $a1, 4
	jal sort
	
	li $v0, 4
	la $a0, str1
	syscall
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	# Max
	la $a0, array
	li $a1, 4
	jal max
	
	li $v0, 4
	la $a0, str2
	syscall
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
