.data
str1: .asciiz "Nr. de parametros: "
str2: .asciiz "\nP"
str3: .asciiz ": "
.text
.globl main
main:
	or $s0, $0, $a1 # $s0 = &argv
	or $s1, $0, $a0 # $s1 = argc
	li $v0, 4 # print_str("Nr. de parametros: ");
	la $a0, str1
	syscall
	li $v0, 1 # print_int(argc)
	or $a0, $s1, $0
	syscall

	li $t0, 0 # $t0 = i = 0
for:
	bge $t0, $s1, endfor
	li $v0, 4 # print_str("\nP");
	la $a0, str2
	syscall
	
	li $v0, 1 # print_int(i)
	or $a0, $t0, $0
	syscall
	
	li $v0, 4 # print_str(": ");
	la $a0, str3
	syscall
	
	sll $t2, $t0, 2 # print_str(argv[i]);
	addu $t3, $s0, $t2
	lw $t3, 0($t3)
	la $a0, 0($t3)
	syscall
	
	addi $t0, $t0, 1 # i++
	j for
	
endfor:
	li $v0, 0 # return 0
	jr $ra