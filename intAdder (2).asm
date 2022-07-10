#programme: intAdder
#Programmer: Nadun Udaraka Bandara
#purpose: Add and print twointegers
	.data
promptone:	.asciiz "Enter Integer One:"
prompttwo:	.asciiz "Enter Integer Two:"
result:		.asciiz "The Sum of Integers is "
valueone:	.word	0
valuetwo:	.word	0 
sum:		.word   0
	.text
#prompt user input one
main:	la $a0, promptone
	li $v0, 4	
        syscall	

#read user input one
	li $v0, 5
	syscall
	la $t0, valueone
	sw $v0, ($t0)

#prompt user input two
	la $a0, prompttwo
	li $v0, 4	
        syscall		
	
#read user input two
	li $v0, 5
	syscall
	la $t0, valuetwo
	sw $v0, ($t0)
	
#add values
	lw	$t0, valueone
	lw	$t1, valuetwo
	add	$t2,	$t0,    $t1	

#store sum in memory
	sw   $t2, sum	
	
		
#print result string
	la $a0, result
	li $v0, 4	
        syscall	
	
#print Integer
	lw $a0, sum
	li $v0, 1
	syscall
	
#end main
	li $v0, 10
	syscall
