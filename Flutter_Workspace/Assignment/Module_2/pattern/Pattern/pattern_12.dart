//1
//4 4
//9 9 9
//16 16 16 16
//25 25 25 25 25

import 'dart:io';

void main()
{
  int i,j;

  for(i=1; i<=5; i++)
  {
    for(j=1; j<=i ;j++)
    {
      stdout.write("${i*i}");
      stdout.write(" ");
    }
    print("");
  }
}