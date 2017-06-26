///---------------------------------------------------------------
// Test program - grupa B
//---------------------------------------------------------------

#include <stdio.h>

unsigned long long int check_tab(int *tab, int n, int *max);

int main() {
	int tab1[] = {-2,3,3,64,64};
	int tab2[] = {0,2,3,4,5,5,5, -1, 64, -1, -1, 5};
	int tab3[] = {0,-10, 66, 64, 64, 64};
	int tab4[] = {32,33,34,35,62,63};
	int tab5[] = {32,33,33,35,62,63};
	int tab6[] = {32,33,33,33,62,63};
	int tab7[] = {};
  int tab8[] = {32,33,33,33,62,63, 2, 2, 2, 2};
	unsigned long long int wyn;
	int max;

	wyn = check_tab(tab1, 5, &max);
	printf("Result: %016llX, max: %d\n", wyn, max);

	wyn = check_tab(tab2, 12, &max);
	printf("Result: %016llX, max: %d\n", wyn, max);

	wyn = check_tab(tab3, 6, &max); 
	printf("Result: %016llX, max: %d\n", wyn, max);

	wyn = check_tab(tab4, 6, &max);
	printf("Result: %016llX, max: %d\n", wyn, max);

	wyn = check_tab(tab5, 6, &max);
	printf("Result: %016llX, max: %d\n", wyn, max);

	wyn = check_tab(tab6, 6, &max);
	printf("Result: %016llX, max: %d\n", wyn, max);

	wyn = check_tab(tab7, 0, &max);
	printf("Result: %016llX, max: %d\n", wyn, max);

	wyn = check_tab(tab8, 10, &max);
	printf("Result: %016llX, max: %d\n", wyn, max);

	return 0;
}

//tablica n elementow, sprawdzic tablice czy jest z przedzialu 0 do 63
//zliczyc elementy, ile razy dana liczba sie pojawila
//zwrocic jako trzeci wskaznik maksymalna liczbe wystapien
//zwrocic bity, czy wystapila dana liczba