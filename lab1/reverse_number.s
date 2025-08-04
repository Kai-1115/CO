# 113550021
# reverse_number
.data
    input_msg: .asciiz "Enter a number: "
	output_msg: .asciiz "Reverse number: "
	newline: .asciiz "\n"

.text
.globl main
main:
    li      $v0, 4
    la      $a0, input_msg
    syscall

    li      $v0, 5          	
	syscall              
	move    $a0, $v0

    jal reverseNumber
    move $t0, $v0

    li $v0, 4
    la $a0, output_msg
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
	syscall		

reverseNumber:
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)
    li $t1, 0 # r

loop:
    blez $a0, end_reverse

    li $t2, 10
    div $a0, $t2
    mfhi $t3 # t3 = n % 10
    mflo $t4 # t4 = n / 10

    mul $t1, $t1, $t2
    add $t1, $t1, $t3
    move $a0, $t4    
    j loop

end_reverse:
    move $v0, $t1
    lw $ra, 4($sp)
    lw $a0, 0($sp)
    addi $sp, $sp, 8
    jr $ra