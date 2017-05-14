.data
val1: .double 3.1234567899
val2: .double 2.987654321123

.text
.global addFloating
.type addFloating, @function

addFloating:
push %ebp
mov %esp, %ebp

fldl val1
fldl val2

faddp

mov %ebp, %esp
pop %ebp

ret
