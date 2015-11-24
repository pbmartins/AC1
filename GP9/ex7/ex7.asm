.data
string: .asciiz "\nIntroduza o numero de discos: "
.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $v0, 4 # print_str("\nIntroduza o numero de discos: ");
	la $a0, string
	syscall
	
	li $v0, 5 # ndiscs = read_int();
	syscall
	or $t0, $v0, $0
	
	ble $t0, 0, endif # if(ndiscs > 0)
	or $a0, $t0, $0
	li $a1, 1
	li $a2, 3
	li $a3, 2
	jal tohanoi # tohanoi(ndiscs, 1, 3, 2);
	
endif:
	li $v0, 0 # return 0;
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra