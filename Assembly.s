.data
	msg1: .asciiz"\nDigite o valor decimal:\n"
	msg2: .asciiz"\nO valor digitado convertido para binario:\n"
	msg3: .asciiz"\nValor invalido!\n"	
.text
main:
		
		li $t0, 1 		# valor de calcPot
		li $t1, 0		# valor do resultado
		li $t2, 0		# valor de dec
		li $t3, 0		# valor do cont
		li $t4, 0		# valor de mult
		li $t5, 0		# valor de dec-1			
		li $t6, 0		# valor do resto	
		li $t7, 0		# valor de calc

		li $v0, 4
		la $a0, msg1
		syscall
		
		li $v0, 5
		syscall
		add $t2, $v0, 0
		
		bgt $t2,1000, ERROR
		blt $t2, 1, ERROR
		j Comeco
		
		Comeco:
		add $t5, $t2, 0
		sub $t5, $t5, 1
				
		j While
		
		While:
		mul $t4, $t3, 2
		beq $t4, $t2, Calc
		beq $t4, $t5  Calc
		beq $t2, 1, Fim
		beq $t2, 0, Fim
		bgt $t4, $t2, Cont
		add $t3, $t3, 1
		j While
		
	
		Cont:
		li $t3, 0			# vai fazer o contador voltar para 1
		j While
		
		Calc:
		rem $t6, $t2, 2			# resto de divisÃƒÂ£o
		add $t2, $t3, 0			# atribuindo valor do contador no decimal
		mul $t7, $t0, $t6		# calculo para mostrar o bin
		add $t1, $t1, $t7		# calculo do resultado
		beq $t0, 0, CalcPot		# gerador da potencia
		mul $t0, $t0, 10		# potenciaÃƒÂ§ÃƒÂ£o
		j Comeco
		
		CalcPot:
		li $t0, 10
		j Comeco		
		
		ERROR:
		li $v0, 4
		la $a0, msg3
		syscall
		
		j main
	
		Fim:
		mul $t7, $t0, $t2
		add $t1, $t1, $t7
		j Mostra

		Mostra:
		li $v0, 4
		la $a0, msg2
		syscall
		
		li $v0, 1
		add $a0, $t1, 0
		syscall
