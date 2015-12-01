.data
str1: .asciiz "\nIntroduza um numero: "
str2: .asciiz "\nTemperatura maxima: "
str3: .asciiz "\nTemperatura média: "
str4: .asciiz "\nMediana: "
str5: .asciiz "\nVariancia: "
str6: .asciiz "\nDesvio padrao: "
str7: .asciiz "\n"
array: .double 0:11 # static double array[] = new double[11];
.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $s0, 11 # n = 11;
	li $s1, -1 # i = -1;
	la $s3, array 
	
while:
	addi $s1, $s1, 1 # i++;
	bge $s1, $s0, endwhile
	la $a0, str1 # printf("\nIntroduza um numero: ");
	li $v0, 4
	syscall
	li $v0, 5 # scanf("%d", tmp);
	syscall
	# array[i] = f2c((double)tmp);
	mtc1.d $v0, $f12
	cvt.d.w $f12, $f12
	jal f2c
	sll $t0, $s1, 3
	add $t0, $s3, $t0
	s.d $f0, 0($t0)
	# printf("\n%f", array[i]);
	li $v0, 4
	la $a0, str7
	syscall
	li $v0, 3
	mov.d $f12, $f0
	syscall
	j while
	
endwhile:
	# printf("\nTemperatura máxima: %f", max(p, n));
	li $v0, 4
	la $a0, str2
	syscall
	or $a0, $s3, $0
	or $a1, $s0, $0
	jal max
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	# printf("\nTemperatura média: %f", average(p, n));
	li $v0, 4
	la $a0, str3
	syscall
	or $a0, $s3, $0
	or $a1, $s0, $0
	jal average
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	# printf("\nMediana: %f", sort(p, n));
	li $v0, 4
	la $a0, str4
	syscall
	or $a0, $s3, $0
	or $a1, $s0, $0
	jal sort
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	# printf("\nVariância: %f", var(p, n));
	li $v0, 4
	la $a0, str5
	syscall
	or $a0, $s3, $0
	or $a1, $s0, $0
	jal var
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	# printf("\nDesvio padrão: %f", stdev(p, n));
	li $v0, 4
	la $a0, str6
	syscall
	or $a0, $s3, $0
	or $a1, $s0, $0
	jal stdev
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra