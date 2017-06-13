.data
test0: .quad 0
test1: .quad 0
test2: .quad 0
test3: .quad 0
test4: .quad 0
printftext1: .string "Pierwszy czas dostepu: %i\n"
printftext2: .string "Drugi czas dostepu: %i\n"

.bss


.text
.global main
.type main, @function

main:
push %ebp
mov %esp, %ebp
push %ebx
push %edi

clflush test0

xor %eax, %eax
cpuid
rdtsc

movl %eax, %edi

movl test0, %eax

xor %eax, %eax
cpuid
rdtsc

subl %edi, %eax

push %eax
push $printftext1
call printf
addl $8, %esp

xor %eax, %eax
cpuid
rdtsc

movl %eax, %edi

movl test0, %eax

xor %eax, %eax
cpuid
rdtsc

subl %edi, %eax

push %eax
push $printftext2
call printf
addl $8, %esp

pop %edi
pop %ebx
mov %ebp, %esp
pop %ebp

ret
