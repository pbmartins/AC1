.data
str1: .asciiz "Arquitectura de " # static char str1[]="Arquitectura de ";
str2: .byte 0:50 # static char str2[50];
str3: .asciiz "Computadores"

.text
.globl main
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str2
	la $a1, str1
	jal strcpy # strcpy(str2, str1);
	
	la $a0, str2
	la $a1, str3
	jal strcat # strcat(str2, "Computadores")
	
	or $a0, $v0, $0 # print_str( strcat(str2, "Computadores") );
	li $v0, 4
	syscall
	
	li $v0, 0 # return 0;
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

strcat:
	or $t0, $a0, $0 # char *p = dst;
	
while:
	lb $t1, 0($t0)
	beq $t1, '\0', endwhile
	addiu $t0, $t0, 1 # p++
	j while
	
endwhile:
	addiu $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	
	or $a0, $t0, $0 # $a0 = p
	# $a1 = src
	jal strcpy
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addiu $sp, $sp, 12
	
	or $v0, $a0, $0
	jr $ra