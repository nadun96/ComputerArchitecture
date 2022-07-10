#Programme: Float adder
#Programmer: Nadun Udaraka Bandara
#Purpose: Add two floats
			
	.data
promptone: 	.asciiz 	"Enter a Floating Point number One: "
floatone: 	.float		0.0
prompttwo: 	.asciiz 	"Enter a Floating Point number Two: "
floattwo:	.float		0.0
sumoffloats: 	.asciiz 	"The Sum of Numbers you entered is "
sum:		.float		0.0

	.text
#prompt user input one
main:	la $a0, promptone
	li $v0, 4	
        syscall	

#get user input one     
	li $v0, 6
	syscall
	
#save it in memory	
	swc1 $f0, floatone        
                   	                     
#prompt user input two
	la $a0, prompttwo
	li $v0, 4	
        syscall	
        
#get user input two 
	li $v0, 6
	syscall
                                  
#save it in memory 
	swc1 $f0, floattwo	
        
#calculate sum
	lwc1	$f1, floatone
	lwc1	$f2, floattwo
	add.s	$f0,	$f1,    $f2	   
      
#move to retuen value registers
	mov.s	$f12,	$f0 
	
#store sum in memory
	swc1   $f12, sum	      
      
#sum string
	la $a0, sumoffloats
	li $v0, 4	
        syscall	
                                      
#print sum
	lwc1 $f12, sum
	li $v0, 2
	syscall

#end main
	li $v0, 10
	syscall


