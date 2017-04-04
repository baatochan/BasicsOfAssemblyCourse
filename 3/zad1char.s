.data
format_char: .string "%c",  # dla char
etykieta_char: .string "char\n",
nowa_linia: .string "\n"

.bss
.comm pamiec_char, 1 # bufor na char

.text
.global main

main:

# poczatek funkcji

push %ebp
mov %esp, %ebp

region_char:

# wypisanie etykiety char

push $etykieta_char
call printf

# wywolanie scanf dla char
# scanf(&int, "%d")

push $pamiec_char
push $format_char
call scanf

# wywolanie printf dla char
# printf(&int, "%d")

push (pamiec_char)
push $format_char
call printf

# wypisanie nowej lini

push $nowa_linia
call printf



# zakonczenie funkcji

mov %ebp, %esp
pop %ebp
