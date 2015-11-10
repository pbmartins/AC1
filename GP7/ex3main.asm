.eqv STR_MAX_SIZE, 10
.eqv STR_MAX_SIZE_1, 11

.data
buf: .byte 0:STR_MAX_SIZE_1 # static char buf[STR_MAX_SIZE + 1];
str1: .asciiz "String too long. Nothing done!\n"

.text 
.globl mainex3
mainex3:
	bne $a0, 1, endif # if(argc == 1)

ifbody:
	addiu $sp, $sp, -12 # save on stack
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	
	lw $a0, 0($a1) # $a0 = &argv[0]
	la $a0, 0($a0) # $a0 = argv[0]
	jal strlen # strlen(argv[0])
	or $t0, $v0, $0 # $t0 = strlen(argv[0])
	bgt $t0, STR_MAX_SIZE, else # if(strlen(argv[0]) <= STR_MAX_SIZE)
	
ifbody2:
	lw $a1, 8($sp) # $a0 = &argv[0]
	lw $a1, 0($a1)
	la $a1, 0($a1) # $a0 = argv[0]
	la $a0, buf
	jal strcpy # strcpy(buf, argv[0]);
	
	or $a0, $v0, $0 # print_str(buf);
	li $v0, 4
	syscall
	
	j endif
	
else:
	li $v0, 4 # print_str("String too long. Nothing done!\n")
	la $a0, str1
	syscall
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addiu $sp, $sp, 12
	
	li $v0, 1 # return 1
	jr $ra
	
endif:
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addiu $sp, $sp, 12
	
	li $v0, 0 # return 1
	jr $ra
	
