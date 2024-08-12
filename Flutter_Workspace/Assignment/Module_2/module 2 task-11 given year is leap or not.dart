// 11. Write a Program to check the given year is leap year or not.
import 'dart:io';
void main()
{
  int year;
  
  print("Enter Year");
  year = int.parse(stdin.readLineSync().toString());

  if (year%4 ==0)
  {
    print("Year is a leap year");
  }
  else
    {
      print("Year is not a leap year");
    }
}