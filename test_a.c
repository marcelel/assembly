//---------------------------------------------------------------
// Test program - grupa A
//---------------------------------------------------------------

#include <stdio.h>

unsigned long long int check_div(int a,int b,int c);

void main( void )
{
   printf("Wersja podstawowa:\n");
   printf("1: (17,1)  = %ld\n", check_div( 17,1, 0 ) );
   printf("2: (17,2)  = %ld\n", check_div( 17,2, 0 ) );
   printf("3: (17,3)  = %ld\n", check_div( 17,3, 0 ) );
   printf("4: (17,17) = %ld\n", check_div( 17,17, 0 ) );
   printf("Wersja rozszerzona:\n");
   printf("1: ( 5,x,1)       = %016llX\n", check_div( 5,0, 1 ) );
   printf("2: ( 8,x,1)       = %016llX\n", check_div( 8,0, 1 ) );
   printf("3: (16,x,1)       = %016llX\n", check_div( 16,0, 1 ) );
   printf("4: (17,x,1)       = %016llX\n", check_div( 17,0, 1 ) );
   printf("5: (16*65536,x,1) = %016llX\n", check_div( 16*65536,0, 1 ) );
   printf("6: (64,x,1)       = %016llX\n", check_div( 64, 0, 1 ) );
}

// idiv mianownik - pojebane dzielenie całkowite - licznik musi by w rax, 
// mianownik musi by w jakimś innym rejestrze,
// wynik dzielenia będzie w rax, reszta z dzielenia w rdx 
// | RDX MUSI BYC WYZEROWANE