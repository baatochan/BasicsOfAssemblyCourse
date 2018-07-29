# Architektura komputerów 2

## Laboratorium 3. Łączenie kodu Assembly i C

1. Napisać program w Assembly, który wywoła najpierw funkcję `scanf`, a poźniej funkcję `printf`. Pobieramy `int`, `char`, `char*` a następnie je wypisujemy.

1. Napisać funkcję w Assembly wywoływaną z poziomu C. Funkcja ma zwracać do kodu C wartość z rejestru TSC (licznika cykli zegara procesora) używając instrukcji `RDTSC`. Aby `RDTSC` wykonała się po zakończeniu pozostałych operacji, należy użyć instrukcji `CPUID` po wyzerowaniu rejestru EAX.

1. Używając funkcji z 2. zmierzyć czas wykonywania operacji `printf`, `write` i jakiejś operacji na pamięci.

1. Napisać kod w C definiujący zmienną, której użyje się w kodzie Assembly. Zdefiniować fragment pamięci w Assembly i użyć go jako zmienną w C.

## Lab 3. Combining Assembly and C code

1. Call `scanf` and `printf` from Assembly for `int`, `char`, `char*`.

1. Write Assembly function and call it from C. Function should return value from TSC (Time Stamp Counter) register using `RDTSC` command. For `RDTSC` to work correctly it is needed to run `CPUID` after xoring EAX register.

1. Using function from 2. time execution time of `printf`, `write` and memory access.

1. Define variable in C and use it in Assembly. Define "variable" in Assembly and use it in C.
