//---------------------------------------------------------------
// Test program - grupa C
//---------------------------------------------------------------

#include <stdio.h>

unsigned long long int fun(unsigned long a, int b, int* pcs, int* count);

void main( void )
{
  int pos = -1;
  int count = -1;
  unsigned long long int result;
  
  result = fun(3,0,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);

  result = fun(3,1,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);

  result = fun(3,3,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);

  result = fun(3,4,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);

  result = fun(31,1,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);

  result = fun(31,2,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);

  result = fun(8,1,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);

  result = fun(8,2,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);
}
