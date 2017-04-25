#include <stdio.h>

extern unsigned long long myTimer();
extern void myWrite();
extern void myAccessMemory();

unsigned long long startTime, stopTime, workingTime;

int main (void)
{
	// czas trwania write

	startTime = myTimer();
	myWrite();
	stopTime = myTimer();
	workingTime = stopTime - startTime;
	printf("Czas trwania operacji write: %llu cykli.\n", workingTime);

	// czas trwania printf

	startTime = myTimer();
	printf("Hello there! (c)\n");
	stopTime = myTimer();
	workingTime = stopTime - startTime;
	printf("Czas trwania operacji printf: %llu cykli.\n", workingTime);

	// czas dostepu do pamieci

	startTime = myTimer();
	myAccessMemory();
	stopTime = myTimer();
	workingTime = stopTime - startTime;
	printf("Czas dostepu do pamieci: %llu cykli.\n", workingTime);

	return 0;
}
