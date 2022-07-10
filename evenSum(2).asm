#Programme: evenSum
#Programmer: Nadun Udaraka Bandara
#Purpose: Add two floats

	.data	
prompt:		.asciiz		"Enter a number: "	
promptresult:	.asciiz		"The Sum Of Even numbers from zero to this number is "
sum:		.word		0
number:		.word		0
	.text

#prompt a number from user
main: 	la $a0, prompt
	li $v0, 4	
        syscall	
        	
#read user input 
	li $v0, 5
	syscall  	
	sw $v0, number			#store number in memory		  	       
        add $t0, $v0 , $zero		#cpoy number to t0 register 8
	li $t1, 0 			#set t1 to zero
	
loop:	bge $t1, $t0, endLoop		#start counting
	addi $t1, $t1, 2
	add  $t2, $t2, $t1
	j loop
	        
endLoop: la $t0, sum                   #store sum in memory
	 sw $t2, ($t0)    
	 
#print result string	     	       		    	       		
        la $a0, promptresult
	li $v0, 4	
        syscall	
        
#print sum  
       lw $a0, sum      				
       li $v0, 1
       syscall
        					
#end main
	li $v0, 10
	syscall      	