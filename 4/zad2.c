#include <stdio.h>

extern unsigned short getStatus();
extern unsigned short getControl();
extern void setControl(unsigned short control);

extern double doRounding();
extern double divideByZero();

int main (void)
{
	printf("Zadanie drugie:\n");
	printf("Wartosci CW i SW przed operacjami:\n");

	unsigned short control = getControl();
	printf("ControlWord: %x\n", control);
	unsigned short status = getStatus();
	printf("StatusWord: %x\n", status);

	double res = doRounding();

	printf("Wartosc SW po zaokragleniu z zadania 4:\n");
	status = getStatus();
	printf("StatusWord: %x\n", status); //0000 0000 0010 0000, 0x0020, Precision Error
	printf("0000 0000 0010 0000, 0x0020, Precision Error\n");

	double res2 = divideByZero();
	printf("Dzielenie: %.2f\n", res2);
	printf("Wartosc SW po dzieleniu przez zero:\n");
	status = getStatus();
	printf("StatusWord: %x\n", status); //0000 0000 0000 0100, 0x0004, Zero Divide
	printf("0000 0000 0000 0100, 0x0004, Zero Divide\n");

	return 0;
}
