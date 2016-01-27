#Exercício5a)_Aula6_home;

#

		.data
str1:		.asciiz "-Maiúsculas: "
str2:		.asciiz "-Minúsculas: "
str3:		.asciiz "Maior palavra: "
	
		.text
		.globl main
		
main:
		#$t0=i; $t1=argc; $t2=idx_max; $t3=size_max; $t4=count_size;
		#$t5=argv; $t6=cMa; $t7=cMi; $t8=p, $t9=*p;
		
		or $t1,$zero,$a0		#$t1=argc (para efeitos de impressão!);
		or $t5,$zero,$a1		#$t5=argv (para efeitos de impressão!);
		
		li $t2,-1			#idx_max=-1;
		li $t3,-1			#size_max=-1;
		
		li $t0,0			#i=0;
		
for:
		li $t4,0			#count_size=0;
		li $t7,0			#cMi=0;
		li $t6,0			#cMa=0;
		
		bge $t0,$t1,end_for		#i>=argc
		
		sll $t8,$t0,2			#$t8=i*4;
		addu $t8,$t8,$t5		#$t8=argv + i*4;
		lw $t8,0($t8)			#($t8)p=argv[i](argv+i*4($t8));
		
while:
		lb $t9,0($t8)			#$t9=*p;
		beq $t9,'\0',end_while		#while(*p=='\0');
		blt $t9,'a',else_if		#*p<'a';
		bgt $t9,'z',else_if		#*p>'z';
		addi $t7,$t7,1			#cMi++;
		j end_if
		
else_if:
		blt $t9,'A',end_if		#*p<'A';
		bgt $t9,'Z',end_if		#*p>'Z';
		addi $t6,$t6,1			#cMa++;
		
end_if:
		addi $t4,$t4,1			#count_size++;
		addiu $t8,$t8,1			#p++;
		j while

end_while:	
		bge $t3,$t4,end_if2		#size_max>=count_size;
		la $t3,0($t4)			#size_max=count_size;
		la $t2,0($t0)			#idx_max=i;
		
end_if2:
		sll $t8, $t0, 2
		add $t8, $t8, $t5
		lw $a0, 0($t8)
	
		#print_str(argv[i])
		li $v0,4
		#la $a0,$t8
		syscall
		
		#print_char('-')
		li $a0,'-'
		li $v0,11
		syscall
	
		#print_int10(count_size)		
		li $v0,1
		move $a0,$t4
		syscall
		
		#print_str(str1)
		li $v0,4
		la $a0,str1
		syscall
		
		#print_int10(cMa)
		li $v0,1
		move $a0,$t6
		syscall
		
		#print_str(str2)
		li $v0,4
		la $a0,str2
		syscall
		
		#print_int10(cMi)
		li $v0,1
		move $a0,$t7
		syscall
		
		j for

end_for:
		#print_str(str3)
		li $v0,4
		la $a0,str3
		syscall
		
		lw $t5,0($t2)			#($t5=argv[idx_max];
		
		#print_int10(argv[idx_max])
		li $v0,1
		move $a0,$t5
		syscall		

end:
		jr $ra	
		
			
		
		
		
		