SYSCALL32 = 0x80 # wywołanie funkcji standardowej
EXIT = 1 # nr funkcji restartu (=1) – zwrot sterowania do s.o.
STDIN = 0 # nr wejścia standardowego (klawiatura) do %ebx
READ = 3 # nr funkcji odczytu wejścia (=3)
STDOUT = 1 # nr wyjścia standardowego (ekran tekstowy) do %ebx
WRITE = 4 # nr funkcji wyjścia (=4)
ERR_CODE = 0
BUF_SIZE = 1 # rozmiar bufora (1 linia tekstu)
OFFSET = 1 # przesuniecie w kodzie cezara, zakres [-128,127] u Z

.data
buf: .byte 0 #bufor pomocniczy

.text
.global _start
_start:
#wczytanie jednego znaku/bajta
mov $READ, %eax
mov $STDIN, %ebx
mov $buf, %ecx
mov $BUF_SIZE, %edx

int $SYSCALL32

cmp $1, %eax # jesli wczytal wiecej/mniej niz jeden znak/bajt wyjdz
jne exit # oznacza to albo koniec pliku albo blad odczytu

cmp $'A', (%ecx)
jl out #jesli w buforze znak mniejszy niz A, od razu go wypisz
cmp $'Z', (%ecx)
jg out #jesli w buforze znak wiekszy niz Z, od razu go wypisz

add $OFFSET, (%ecx) #jesli w buforze znak pomiedzy A i Z, dodaj przesuniecie
check:
cmp $'Z', (%ecx)
jg tooBig #jesli po dodaniu znak za duzy, zajmij sie nim
cmp $'A', (%ecx)
jl tooSmall #jesli po dodaniu znak za maly, zajmij sie nim (offset moze byc ujemny)
jmp out #jesli znak nadal znajduje sie w przedziale, po prostu go wypisz

tooBig:
sub $26, (%ecx) #jesli za duzy, odejmij caly alfabet (26 znakow)
jmp check #sprawdz ponownie
tooSmall:
add $26, (%ecx) #jesli za maly dodaj caly alfabet
jmp check #sprawdz ponownie

out:
#wypisanie znaku/bajta (w %ecx i %edx znajduja sie odpowiednie wartosci, poniewaz na nich caly czas pracowalismy)
mov $WRITE, %eax
mov $STDOUT, %ebx

int $SYSCALL32

jmp _start #idz na poczatek i zajmij sie kolejnym znakiem/bajtem

exit:
#wyjscie
mov $EXIT, %eax
mov $ERR_CODE, %ebx

int $SYSCALL32
