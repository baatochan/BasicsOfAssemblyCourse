.data
val1: .double 6.66
val2: .double 0.69
val3: .double 21.37
val4: .double 9.11

.extern res1
.extern res2

.text
.global calculateDependent, calculateIndependent
.type calculateDependent, @function
.type calculateIndependent, @function

calculateDependent:
push %ebp
mov %esp, %ebp
push %esi

fldl val1
fldl val3

xorl %esi, %esi
petla1:
cmp $50, %esi
je wyjdz1

faddl val4

fincstp

fadd %st(7)

fdecstp

incl %esi
jmp petla1

wyjdz1:

fstpl res1
fstpl res2

pop %esi
mov %ebp, %esp
pop %ebp

ret

calculateIndependent:
push %ebp
mov %esp, %ebp
push %esi

fldl val1
fldl val3

xorl %esi, %esi
petla2:
cmp $50, %esi
je wyjdz2

faddl val4

fincstp

faddl val2

fdecstp

incl %esi
jmp petla2

wyjdz2:

fstpl res1
fstpl res2

pop %esi
mov %ebp, %esp
pop %ebp

ret
