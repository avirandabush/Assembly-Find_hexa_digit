# title: find hexa digit 
# author: Aviran Dabush
# decription: return the number of appearance of some hexa digit in a number
#	      and the position of the most left appearance
# input: none
# output: sum, count of appearances
######################## data segment #########################
.data 
	msgWelcome:	.asciiz "\nWelcome"
	msgOne: 	.asciiz "\nHexa number in 8th digits is: "
	theNumber:	.asciiz "0x05ccfcc2"
	msgTwo:		.asciiz "\nNumber of appearance of 'c': "
	msgThree:	.asciiz "\nPosition of the most left appearance: "
	
######################## code segment #########################
.text 
	
.globl main
	
main:
	#print welcome message
	la $a0,msgWelcome
	li $v0, 4
	syscall 
	
	#print the numer message
	la $a0, msgOne
	li $v0, 4
	syscall 
	
	#print the numer message
	la $a0, theNumber
	li $v0, 4
	syscall 
	#the hexa number
	li $a0, 0x05ccfcc2
	#the digit to be cheked is 'c'
	
	#go to the calculation function
	jal  Find_hexa_digit

exit:
	 # exit program
 	 li $v0, 10                
 	 syscall 
	
Find_hexa_digit:
	move $t1, $a0		#t1 = the input, a hexa number
	move $s2, $zero		#s2 = appearance counter
	move $s4, $zero		#s4 = position counter
	addi $s3, $zero	, -1	#s3 = position holder
	addi $s0, $zero, 0xf	#s0 = input mask
	addi $s1, $zero, 0xc	#s1 = digit mask
	
	loop:
		and $t3, $s0, $t1	#use the mask
		beq $t3, $s1, count	#check
	promot:
		sll $s0, $s0, 4
		sll $s1, $s1, 4
		addi $s4, $s4, 1
		beq $s1, $zero, end
		j loop
	
	count:
		addi $s2, $s2, 1
		move $s3, $s4
		j promot
		
	end:
		#print first input message
		la $a0, msgTwo
		li $v0, 4
		syscall 
		#print first input message
		move $a0, $s2
		li $v0, 1
		syscall 
		#print first input message
		la $a0, msgThree
		li $v0, 4
		syscall 
		#print first input message
		move $a0, $s3
		li $v0, 1
		syscall 
		
		jr $ra		#return
	

