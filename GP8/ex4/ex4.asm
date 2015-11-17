.data 
str1: .asciiz "\nOperacao desconhecida"
str2: .asciiz "\nNumero de argumentos errado"
.text
.globl main
main:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	
	# $s0 = val1
	# $s1 = val2
	# $s2 = res
	# $s3 = exit_code
	# $s4 = a1
	# $s5 = op
	
	or $s4, $a1, $0
	
	li $s3, 0 # exit_code = 0;
	
if:	bne $a0, 3, else # if(argc == 3)
	# val1 = atoi(argv[0]);
	lw $t0, 0($s4)
	la $a0, 0($t0)
	jal atoi
	or $s0, $v0, $0
	
	# val2 = atoi(argv[2]);
	lw $t0, 8($s4)
	la $a0, 0($t0)
	jal atoi
	or $s1, $v0, $0
	
	# op = argv[1][0];
	lw $t0, 4($s4)
	la $t0, 0($t0)
	lb $s5, 0($t0)
	
internalif:
	bne $s5, 'x', elseif1 # if(op == 'x')
	mul $s2, $s0, $s1 # res = val1 * val2;
	j endinternalif
	
elseif1:
	bne $s5, '/', elseif2 # else if(op == '/')
	or $a0, $s0, $0
	or $a1, $s1, $0
	jal division
	andi $s2, $v0, 0xFFFF # res = val1 / val2;
	j endinternalif
	
elseif2:
	bne $s5, '%', internalelse # else if(op == '%')
	or $a0, $s0, $0
	or $a1, $s1, $0
	jal division
	andi $s2, $v0, 0xFFFF0000 # res = val1 % val2;
	srl $s2, $s2, 16 # res = res >> 16;
	j endinternalif

internalelse:
	li $v0, 4 # print_str("\nOperacao desconhecida");
	la $a0, str1
	syscall
	
	li $s3, 1 # exit_code = 1;
	
endinternalif:
	j if2
	
else:
	li $v0, 4 # print_str("\nNumero de argumentos errados");
	la $a0, str2
	syscall
	
	li $s3, 2 # exit_code = 2;
	
if2:
	bne $s3, 0, endif2 # if(exit_code == 0)
	# print_int_ac1(val1, 10);
	or $a0, $s0, $0
	li $a1, 10
	jal print_int_ac1
	
	# print_char(op);
	li $v0, 11
	or $a0, $s5, $0
	syscall
	
	# print_int_ac1(val2, 10);
	or $a0, $s1, $0
	li $a1, 10
	jal print_int_ac1
	
	# print_char(op);
	li $v0, 11
	li $a0, '='
	syscall
	
	# print_int_ac1(res, 10);
	or $a0, $s2, $0
	li $a1, 10
	jal print_int_ac1
	
endif2:
	or $v0, $s3, $0 # return exit_code;
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addi $sp, $sp, 12
	
	jr $ra
	
