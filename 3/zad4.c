#include <stdio.h>

int numberC;

extern void zad4();
extern int numberASM;

int main (void)
{
	numberC = 33;

	printf("Przed wykonaniem kodu asm zmienna numberC ma wartość: %d.\nZmienna numberASM jest nie zainicjowana.\n\n", numberC);
	zad4();
	printf("Po wykonaniu numberC ma wartość: %d.\nZmienna numberASM ma wartość: %d.\n\n", numberC, numberASM);
	numberASM = 78;
	printf("Zmienna numASM ma wartość: %d.\n", numberASM);

	return 0;
}
