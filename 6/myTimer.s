.text
.global myTimer
myTimer:
# ochrona ebx

push %ebx

# przygotowanie do wywolania zegara

xor %eax, %eax
cpuid

# wywolanie zegara i zapisanie go do edx:eax

rdtsc

# przywrocenie ebx

pop %ebx

ret
