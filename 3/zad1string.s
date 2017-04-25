.data
format_tabchar: .string "%s", # dla char *
etykieta_tabchar: .string "string\n",
nowa_linia: .string "\n"

.bss
.comm pamiec_tabchar, 80 # bufor na char *

.text
.global main

main:

# poczatek funkcji

push %ebp
mov %esp, %ebp

region_tabchar:

# wypisanie etykiety int

push $etykieta_tabchar
call printf

# wywolanie scanf dla int
# scanf(&int, "%d")

push $pamiec_tabchar
push $format_tabchar
call scanf

# wywolanie printf dla int
# printf(&int, "%d")

push $pamiec_tabchar
push $format_tabchar
call printf

# wypisanie nowej lini

push $nowa_linia
call printf



# zakonczenie funkcji

mov %ebp, %esp
pop %ebp

ret
