.data
str1: .asciiz "\nArgumento "
str2: .asciiz ":"
str3: .asciiz "\nNumero de carateres: "
str4: .asciiz "\nNumero de maiusculas: "
str5: .asciiz "\nNumero de minusculas: "
str6: .asciiz "\nArgumento mais longo: "
.text
.globl main
main:
	or $s0, $0, $a0 # $s0 = argc
	or $s1, $0, $a1 # $s1 = &argv
	
	# $t0 = ch
	# $t1 = len
	# $t2 = maius
	# $t3 = minus
	# $t4 = max_len
	# $t5 = max
	# $t7 = j
	
	li $t6, 0 # i = 0
for:
	bge $t6, $s0, endfor
	sll $t8, $t6, 2 # $t8 = i * 4
	lw $t7, 0($s1) # $t7 = argv[i]
	addu $t7, $t7, $t8
	
while:
	lb $t9, 0($t7) # $t9 = *j
	beq $t9, '\0', endwhile # while (*j != '\0')
	addi $t1, $t1, 1 # len++
	
	ble $t9, 32, endif1 # if (*j > 32)
	addi $t0, $t0, 1 # ch++
	
endif1:
	sgt $s2, $t9, 64
	slti $s3, $t9, 91
	and $s2, $s2, $s3
	beqz $s2, elseif # if (*j > 64 && *j < 91)
	addi $t2, $t2, 1 # maius++
	j endif2
	
elseif:
	sgt $s2, $t9, 96
	slti $s3, $t9, 123
	and $s2, $s2, $s3
	beqz $s2, elseif # else if (*j > 96 && *j < 123)
	addi $t3, $t3, 1 # minus++
	j endif2

endif2:
	addiu $t7, $t7, 1 # j++
	j while
	
endwhile:
	li $v0, 4 # print_str("\nArgumento")
	la $a0, str1
	syscall
	li $v0, 1 # print_int10(i)
	or $a0, $t6, $0
	syscall 
	li $v0, 4 # print_str(": ")
	la $a0, str2
	syscall
	
	li $v0, 4 # print_str("\nNumero de carateres: ")
	la $a0, str3
	syscall
	li $v0, 1 # print_int10(ch)
	or $a0, $t0, $0
	syscall 
	
	li $v0, 4 # print_str("\nNumero de maisculas: ")
	la $a0, str4
	syscall
	li $v0, 1 # print_int10(maius)
	or $a0, $t2, $0
	syscall 
	
	li $v0, 4 # print_str("\nNumero de minusculas: ")
	la $a0, str5
	syscall
	li $v0, 1 # print_int10(minus)
	or $a0, $t3, $0
	syscall 
	
if:
	blt $t1, $t4, endif # if (len > max_len)
	or $t4, $t1, $0 # max_len = len;
	or $t5, $t7, $0 # max = argv[i];
endif:
	addi $t6, $t6, 1 # i++
	j for
	
endfor:
	li $v0, 4 # print_str("\nArgumento mais longo: ")
	la $a0, str6
	syscall
	
	la $a0, 0($t5) # print_str(*max)
	syscall
	
	jr $ra
	