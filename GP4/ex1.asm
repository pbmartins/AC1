.data
str: .space 20  # static char str[20];

.text
.globl main
main:
	# $t0 = num
	# $t1 = i
	
	la $a0, str # Buffer
	ori $a1, $0, 20 # size of array of char
	ori $v0, $0, 8 # read_str(str, 20);
	syscall 
	
	la $t2, str # $t2 = 0(str)
	
	or $t0, $0, $0 # num = 0
	or $t1, $0, $0 # i = 0
	
whileloop:
	add $t3, $t2, $t1 # add i to pointer
	lb $t4, 0($t3) # $t4 = str[i]
	
	
	bne $t4, 0x00, loopbody
	j endloop
	
loopbody:
	blt $t4, 0x30, endif # if !(str[i] >= '0')
	bgt $t4, 0x39, endif # if !(str[i] <= '9')
	j ifbody
	
ifbody:
	addiu $t0, $t0, 1 # num++
	j endif
	
endif:	
	addiu $t1, $t1, 1 # i++
	j whileloop
	
endloop:
	ori $v0, $0, 1
	or $a0, $t0, $0
	syscall # print_int10(num)
	jr $ra
	
