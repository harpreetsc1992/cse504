#include <stdio.h>

int add(int a, int b)
{
	return a + b;
}
int main ()
{
	int a[10];
	a[0] = 1;
	int b = 0;
	for (int i = 1; i < 10; i++)
	{
		a[i] = a[i - 1] + b;
		b = a[i - 1];
		printf("%d ", a[i]);
	}
	printf("\n");
}
