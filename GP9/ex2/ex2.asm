.eqv MAX_SIZE, 10
.eqv MAX_SIZE1, 11
.data
string: .asciiz "String too long. Nothing done!\n"
string2: .space MAX_SIZE1
.text
.globl main
main:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	lw $a1, 0($a1)
	sw $a1, 8($sp)
	
	or $s0, $a1, $0 # *char p = argv;
	la $s1, string2 # *char p2 = string2;
	
	bne $a0, 1, endif
	or $a0, $s0, $0 # strlen(p)
	jal strlen
	or $t0, $v0, $0
	
	bgt $t0, MAX_SIZE, else # if (strlen(p) <= MAX_SIZE)
	or $a0, $s1, $0
	lw $a1, 8($sp)
	jal strcpy # strcpy(p2, argv);
	
	li $v0, 4 # printf("%d", string2);
	lw $a0, 8($sp)
	syscall
	
	li $v0, 0 # return 0;
	j endif
	
else:
	li $v0, 4 # printf("String too long. Nothing done!\n");
	la $a0, string
	syscall
	
	li $v0, 1 # return 1;
endif:
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addi $sp, $sp, 12
	
	jr $ra