//Positive Negative Number

import 'dart:io';
void main()
{
  print("Enter Any Number");
  int num = int.parse(stdin.readLineSync().toString());

  if(num>0)
    {
      print("Number is Positive");
    }
  else if(num==0)
    {
      print("Number is Neutral or zero");
    }
  else
    {
      print("Number is Negative");
    }
}