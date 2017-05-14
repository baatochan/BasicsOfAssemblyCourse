#include <stdio.h>

extern unsigned short getStatus();
extern unsigned short getControl();
extern void setControl(unsigned short control);

extern double addFloating();


int main (void)
{
	printf("Zadanie trzecie:\n");

	double res = 6.111111111023;
	printf("Prawidlowy wynik: %.12f\n", res);
	printf("Prawidlowy wynik: %.50f\n", res);

	//double val1 = 3.1234567899876;
	//double val2 = 2.987654321123456;

	double result = addFloating();
	printf("Przed zmiana    : %.50f\n", result);

	//double res = val1 + val2;
	//printf("w C: %.50f\n", res);

	unsigned short control = getControl();
	control -= 768; // - 0011 0000 0000; z 3 na 0; z extended na float
	setControl(control);

	control = getControl();
	printf("ControlWord: %x\n", control);

	result = addFloating();
	printf("Po zmianie      : %.50f\n", result);

	//res = val1 + val2;
	//printf("w C: %.50f\n", res);

	return 0;
}
