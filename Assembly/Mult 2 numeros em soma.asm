.data
	r:.word 0

.text 
	la $s0,r
	
	addi $v0,$0,5
	syscall
	add $t0,$0,$v0	#t0=m
	
	
	addi $v0,$0,5
	syscall
	add $t1,$0,$v0	# t1=n
	
	addi $t2,$0,1
	
	add  $t3, $t0, $0 # t3 = m
	bgt $t0, $t1, Mmenor
	
	add  $t3, $t1, $0 # t3 = n
	
Mmaior:	beq $t2, $t0, end # cont== m
	
	add  $t3, $t3, $t1
	
	
	addi $t2,$t2,1
	
  j Mmaior
  
Mmenor: beq  $t2, $t1,end

	add  $t3, $t3, $t0
	

 	addi $t2,$t2,1
 	
  j Mmenor
end: 
	sw $t3, 0($s0)
	
	add  $a0,$0,$t3
	addi $v0, $0, 1
	syscall