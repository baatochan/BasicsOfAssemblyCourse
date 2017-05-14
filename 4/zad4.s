.data
val1: .double 6.66

.text
.global doRounding
.type doRounding, @function

doRounding:
push %ebp
mov %esp, %ebp

fldl val1

frndint

mov %ebp, %esp
pop %ebp
