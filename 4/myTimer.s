.text
.global myTimer
myTimer:

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

# zakonczenie funkcji
pop %ebx
mov %ebp, %esp
pop %ebp

ret
