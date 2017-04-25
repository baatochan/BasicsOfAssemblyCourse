#include <stdio.h>

extern unsigned short getStatus();
extern unsigned short getControl();
extern void setControl(unsigned short control);

short control;

int main (void)
{
	unsigned short control = getControl();

	control -= 768;

	setControl(control);

	control = getControl();
	printf("ControlWord: %x\n", control);

	return 0;
}
