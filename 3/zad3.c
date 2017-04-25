#include <stdio.h>

extern unsigned long long myTimer();
extern void myWrite();
extern unsigned long myAccessMemory();

unsigned long long startTime, stopTime, workingTime;

int main (void)
{
	// czas trwania write

	for (int i = 0; i < 10; i++) {
		startTime = myTimer();
		myWrite();
		stopTime = myTimer();
		workingTime = stopTime - startTime;
		printf("Czas trwania operacji write: %llu cykli.\n", workingTime);
	}

	// czas trwania printf

	for (int i = 0; i < 10; i++) {
		startTime = myTimer();
		printf("Hello there! (c)\n");
		stopTime = myTimer();
		workingTime = stopTime - startTime;
		printf("Czas trwania operacji printf: %llu cykli.\n", workingTime);
	}

	// czas dostepu do pamieci

	for (int i = 0; i < 10; i++) {
		workingTime = myAccessMemory();
		printf("Czas dostepu do pamieci: %lu cykli.\n", workingTime);
	}

	return 0;
}
