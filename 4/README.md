# Architektura komputerów 2

## Laboratorium 4. Programowanie z użyciem x87 FPU

1. Napisać funkcje odczytującą z rejestru stanu i rejestru sterującego FPU, oraz funkcję ustawiającą rejestr sterujący. Pokazać, że działa.

2. Napisać kod powodujący 2 wyjątki FPU (div0 lub niedozwolona operacja i jeden inny).

3. Używając funkcji z zadania 1. zmienić precyzję obliczeń FPU i pokazać, że zmieniona precyzja działa.

4. Używając funkcji z zadania 1. zmienić tryb zaokrąglania i pokazać, że zmieniony tryb działa.

5. Napisać dwie sekwencje o identycznych ilościach tych samych, podstawowych rozkazów zmiennoprzecinkowych. W jednej sekwencji rozkazy mają móc się nakładać, w drugiej nie. Zmierzyć czas wykonywania się jednej i drugiej sekwencji za pomocą licznika z poprzednich zajęć.

## Lab 4. Using x87 FPU

1. Make a function that reads value from Status Register, Control Register and that writes a value to Control Register.

1. Make two FPU exceptions (one can be div0 or not permitted operation and the second has to be something else)

1. Using function from 1. change FPU precision and prove it.

1. Using function from 1. change FPU rounding mode and prove it.

1. Make two sequences of FPU operations. One has to dependent, the second one independent. Time execution time of both using timer from previous lab.
