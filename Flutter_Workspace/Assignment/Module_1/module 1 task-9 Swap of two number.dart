//Swap of two Number

import 'dart:io';
void main()
{
  print("Enter Number For A");
  int a = int.parse(stdin.readLineSync().toString());

  print("Enter Number For B");
  int b = int.parse(stdin.readLineSync().toString());

  a=a+b;
  b=a-b;
  a=a-b;

  print("Value of A: $a");
  print("Value of B: $b");
}