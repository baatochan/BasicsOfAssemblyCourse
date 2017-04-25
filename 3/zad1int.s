.data
format_int: .string "%d",  # Lancuch znakow do wywolania f scanf/printf dla int
etykieta_int: .string "int\n",
nowa_linia: .string "\n"

.bss
.comm pamiec_int, 4 # bufor na int


.text
.global main

main:

region_int:

# poczatek funkcji

push %ebp
mov %esp, %ebp

# wypisanie etykiety int

push $etykieta_int
call printf

# wywolanie scanf dla int
# scanf(&int, "%d")

push $pamiec_int
push $format_int
call scanf

# wywolanie printf dla int
# printf(&int, "%d")

push (pamiec_int)
push $format_int
call printf

# wypisanie nowej lini

push $nowa_linia
call printf


# zakonczenie funkcji

mov %ebp, %esp
pop %ebp

ret
