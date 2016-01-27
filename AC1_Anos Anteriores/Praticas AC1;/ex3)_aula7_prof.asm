#Exercício3)_Aula7_prof;
#Tem de ser incluído o ficheiro de exception handler;
		
			.include "tp3_macros.asm"
			.eqv STR_MAX_SIZE,10
			.data
		
s_too_long:		.asciiz "String too long. Nothing done!\n"
s_buf:			.space STR_MAX_SIZE

			.text
			.globl main
			
main:
			addiu $sp,$sp,-4		#espaço para guardar $ra
			sw $ra,0($sp)
		#$a0=argc; $a1=argv;
			bne $a0,1,main_ex_0		#if(argc!=1) return_0
			#argc=1
			lw $a0,0($a1)			#$a0=argv[0]
			jal strlen
		#if(strlen(argv[0]) <= STR_MAX_SIZE)
			bgt $v0,STR_MAX_SIZE,else
		#strcpy(buf, argv[0])
			lw $a1,0($a1)			#$a1=argv[0]
			la $a0,s_buf			#$a0=dst
			jal strcpy			#return $v0=$a0
			move $a0,$v0
			print_str_simple		#print_str(buf)
			j main_ex_0
			
else:
			print_str(s_too_long)
			li  $v0,1			#$v0=1
			j main_ex
			
main_ex_0:
			li $v0,0			#$v0=0
				
main_ex:
			lw $ra,0($sp)			#restore $ra
			addiu $sp,$sp,4			#restore $sp
			
			jr $ra
			
strcpy:
			li $t0,0			#i=0
			
scp_do_w:
			## $0 - $a0
			addu $t1,$a0,$t0		#dst = dst + i
			addu $t2,$a1,$t0		#src = src + i
			#
			lb $v0,0($t2)			#$v0=src[i]
			sb $v0,0($t1)			#dst[i]=src[i]
			beqz $v0,scp_end		#if(src[i]==0) exit
			#
			addiu $t0,$t0,1			#i++
			j scp_do_w
			
scp_end:
			move $v0,$a0			#return 'dst'
			jr $ra		
			
strlen:
			li $v0,0			#len=0
			
sln_lp:
			lb $t0,0($a0)			#while(*s!='\0')
			beqz $t0,sln_ex
			addi $v0,$v0,1			#len++
			
			addi $a0,$a0,1			#s++
			j sln_lp
		#$v0=len!
			
sln_ex:
			jr $ra
