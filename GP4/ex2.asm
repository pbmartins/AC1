.data
str: .space 20  # static char str[20];

.text
.globl main
main:
	# $t0 = num
	
	la $a0, str # Buffer
	ori $a1, $0, 20 # size of array of char
	ori $v0, $0, 8 # read_str(str, 20);
	syscall 
	
	or $t0, $0, $0 # num = 0
	la $t1, str # $t1 = 0(str) = p

whileloop:
	lb $t2, 0($t1) # $t2 = *p
	bne $t2, 0x00, loopbody # while(*p != '\0')
	j endloop
	
loopbody:
	blt $t2, 0x30, endif # if !(*p >= '0')
	bgt $t2, 0x39, endif # if !(*p <= '9')
	j ifbody
	
ifbody:
	addiu $t0, $t0, 1 # num++
	j endif
	
endif:	
	addi $t1, $t1, 1 # p++
	j whileloop
	
endloop:
	ori $v0, $0, 1
	or $a0, $t0, $0
	syscall # print_int10(num)
	jr $ra
	
