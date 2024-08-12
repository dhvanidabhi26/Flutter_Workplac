//     1
//    1 2
//   1 2 3
//  1 2 3 4
// 1 2 3 4 5

import 'dart:io';

void main()
{
  int i,j,k;

  for(i=1; i<=5; i++)
  {
    for(j=4; j>=i; j--)
    {
      stdout.write(" ");
    }
    for(k=1; k<=i; k++)
    {
      stdout.write("$k ");
    }
    print("");
  }
}