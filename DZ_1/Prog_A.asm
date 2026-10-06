.data
promt: .asciz "Введите любое число: "
.text
.global main

main:

la a0, promt
li a7, 4
ecall
li a7, 5
ecall

li t0, 7
beq a0, t0, equal
li a0, 0       
j print        

equal:
li a0, 1          

print:
li a7, 1
ecall

li a7, 10
ecall