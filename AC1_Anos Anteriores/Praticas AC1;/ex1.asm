	.text
	.globl main
main: 	ori $t0,$0,3#(val_x) 	#$t0=3 onde se substituiu o val_x por 3; quando queremos substituir uma vari�vel por
				#um valor concreto, ent�o usamos o "ori"; no caso de querermos, por exemplo, or $t0,$0,val_x
				#usamos no in�cio o "or" pois n�o vai haver nenhum valor concreto na linha de c�digo.
	ori $t2,$0,8		#$t2=8;
	add $t1,$t0,$t0		#$t1 = x + x = 2 * x; ou seja, vai haver a soma dos valores correspondentes a 
				#"$t0" + "$t0" e o valor desta soma, neste caso em concreto (add) vai ser armazenado
				# na vari�vel chamada $t1;
	add $t1,$t1,$t2		#$t1 = 2 * x + 8; em que 2 * x � o valor guardado em $t1 e 8 o valor guardado em $t2
				#mais uma vez, o valor desta soma vai ser guardado em $t1;
	jr	$ra		#FIM DO PROGRAMA  
