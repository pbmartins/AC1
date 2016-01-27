   	 	.data
      
lista:      	.word 10
str:      	.asciiz "Insira valores\n"
res:      	.asciiz "O seu array ordenado\n"
      
      		.text
      		.globl main
         
main:     
		 li $t1, 0         #int i;
      		li $t2, 0         #int aux;
     		 la $t3, lista         #p = lista;

      
     		 #inserir aqui o código para leitura de valores e
     		 #preenchimento do array -> fillarray
      		#usando acesso por ponteiro      
     		 la $a0, str
     		 li $v0, 4
      		syscall            #print_str("Insira valores\n");
      
fillarray:   
		bge $t1, 10, endfillarray
      
     		 li $v0, 5
     		 syscall            #read_int();
      
      		sw $v0, 0($t3)
      
     		 addiu $t3, $t3, 4      #p++;
      		addi $t1, $t1, 1      #i++;
      
     		 j fillarray

endfillarray:   
		la $t3, lista
     		 li $t1, 0         #reinicia o valor de i a 0
      

dowhile:   
		#bne $t0, 0, enddowhile

     		 li $t0, 0
     		 la $t3, lista
     		 li $t1, 0
     	 
for:      
		bge $t1, 9, endfor

#      if (lista[i] > lista[i+1])
#      {
#         aux = lista[i];
#         lista[i] = lista[i+1];
#         lista[i+1] = aux;
#         houveTroca = TRUE;
#      }

if:      	
		lw $t4, 0($t3)         #$t4 <- p->lista[i]
      		lw $t5, 4($t3)         #$t5 <- p->lista[i+1]
      
     		 ble $t4, $t5, endif
     		 move $t2, $t4         #aux = lista[i];
     		 move $t4, $t5         #lista[i] = lista[i+1];
      		move $t5, $t2         #lista[i+1] = aux;
     		 li $t0, 1         #houveTroca = TRUE;

endif:     	 
		sw $t4, 0($t3)         #No fim das trocas é necessário armazenar os valores
     		 sw $t5, 4($t3)         #nos locais corretos
      
      		addi $t1, $t1, 1      #i++;
      		addiu $t3, $t3, 4      #p++;
      
      		j for

endfor:     	
		 bnez $t0, dowhile
         
enddowhile:  
		 #inserir aqui o código de impressão do conteúdo do array
     		 #usando acesso indexado
      
     		 li $t1, 0         #reiniciar o valor de i
     		 la $t3, lista         #reiniciar a lista
      
      
		la $a0, res
     		 li $v0, 4
     		 syscall            #print_str("O seu array ordenado\n")
      
      
printarray:  
		 bgt $t1, 9, endprintarray

     		 sll $t2,$t1,2         #shift left logial 2 é o mesmo que multiplicar por 4
                  			#como $t2 já não vai ser necessário para nada, podemos usá-lo para esta função
                  
      		addu $t6, $t2, $t3      #&lista[i] = i + &lista

      
      		lw $a0, 0($t6)
     		li $v0, 1
     		syscall            #print_int10(lista[i]);
      
     		 la $a0, 0x20
     		 li $v0, 11
     		 syscall
      
      		addi $t1, $t1, 1      #i++;
      
     		 j printarray
		
endprintarray:   jr $ra