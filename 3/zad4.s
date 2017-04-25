.extern numberC

.globl numberASM

.data
numberASM: .long 44

.text
.global zad4
zad4:

movl $666, numberC

#movl $47, numberASM

ret
