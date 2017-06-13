#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define arraySize 100
#define numberOfElements (arraySize*arraySize)

extern unsigned long long myTimer();
unsigned long long startTime, stopTime, workingTime, timePerItem;

unsigned char array[arraySize][arraySize];

int main (void) {

	//ustawienie seeda dla f rand
	srand (time(NULL));

	//uzupelnienie tablicy o losowe wartosci
	for (unsigned int i = 0; i < arraySize; i++){
		for (unsigned int j = 0; j < arraySize; j++){
			array[i][j] = rand() % 256;
		}
	}

	//dodawanie wierszami
	unsigned long long horizontalSum = 0;
	startTime = myTimer();
	for (unsigned int i = 0; i < arraySize; i++){
		for (unsigned int j = 0; j < arraySize; j++){
			horizontalSum += array[i][j];
		}
	}
	stopTime = myTimer();
	workingTime = stopTime-startTime;
	timePerItem = workingTime/numberOfElements;
	printf("Dodawanie wierszami:\nSuma: %llu\nCzas trwania: %llu cykli\nCzas na element: %llu cykli\n\n", horizontalSum, workingTime, timePerItem);

	//dodawanie kolumnami
	unsigned long long verticalSum = 0;
	startTime = myTimer();
	for (unsigned int i = 0; i < arraySize; i++){
		for (unsigned int j = 0; j < arraySize; j++){
			verticalSum += array[j][i];
		}
	}
	stopTime = myTimer();
	workingTime = stopTime-startTime;
	timePerItem = workingTime/numberOfElements;
	printf("Dodawanie kolumnami:\nSuma: %llu\nCzas trwania: %llu cykli\nCzas na element: %llu cykli\n\n", verticalSum, workingTime, timePerItem);

	//wyswietlenie zawartosci tablicy
	/*for (int i = 0; i < arraySize; i++){
		for (int j = 0; j < arraySize; j++){
			printf("%i ", array[i][j]);
		}
		printf("\n");
	}*/

	return 0;
}
