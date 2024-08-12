//Convert temperature

import 'dart:io';
void main()

{
  print("Enter Celsius");
  int Celsius = int.parse(stdin.readLineSync().toString());

  var F = (Celsius * 9 / 5) + 32;
  print("Fahrenheit is :$F");
}