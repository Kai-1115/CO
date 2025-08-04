# 113550021
# sum_of_fibonacci
.data
	input_msg: .asciiz "Please input a number: "
	output_msg1: .asciiz "The sum of Fibonacci(0) to Fibonacci("
	output_msg2: .asciiz ") is: "
    newline: .asciiz "\n"

.text
.globl main
main:
    # syscall 1: print int, 4: print string, 5: input num, 10: end program
    li $v0, 4
    la $a0, input_msg
    syscall

    li $v0, 5      	
	syscall              
	move $a0, $v0
    move $s0, $v0

    jal fib_sum
    move $t0, $v0

    li $v0, 4
    la $a0, output_msg1
    syscall

    li $v0, 1
    move $a0, $s0 
    syscall

    li $v0, 4
    la $a0, output_msg2
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
	syscall

fib_sum:
    addi $sp, $sp, -12    
    sw $ra, 8($sp)        
    sw $a0, 4($sp)        
    sw $s1, 0($sp)        
    
    li $t0, 0             # t0 = sum = 0
    li $t1, 0             # t1 = i = 0
    move $s1, $a0         # s1 = n (preserve original input)

fib_loop:
    bgt $t1, $s1, fib_sum_end  # if i > n
    move $a0, $t1         
    jal fib               
    add $t0, $t0, $v0     # sum += fib(i)
    addi $t1, $t1, 1      # ++i
    j fib_loop

fib_sum_end:
    move $v0, $t0         
    lw $s1, 0($sp)        
    lw $a0, 4($sp)        
    lw $ra, 8($sp)        
    addi $sp, $sp, 12     
    jr $ra

fib:
    addi $sp, $sp, -16   
    sw $ra, 12($sp)       
    sw $a0, 8($sp)        
    sw $s2, 4($sp)        
    sw $s3, 0($sp)        

    beq $a0, $zero, fib_zero # if fib(0) return 0
    
    li $t2, 1             # if n == 1 return 1
    beq $a0, $t2, fib_one
    
    # fib(n-1)
    move $s2, $a0         
    
    addi $a0, $s2, -1     
    jal fib               
    move $s3, $v0         
    
    # fib(n-2)
    addi $a0, $s2, -2     
    jal fib              
    
    add $v0, $s3, $v0
    j fib_end

fib_zero:
    li $v0, 0           
    j fib_end

fib_one:
    li $v0, 1             

fib_end:
    lw $s3, 0($sp)       
    lw $s2, 4($sp)       
    lw $a0, 8($sp)        
    lw $ra, 12($sp)       
    addi $sp, $sp, 16     
    jr $ra