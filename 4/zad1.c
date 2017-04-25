#include <stdio.h>

extern unsigned short getStatus();
extern unsigned short getControl();
extern void setControl(unsigned short control);

short control;

int main (void)
{
	unsigned short control = getControl();
	printf("ControlWord: %x\n", control);
	unsigned short status = getStatus();
	printf("StatusWord: %x\n", status);

	control -= 256;

	setControl(control);

	control = getControl();
	printf("ControlWord: %x\n", control);

	return 0;
}
