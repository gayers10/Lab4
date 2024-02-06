# maximum.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum value
# See assignment description for details

.data

        # TODO: Complete these declarations / initializations

prompt:         .asciiz "Enter number:\n"
maximum:        .asciiz "Maximum: "
newline:        .asciiz "\n"

#Text Area (i.e. instructions)
.text

main:
        li $v0, 4
        la $a0, prompt #prompts user to enter 1st number
        syscall

        li $v0, 5 #stores 1st number
        syscall
        move $s0, $v0

        li $v0, 4
        la $a0, prompt #prompts user to enter 2nd number
        syscall

        li $v0, 5 #stores second number
        syscall
        move $s1, $v0

        li $v0, 4
        la $a0, prompt #prompts user to enter 3rd number
        syscall

        li $v0, 5 #stores 3rd number
        syscall
        move $s2, $v0

        move $s3, $s0 #initializes s3 as first number
        bgt $s1, $s3, next_num_check #if 2nd number > 1st, move to branch next_num_check
        bgt $s2, $s3, sec_num_check
        j print

        next_num_check:
        move $s3, $s1 # places 2nd number in s3 if greater/new maximum
        bgt $s2, $s3, sec_num_check
        j print

        sec_num_check:
        move $s3, $s2 # moves 3rd number into s3 if greater than prev max

        one_three_num_check:

        print:
        li $v0, 4
        la $a0, maximum
        syscall
	
	li $v0, 1
        move $a0, $s3
        syscall

        li $v0, 4
        la $a0, newline
        syscall

        exit:
        li $v0, 10
        syscall
        # TODO: Write code to properly exit a SPIM simulation
