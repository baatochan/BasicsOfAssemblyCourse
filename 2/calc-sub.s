SYSCALL32 = 0x80 # wywołanie funkcji standardowej
EXIT = 1 # nr funkcji restartu (=1) – zwrot sterowania do s.o.
STDIN = 0 # nr wejścia standardowego (klawiatura) do %ebx
READ = 3 # nr funkcji odczytu wejścia (=3)
STDOUT = 1 # nr wyjścia standardowego (ekran tekstowy) do %ebx
WRITE = 4 # nr funkcji wyjścia (=4)
ERR_CODE = 0
#BUF_SIZE = 255 # rozmiar bufora (1 linia tekstu)

.bss
size: .byte 0
.comm liczba1, 255
.comm liczba2, 255
.comm wynik, 255

.text
.global _start
_start:
#wczytanie
mov $READ, %eax
mov $STDIN, %ebx
mov $size, %ecx
mov $1, %edx
int $SYSCALL32

mov $READ, %eax
mov $liczba1, %ecx
mov (size), %edx
int $SYSCALL32

mov $READ, %eax
mov $liczba2, %ecx
int $SYSCALL32

xorl %esi, %esi
dodawanie:
movb liczba1(%esi), %al
sbbb liczba2(%esi), %al
movb %al, wynik(%esi)
addl $1, %esi

cmp (size), %esi
je exit

jmp dodawanie


exit:
#wypisanie
mov $WRITE, %eax
mov $STDOUT, %ebx
mov $wynik, %ecx
mov (size), %edx
int $SYSCALL32

#exit
mov $EXIT, %eax
mov $ERR_CODE, %ebx

int $SYSCALL32
