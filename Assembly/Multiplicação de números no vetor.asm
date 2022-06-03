
.data
	v: .space 1000 # alocando 1000 bytes para o vetor 
	#v: .word 1,55,666,88 (outra forma)

.text
	la $s0, v # s0 = endereço de V

# Ler N 
	addi $v0, $0, 5   # li $v0, 5 
	syscall
	
	add $t0, $0, $v0 # t0 = N
# Ler M 
	addi $v0, $0, 5
	syscall
	add $t1, $0, $v0 # t1 = M
	
	add $t4, $0, 1 # t4 = 1 		contador
	add $t0, $t0, 1 # N = N +1
	
ini_1:	beq $t4, $t0, fim_1 # if ( contador == (N+1)
	mul $t3, $t1, $t4  # aux = M * contador
	sw $t3, 0($s0)
	addi, $s0, $s0, 4 #  s0 += 4 
# printando na tela 	
	addi $v0, $0, 1  
	add $a0,$0, $t3
	syscall
	addi $t4, $t4, 1 # t4++
	j ini_1
fim_1:
	
