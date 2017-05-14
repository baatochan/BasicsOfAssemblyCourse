#include <stdio.h>

extern unsigned short getStatus();
extern unsigned short getControl();
extern void setControl(unsigned short control);

int main (void)
{
	printf("Zadanie czwarte:\n");
	unsigned short control = getControl();

	control += 3072; // + 1100 0000 0000; z 0 na 3; z nearest na truncat (towards zero)

	setControl(control);

	control = getControl();
	printf("ControlWord: %x\n", control);

	return 0;
}
