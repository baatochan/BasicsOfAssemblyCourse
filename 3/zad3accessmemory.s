.data

temp: .long 0

.text
.global myAccessMemory
myAccessMemory:

# poczatek funkcji

push %ebp
mov %esp, %ebp
push %ebx
# przygotowanie do wywolania zegara

xor %eax, %eax
xor %edx, %edx
cpuid

# wywolanie zegara i zapisanie go do edx:eax

rdtsc

movl %eax, temp

xor %eax, %eax

cpuid

rdtsc

subl temp, %eax

# zakonczenie funkcji
pop %ebx
mov %ebp, %esp
pop %ebp

ret
