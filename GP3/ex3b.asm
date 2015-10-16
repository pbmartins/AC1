.data
str1: .asciiz "Introduza dois numeros:\n"
str2: .asciiz "Resultado: "

.text
.globl main
main:
	# Initialize variables
	li $t2, 0 # i = 0
	li $t3, 0 # res = 0
	
	# Print string
	ori $v0, $0, 4 # set to print_str
	la $a0, str1 
	syscall # print_str("Introduza dois numeros: ")
	
	# Read values from stdin
	ori $v0, $0, 5 # set to read_int
	syscall
	or $t0, $v0, $0 # mdor = read_int()
	
	ori $v0, $0, 5 # set to read_int
	syscall
	or $t1, $v0, $0 # mdo = read_int()
	
whileloop:
	# Check loop conditions
	sne $t4, $t0, 0 # mdor != 0
	slti $t5, $t2, 16 # i < 16
	addi $t2, $t2, 1 # i++
	and $t6, $t4, $t5 # (mdor != 0) && (i++ < 16)
	beq $t6, 0, endwhile
	
	# Inside
	andi $t7, $t0, 0x00000001 # mdor & 0x00000001
	bne $t7, 0, ifcond # if( (mdor & 0x00000001) != 0 )
	j loopfinal
	
ifcond:
	add $t3, $t3, $t1 # res = res + mdo
	j loopfinal
	
loopfinal:
	sll $t1, $t1, 1 # mdo = mdo << 1
	srl $t0, $t0, 1 # mdor = mdor >> 1
	j whileloop
	
endwhile:
	# Print string
	ori $v0, $0, 4 # set to print_str
	la $a0, str2
	syscall # print_str("Resultado: ")
	
	# Print result
	ori $v0, $0, 1
	or $a0, $t3, $0
	syscall
	