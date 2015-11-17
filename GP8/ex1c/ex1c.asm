.data
str: .asciiz "1010, o ano do fim das PPP" # static char str[]="1010, o ano do fim das PPP";

.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str
	jal atoi
	or $a0, $v0, $0
	li $v0, 1
	syscall # print_int10( atoi(str) );
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	li $v0, 0 # return 0;
	jr $ra
