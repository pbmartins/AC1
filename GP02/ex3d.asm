.data
str1: .asciiz "Introduza 2 numeros: "
str2: .asciiz "A soma dos dois numeros e': "

.text
.globl main
main:	la $a0, str1
	ori $v0, $0, 4
	syscall
	ori $v0, $0, 5
	syscall
	or $s0, $0, $v0 # First number
	ori $v0, $0, 5
	syscall
	or $s1, $0, $v0 # Second number
	la $a0, str2
	ori $v0, $0, 4
	syscall
	add $a0, $s0, $s1 # Sum of the 2 numbers
	ori $v0, $0, 1
	syscall
	jr $ra