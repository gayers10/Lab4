# arithmetic.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 32*(a - 4*b) + 7*c using only one mult instruction
# 3. Print out the result
.text
main:   li $v0, 5 #reads in integer a
        syscall
        move $s0, $v0

        li $v0, 5 #reads in int b
        syscall
        move $s1, $v0

        li $v0, 5 #readsin int c
        syscall
        move $s2, $v0

        sll $t0, $s1, 2 #4*b

        sub $t1, $s0, $t0 #a-4*b

        sll $t2, $t1, 5 #multiplies result of last step by 32

        li $t3, 7 #loads int 7
        mult $s2, $t3 #multiples 7*c
        mflo $t3 #stores result in t3

        add $t4, $t2, $t3


        li $v0, 1
        move $a0, $t4
        syscall

exit:
        li $v0, 10
        syscall
