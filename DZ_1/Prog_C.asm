.data
msg_n:.asciz  "Введите номер студента n: "
msg_arr:.asciz  "Введите числа (0 завершает ввод):\n"
msg_done:.asciz  "\nВведено чисел: "
msg_nl:.asciz  "\n"
.text
.globl  main

main:
#Вводим число n
la a0, msg_n
li a7, 4
ecall

li a7, 5
ecall
mv s3, a0

#делаем максимум массива S2
addi s2, s3, 16

#ыделение авмяти в байтах
slli a0, s2, 2
li a7, 9
ecall

mv s0, a0

la a0, msg_arr
li a7, 4
ecall

#счетчик
li s1, 0

loop:
bge s1, s2, finish

li a7, 5
ecall
mv s4, a0       

beqz s4, finish

slli t0, s1, 2
add t1, s0, t0 
sw s4, 0(t1)

addi s1, s1, 1
j loop

finish:
la a0, msg_done
li a7, 4
ecall

mv a0, s1
li a7, 1
ecall

la a0, msg_nl
li a7, 4
ecall

li a7, 10
ecall