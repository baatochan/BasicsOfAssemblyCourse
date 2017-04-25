SYSCALL32 = 0x80
STDOUT = 1
WRITE = 4

.data
msg: .ascii "Hello there! (asm)\n" # treść napisu
msg_len = .-msg # dlugosc napisu

.text
.global myWrite
myWrite:

# wywolanie write

mov $WRITE, %eax
mov $STDOUT, %ebx
mov $msg, %ecx
mov $msg_len, %edx

int $SYSCALL32

# return

ret
