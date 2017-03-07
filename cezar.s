SYSCALL32 = 0x80 # wywołanie funkcji standardowej
EXIT = 1 # nr funkcji restartu (=1) – zwrot sterowania do s.o.
STDIN = 0 # nr wejścia standardowego (klawiatura) do %ebx
READ = 3 # nr funkcji odczytu wejścia (=3)
STDOUT = 1 # nr wyjścia standardowego (ekran tekstowy) do %ebx
WRITE = 4 # nr funkcji wyjścia (=4)
ERR_CODE = 0
BUF_SIZE = 80 # rozmiar bufora (1 linia tekstu)

.data
textin: .space BUF_SIZE
textout: .space BUF_SIZE



.global _start
_start:
mov $READ, %eax
mov $STDIN, %ebx
mov $textin, %ecx
mov $BUF_SIZE, %edx

int $SYSCALL32

cmp $0, %eax
je exit

xorl %esi, %esi
petla:

mov textin(%esi), %al
cmp $'\n', %al
je out
cmp $'A', %al
jl skip
cmp $'Z', %al
jg skip
je takeCareOfZ

add $1, %al

jmp skip
takeCareOfZ:
mov $'A', %al
skip:
movb %al, textout(%esi)
incl %esi
jmp petla

out:
movb %al, textout(%esi)
mov $WRITE, %eax
mov $STDOUT, %ebx
mov $textout, %ecx
mov $BUF_SIZE, %edx

int $SYSCALL32

jmp _start
exit:
mov $EXIT, %eax
mov $ERR_CODE, %ebx

int $SYSCALL32
