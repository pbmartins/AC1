.data
array: .double 1.0, 7.0, 3.0, 4.9, 2.5
str1: .asciiz "\nMaximo: "
str2: .asciiz "\nMediana: "
str3: .asciiz "\nArray ordenado: "
str4: .asciiz " - "
.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str1
	li $v0, 4
	syscall
	
	la $a0, array
	li $a1, 5
	jal max
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	la $a0, str2
	li $v0, 4
	syscall
	
	la $a0, array
	li $a1, 5
	jal sort
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	la $a0, str3
	li $v0, 4
	syscall
	
	li $t0, 0
	li $t1, 5
	la $t2, array

for:
	bge $t0, $t1, endfor
	sll $t3, $t0, 3
	add $t3, $t2, $t3
	l.d $f12, 0($t3)
	li $v0, 3
	syscall
	la $a0, str4
	li $v0, 4
	syscall
	addi $t0, $t0, 1
	j for
	
endfor:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
