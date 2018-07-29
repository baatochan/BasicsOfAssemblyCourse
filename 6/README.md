# Architektura komputerów 2

## Laboratorium 6. Pamięć podręczna

1. Napisać program, który pokaże mapowanie danych do pamięci podręcznej - pierwsze odwołanie do miejsca w pamięci jest powolne, następne odwołania są szybsze. _(Tego zadania chyba nie dokończyłem)_

2. Pokazać to samo, co w zadaniu 1., ale na przykładzie odczytywania z pamięci ciągu danych dłuższego, niż rozmiar pamięci podręcznej. Odczytać taki ciąg danych, a następnie zmierzyć czas odczytywania go po raz drugi i porównać dla różnych rozmiarów ciągu danych.  _(Tego zadania nie zrealizowałem)_

3. Na każdym elemencie dużej macierzy wykonać jakąś operację, najpierw iterując macierz wierszami, a następnie kolumnami. Na podstawie czasu wykonywania operacji na całej macierzy obliczyć czas operacji dla pojedynczego elementu i porównać dla różnych rozmiarów macierzy i sposobów iteracji. Zastosować optymalizacje kompilatora (`-O3`).

## Lab 6. Cache memory

1. Prove that there is cache - execution of memory access to one place for the first time is longer than when accessing this memory for the second time. _(Not finished)_

1. The same as 1. but measure time for accessing memory that is larger than CPU cache. _(No solution for this task)_

1. Do some operation on every element of matrix firstly iterate by rows, then by columns. Calculate execution time of both methods and calculate time needed for one element. Compare results for both methods of iterating and few matrix sizes. Compile with `-O3` argument.
