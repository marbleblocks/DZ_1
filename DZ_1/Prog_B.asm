.data
p1: .asciz "Введите любое число (x): "
p2: .asciz "Введите номер группы (y): "
p3: .asciz "Введите номер студента (h): "
.text
.global main

main:

#x
la a0, p1
li a7, 4
ecall
li a7, 5
ecall
mv s0, a0

#y
la a0, p2
li a7, 4
ecall
li a7, 5
ecall
mv s1, a0

#h
la a0, p3
li a7, 4
ecall
li a7, 5
ecall
mv s2, a0

#поиск меньшего (построение шкалы о min(x, y) до max(x, y): t0 - меньшее, t1 - большее
blt s0, s1, xlessy
mv t0, s1
mv t1, s0
j loop

xlessy:
mv t0, s0
mv t1, s1

#вывод x, x+h, x+2h ... до y включительно
loop:
bgt  t0, t1, endloop
mv a0, t0
li a7, 1
ecall

li a0, 32
li a7, 11
ecall

add t0, t0, s2
j loop

endloop:
li a0, 10
li a7, 11
ecall
li a7, 10
ecall



