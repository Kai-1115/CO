# 113550021
# Extended_Euclidean
.data
	input_msg1:	.asciiz "Enter the number: "
	input_msg2:	.asciiz "Enter the modulo: "
	output_msg1: .asciiz "Inverse not exist.\n"
	output_msg2: .asciiz "Result: "
	newline: .asciiz "\n"

.text
.globl main
main:
	li $v0, 4
	la $a0, input_msg1
	syscall
 
	li $v0, 5
	syscall
	move $s0, $v0

	li $v0, 4
	la $a0, input_msg2
	syscall

	li $v0, 5
	syscall
	move $s1, $v0

	move $a0, $s0
	move $a1, $s1

	jal mod_inverse
	move $t0, $v0

	li $t1, -1
	beq $t0, $t1, no_inverse

	li $v0, 4
	la $a0, output_msg2
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, newline
	syscall

	j exit_program

no_inverse:
	li $v0, 4
	la $a0, output_msg1
	syscall

exit_program:
	li $v0, 10
	syscall

.text
mod_inverse:
	li $t9, 1
	beq $a1, $t9, no_inv 

	div $a0, $a1
	mfhi $a0
	bge $a0, $zero, positive
	add $a0, $a0, $a1

positive:
	move $t0, $a1
	li $t1, 1 # x0 = 1
	li $t2, 0 # x1 = 0

loop:
	beq $a1, $zero, done
	div $a0, $a1
	mflo $t3 # t3 = a / b
	mfhi $t4 # t4 = a % b
	
	move $a0, $a1
	move $a1, $t4
	
	move $t4, $t2
	mul $t5, $t3, $t2
	sub $t2, $t1, $t5 # x1 = x0 - (a/b) * t1
	move $t1, $t4
	
	j loop

done:
	li $t4, 1
	bne $a0, $t4, no_inv # if (gcd != 1) return -1
	bge $t1, $zero, return_result
	add $t1, $t1, $t0

return_result:
	move $v0, $t1
	jr $ra

no_inv:
	li $v0, -1
    jr $ra