#---------------------------------------
# 1.) Multiply Algorithm
#---------------------------------------

# set the address where you want this
# code segment
  org 0x0000

  ori   $2, $0, 9
  ori   $3, $0, 7

  lw $15, stackpointer($0)

  addi  $15, $15, -4
  sw	$2, 0($15)				#first stack ref

  addi  $15, $15, -4
  sw	$3, 0($15)				#second stack ref

  addi  $15, $15, -4
  sw	$4, 0($15)				#accumulator

  mult_loop:
  	#slt	$4, $3, $0			#is the multiplier less than zero?
  	#ori $5, $0, 1			#something to compare to

  	lw $4, 0($15)				#extract operands from stack
  	addi $15, $15, 4

  	lw $3, 0($15)
  	addi $15, $15, 4

  	lw $2, 0($15)
  	addi $15, $15, 4

    beq $3, $0, done    #if zero, exit

  	add $4, $4, $2			#add result to accumulator
  	addi $3, $3, -1			#decrement multiplier

    addi  $15, $15, -4
  	sw $2, 0($15)       #first stack ref

    addi  $15, $15, -4
    sw  $3, 0($15)       #second stack ref

    addi  $15, $15, -4
    sw  $4, 0($15)       #accumulator

    j	mult_loop

  done:
    addi $15, $15, 4

  	halt

stackpointer:
  org 0x200  
  cfw 0xFFFC
