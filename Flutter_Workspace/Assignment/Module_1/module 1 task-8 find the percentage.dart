// Find the Percentage
import 'dart:io';
void main()
{
  print ("Enter Your Maths Mark");
  int Maths = int.parse(stdin.readLineSync().toString());

  print("Enter Your Science Mark");
  int Science = int.parse(stdin.readLineSync().toString());

  print("Enter Your English Mark");
  int English = int.parse(stdin.readLineSync().toString());

  print("Enter Your Hindi Mark");
  int Hindi = int.parse(stdin.readLineSync().toString());

  print ("Enter Your Sanskrit Mark");
  int Sanskrit = int.parse(stdin.readLineSync().toString());

  int sum = Maths + Science + English + Hindi + Sanskrit;
  print(sum);

  double percentage=(sum)/5;
  print(percentage);
}