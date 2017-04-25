.data

number = 666

.text
.global myAccessMemory
myAccessMemory:

# kopiowanie do rejestru

mov $number, %eax 

# return

ret
