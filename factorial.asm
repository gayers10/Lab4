.data
prompt: .asciiz "Enter a number:\n"
result: .asciiz "Factorial of "
input: .asciiz " is:\n"
newline: .asciiz "\n"
        # TODO: Write your initializations here

#Text Area (i.e. instructions)
.text
main:
        li $v0, 4
        la $a0, prompt
        syscall

        li $v0, 5
        syscall
        move $s0, $v0 #stores input number

        li $t0, 1 # initializes factorial to 1 for base cases
        li $t1, 1 # counter to keep track of number of loops

        loop:
        bgt $t1, $s0, exit
        mult $t0, $t1
        mflo $t0
        add $t1, $t1, 1
        j loop

        # TODO: Write your code here

exit:
        li $v0, 4
        la $a0, result
        syscall

        li $v0, 1
        sub $t1, $t1, 1
        move $a0, $t1
        syscall

        li $v0, 4
        la $a0, input
        syscall

        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 4
        la $a0, newline
        syscall

        li $v0, 10
        syscall
