# Architektura komputerów 2

## Laboratorium 5. MMX

1. Napisać funkcję operującą na czarno-białym obrazku `BMP`, czyli na dwuwymiarowej macierzy zawierająca jedną liczbę będąca w przedziale 0-255 oznaczającą odcień szarości obrazka w danym pikselu. Funkcja ma brać każdy piksel po kolei i dodawać wartość piksela oddalonego o wartość X (np 10 pikseli w lewo) pomnożoną przez skalar (np `1/2`, jednak może być dowolnie inny). Przykładowo bierzemy `P(0)` i `P(0+10)`, wynikiem ma być `P(0) + 1/2 * P(0+10)`. Powoduje to jednak przepalenie obrazka (bardzo łatwo dochodzimy do wartości maksymalnej 255). Należy zareagować i pomnożyć taki piksel przez `2/3`, aby zostać w zakresie 0-255.
	* Najpierw napisać funkcję w C (reszta programu podana przez prowadzącego). Skompilować z użyciem `-O3`. Zmierzyć czas metody w C za pomocą timera z labów 3.
	* Napisać taką samą funkcję w Assembly z użyciem MMX. Wykorzystać możliwość pracy równoległej oferowaną przez MMX. Zmierzyć czas i porównać z wynikiem C.

_Moje rozwiązanie wykorzystuje `1/3` jako wartość skalara._

## Lab 5. MMX

1. Write a function that operates monochromatic `BMP` image, which in fact is 2D matrix. Each value is in range 0-255. Function should take one pixel after another and add value of other pixel (let's say 10 pixels to left) multiplied by a scalar (let's say `1/2`, but can be any other value). Example - let's take pixel `P(0)` and `P(0+10)`. After operation `P(0)` should be `P(0) + 1/2 * P(0+10)`. Because we want to avoid saturation we have to multiply the result by `2/3` to stay in the range of 0-255.
	* Firstly the function have to be written in C (the rest of the program is provided by the instructor). Compile wiyh `-O3`. Measure execution time using timer from lab 3.
	* Write similar function in Assembly using MMX. Make use of parallel calculation functionality provided by MMX. Measure execution time and compare to C function.

_My solution uses `1/3` as a scalar._
