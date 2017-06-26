// Funkcja otrzymuje tablice liczb poprzez wska´znik tab, gdzie n to liczba 
// element´ow tablicy. Dodatkowo przekazywane sa dwa wska´zniki, dla kt´orych 
// ma by´c zarezerwowane miejsce na jeden element w C. Po zako´nczeniu
// dzia lania funkcji, w pamieci wskazuwanej przez even count, ma 
// znajdowa´c sie ilo´s´c liczb parzystych wystepujacych
// w tablicy. W neg count ma sie znale´z´c ilo´s´c liczb ujemnych w tablicy. 
// I teraz wisienka na torcie.
// Funkcja po wykonaniu, ma zwr´oci´c indeks elementu tablicy kt´ory posiada 
// najwieksza liczbe jedynek w swojej
// reprezentacji binarnej.
// Przyk lad u˙zycia

#include <stdio.h>
#include <stdlib.h>

long long max_1_ind(long long * tab, long long n, long long *even_count, long long *neg_count);

int main(){
  //printf("%ld", sizeof(long long)); - 8
  long long tab [5] = {1,3,6,7,15};
  long long* a = malloc(sizeof(long long));
  long long* b = malloc(sizeof(long long));
  long long max = max_1_ind(tab, 5, a, b);
  printf("%lld, %lld, %lld\n", *a, *b, max);

    return 0;
}

