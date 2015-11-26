.data
str1: .asciiz " - "
.text
.globl main1c
main1c:
	addiu $sp, $sp, -16 # reserve space on stack
	sw $s0, 0($sp) # save $s0 on stack
	sw $s1, 4($sp) # save $s1 on stack
	sw $s2, 8($sp) # save $s2 on stack
	sw $s3, 12($sp) # save $s2 on stack
	or $s0, $a0, $0 # save $a0 on $s0
	or $s1, $a1, $0 # save $a1 on $s1
	or $s2, $ra, $0 # save $ra on $s2
	
	li $t0, 0 # i = 0
	
for:
	bge $t0, $s0, forend # for(i=0; i < argc; i++)
	
	li $v0, 11 # print_char('\n');
	li $a0, '\n'
	syscall
	
	sll $t1, $t0, 2 # $t1 = i * 4
	addu $t1, $s1, $t1 # $t1 = &argv[i]
	lw $t1, 0($t1)
	la $a0, 0($t1) # $a0 = *argv[i]
	li $v0, 4 # print_str(argv[i]);
	syscall
	
	li $v0, 4 # print_str(" - ");
	la $a0, str1
	syscall
	
	la $a0, 0($t1) # $a0 = *argv[i]
	or $s3, $t0, $0 # save $t0 on $s3
	jal strlen
	
	or $t0, $s3, $0
	or $a0, $v0, $0 # $a0 = $v0
	li $v0, 1 # print_int10(strlen(argv[i]));
	syscall
	
	addi $t0, $t0, 1 # i++
	j for
	
forend:
	or $ra, $s2, $0
	lw $s0, 0($sp) # save $s0 from stack
	lw $s1, 4($sp) # save $s1 from stack
	lw $s2, 8($sp) # save $s2 from stack
	lw $s3, 12($sp) # save $s0 from stack
	li $v0, 0 # return 0
	jr $ra
