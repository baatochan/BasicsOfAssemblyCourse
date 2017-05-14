#include <stdio.h>

extern unsigned short getStatus();
extern unsigned short getControl();
extern void setControl(unsigned short control);

extern double doRounding();

int main (void)
{
	printf("Zadanie czwarte:\n");
	double liczba = 6.66;
	printf("Liczba      : %.2f\n", liczba);

	double res = doRounding();
	printf("Przed zmiana: %.2f\n", res);

	unsigned short control = getControl();

	control += 3072; // + 1100 0000 0000; z 0 na 3; z nearest na truncat (towards zero)

	setControl(control);

	res = doRounding();
	printf("Po zmianie  : %.2f\n", res);

	control = getControl();
	printf("ControlWord: %x\n", control);

	return 0;
}
