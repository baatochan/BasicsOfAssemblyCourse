#include <stdio.h>

extern unsigned short getStatus();
extern unsigned short getControl();
extern void setControl(unsigned short control);

int main (void)
{
	printf("Zadanie pierwsze:\n");
	
	unsigned short control = getControl();
	printf("ControlWord: %x\n", control);
	unsigned short status = getStatus();
	printf("StatusWord: %x\n", status);

	control -= 256; //-0001 0000 0000; z 3 na 2; z extended na double

	setControl(control);

	control = getControl();
	printf("ControlWord: %x\n", control);

	return 0;
}
