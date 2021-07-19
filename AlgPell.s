.data
	msg1: .asciiz"Digite um número: "
	msg2: .asciiz"\nA raiz inteira é "
.text
main:
		li $t0, 0				#t0 = n
		li $t1, 1				#t1 = i
		
		li $v0, 4
		la $a0, msg1			#mostrar msg1
		syscall
			#Leitura de número
		li $v0, 5				# t2 = m 
		syscall
		add $t2, $v0, 0
		
		laco:
		
		sub $t2, $t2, $t1
		add $t1, $t1, 2
		add $t0, $t0, 1
		
		bge $t2, $t1, laco
		
		li $v0, 4
		la $a0, msg2
		syscall
		
		li $v0, 1
		add $a0, $t0, 0
		syscall