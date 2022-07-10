#Programme: grader
#Programmer: Nadun Udaraka Bandara
#Purpose: grade marks

	.data
promptstring: 	.asciiz		 "Enter your marks: "
resultstring: 	.asciiz		 "\nYour grade is: "
grade:		.byte 		 'D'

	.text		
#prompt user marks
main:	la $a0, promptstring	#load address of prompt a to register 4  
	li $v0, 4		#load immediate value 4 to register 2 
        syscall			#call service 4
                
#input marks
	li $v0, 5        	#load immediate value 5 to register 2 
 	syscall	       		#call service 5
 	add $t0, $v0, $zero	#copy value to register 8 from register 2
 	
#set initial value 					
        li $t1, 50	 	#load immmediate value 50 to register 9	 
 	bgtu $t0, $t1, markC	# if value in register 8 is greater than the value in register 9, jump to label markC
 	j End			# jump to label End
 
#marks for c 				
 markC: li $t1,60		#load immmediate value 60 to register 9
 	bgtu $t0, $t1, markB    #if value in register 8 is greater than the value in register 9, jump to label markB
 	li $t3, 'C'     	#load immediate value C to register 10 
 	sb $t3, grade		#store value in register 10 at the address label grade
 	j End			#jump to label End

 #marks for b  	
 markB: li $t1,70		#load immmediate value 70 to register 9
	bgtu $t0, $t1, markA    #if value in register 8 is greater than the value in register 9, jump to label markA
	li $t3, 'B'		#load immediate value B to register 10 
 	sb $t3, grade  		#store value in register 10 at the address label grade
 	j End			# jump to label End
 	
 #marks for a 	
 markA: li $t3, 'A'		#load immediate value A to register 10
	sb $t3, grade		#store value in register 10 at the address label grade
 	j End			# jump to label End
 	
#print result string
 End: 	la $a0, resultstring    
	li $v0, 4	
        syscall
        
#print grade 	             
        lb $a0 , grade	
        li $v0, 11
        syscall
        
 #end main
	li $v0, 10
	syscall         		
        						
