			#Calcular a base de um triangulo
.data
		msg1: .asciiz "\nDigite o valor da base do triangulo: "
		msg2: .asciiz"\nDigite a altura do triangulo: "
		msg3: .asciiz"\nA area do triangulo : "
.text
main:
		li $v0, 4
		la $a0, msg1
		syscall
		
		li $v0, 5
		syscall						#$t0 = base 
		add $t0, $v0, 0
		
		li $v0, 4
		la $a0, msg2
		syscall
		
		li $v0, 5
		syscall
		add $t1, $v0, 0				#$t1 = altura
		
		mul $t2, $t0, $t1			#$t2 = resultado da mult da base/altura
		div $t3, $t2, 2				#$t3 = resultado da div de $t2
		
		li $v0, 4
		la $a0, msg3
		syscall
		
		li $v0, 4
		add $a0, $t3, $t2
		syscall
		
		
		
		