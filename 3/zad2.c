#include <stdio.h>

extern unsigned long long myTimer();

int main (void)
{
	unsigned long long actualTime = myTimer();

	printf("Od uruchomienia komputera wykonało się %llu cykli procesora.\n", actualTime);

	return 0;
}
