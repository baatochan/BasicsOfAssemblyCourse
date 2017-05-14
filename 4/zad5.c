#include <stdio.h>

double res1, res2;

extern double calculateDependent();
extern void calculateIndependent();

extern unsigned long long myTimer();

unsigned long long startTime, stopTime, workingTime;

int main (void)
{
	printf("Zadanie piate:\n");
	for (int i = 0; i < 10; i++) {
		startTime = myTimer();

		calculateIndependent();

		stopTime = myTimer();
		workingTime = stopTime - startTime;
		printf("Czas trwania operacji niezaleznych: %llu cykli.\n", workingTime);
		//printf("Wynik1: %f, Wynik2: %f\n", res1, res2);
	}

	for (int i = 0; i < 10; i++) {
		startTime = myTimer();

		calculateDependent();

		stopTime = myTimer();
		workingTime = stopTime - startTime;
		printf("Czas trwania operacji zaleznych: %llu cykli.\n", workingTime);
		//printf("Wynik1: %f, Wynik2: %f\n", res1, res2);
	}

	return 0;
}
