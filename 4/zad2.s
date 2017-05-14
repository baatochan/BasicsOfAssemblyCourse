.data
val1: .double 6.66
val2: .double 0

.text
.global divideByZero
.type divideByZero, @function

divideByZero:
push %ebp
mov %esp, %ebp

fclex

fldl val1

fdivl val2;

mov %ebp, %esp
pop %ebp

ret
