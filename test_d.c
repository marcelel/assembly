// Ogólnie trzeba było zrobić funkcję która zmieni cyfry w stringu 
// (tylko te gdzie maska ma bit ustawiony na 1) w sposób zgodny 
// z podaną operacją.

// Buf to był wskaźnik na stringa, w masce liczyło się tylko 
// 10 najmłodszych bitów, każdy bit oznaczał czy wykonać operacją
// na danej cyfrze, np. jak tylko najmłodszy bit był 1 to 
// zmieniamy tylko cyfrę 0. Operacja mogła wynosić od 0 do 3
// (jak się potem w testach okazało może być jakakolwiek i wtedy powinna 
// zostać obsłużona jako 0, nie pamiętam żeby na kolosie to mówił).

// Dla 0 nie robimy nic.
// Dla 1 usuwamy cyfrę
// Dla 2 robimy jak on to nazwał "transpozycję" - zamieniamy 0 na 9, 
// 1 na 8, 2 na 7 itp
// Dla 3 podmieniamy cyfrę znakiem przekazanym jako 4 argument

#include <stdlib.h>
#include <stdio.h>

char* encode(char* buf, unsigned int mask, int operation, int character);
 
int main(){
    char buf1[] = "#aAa_0123456789aBc!;";
    char buf2[] = "#aAa_0123456789aBc!;";
    char buf3[] = "#aAa_0123456789aBc!;";
    char buf4[] = "#aAa_0123456789aBc!;";
    char buf5[] = "#aAa_0123456789aBc!;";
    char buf6[] = "#aAa_0123456789aBc!;";

    printf("Original: %s\n", buf1 );
    // printf("After_1 : %s\n", encode( buf1, 0x30F, 0, '@' ) );
    // printf("After_2 : %s\n", encode( buf2, 0x30F, 1, '@' ) );
    printf("After_3 : %s\n", encode( buf3, 0x30F, 2, '@' ) );
    // printf("After_4 : %s\n", encode( buf4, 0x30F, 3, '@' ) );
    // printf("After_5 : %s\n", encode( buf5, 0x30F, 4, '@' ) );
    // printf("After_6 : %s\n", encode( buf6, 0x3FF, 1, '@' ) );
    return 0;
}

