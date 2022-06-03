.data 

	str:  .asciiz "Digite a temperatura da sala de servidores"
	str1:  .asciiz "Digite a potência desejada[0]Desligado/[1]Fraca/{2]Media/[3]Máxima"
	msg0: .asciiz "Desligado"
	msg1: .asciiz  "Fraca"
	msg2: .asciiz  "Media"
	msg3: .asciiz  "Máxima"
.text

IN:#temperatura
	la $a0, str
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	add $t0, $0, $v0#Pega a temperatura
	la $a0, str1
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	add $t1, $0, $v0#Pega a potência
 	
 	
 	
 OUT:
#case 0
  	ble $t0, 0 , Teste 0

#case 1
	beq $t0, 1, Teste 0
#case 2
	beq $t0, 2, Teste 0
#case 3	
	beq $t0, 3, Teste 0
 
#0 desligado 1fraca 2 media 3 máxima

Teste 0:
#case -1
  	ble $t0,-1, Desligado
#case 0
	beq $t0, 0, Desligado
#case 1
	ble $t0, 15, Teste 1
#case 2
	ble $t0, 50, Teste 1
#case 3	
	ble $t0, $s4, Maxima
j switch
Teste 1:
	bge $t0, 0, Fraca
	bge $t0,15, Media 
	

Desligado:
	la $a0, msg0
	li $v0, 4
	syscall

Fraca:
	la $a0, msg1
	li $v0, 4
	syscall

Media:
	la $a0, msg2
	li $v0, 4
	syscall
	add $t0,
Maxima:
	la $a0, msg3
	li $v0, 4
	syscall