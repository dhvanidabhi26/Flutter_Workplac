import 'package:flutter/material.dart';
import 'package:food_recipe/Page/login_screen.dart';
import 'package:food_recipe/project_spicific/elevated_button.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';
import 'package:food_recipe/project_spicific/textformfiled.dart';
import 'package:get/get.dart';

import '../constant/colorconstant.dart';
import 'home/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController confirmpasscontroller = TextEditingController();

  final List<String> days = List.generate(31, (index) => (index + 1).toString());
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
  ];
  final List<String> years = List.generate(100, (index) => (DateTime.now().year - index).toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 10),
                    child: Text(
                      "Create an account",
                      style: AppTextTheme.semibold.copyWith(
                        fontSize: 24,
                        color: ColorConstant.blackColor,
                      ),
                    ),
                  ),
                  //Subtitle
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 10),
                    child: Text(
                      "Welcome friend, fill your details to\n explore food.",
                      style: AppTextTheme.regular.copyWith(
                        fontSize: 14,
                        color: ColorConstant.blackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Email
                  Textformfiled(controller: emailcontroller, title: 'Email Address', text: 'JohnDeo@gmail.com',),
                  //Name
                  Textformfiled(controller: namecontroller, title: 'Name', text: 'John Deo',),
                  //Username
                  Textformfiled(controller: usernamecontroller, title: 'Username', text: 'John_Deo',),
                  //Mobile Number
                  Textformfiled(controller: mobilecontroller, title: 'Mobile Number', text: '+91 9988998899',),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text('Birthday', style: TextStyle(color: ColorConstant.blackColor,fontSize: 12),),
                  ),
                  //Birthday
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                hint: Text('Day'),
                                value: selectedDay,
                                items: days.map((String day) {
                                  return DropdownMenuItem<String>(
                                    value: day,
                                      child: Text(day,style: TextStyle(color: ColorConstant.greyColor,),)
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedDay = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                hint: Text('Month'),
                                value: selectedMonth,
                                items: months.map((String month) {
                                  return DropdownMenuItem<String>(
                                    value: month,
                                    child: Text(month,style: TextStyle(color: ColorConstant.greyColor,),)
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedMonth = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                hint: Text('Year'),
                                value: selectedYear,
                                items: years.map((String year) {
                                  return DropdownMenuItem<String>(
                                    value: year,
                                      child: Text(year,style: TextStyle(color: ColorConstant.greyColor,),)
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedYear = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //Password
                  Textformfiled(controller: passcontroller, title: 'Password', text: '******',),
                  //Confirm Password
                  Textformfiled(controller: confirmpasscontroller, title: 'Confirm Password', text: '******',),
                ],
              ),
              // ElevatedButton
              CustomElevatedButton(
                text: 'Create an account',
                onPressed: () {
                  Get.to(() => HomeScreen());
                },
                isGoogleButton: false,
              ),
              // GestureDetector
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontWeight: FontWeight.bold, color: ColorConstant.primary),
                    ),
                  )
                ],
              ),
              // Image
              Image.asset("assets/images/Google.png", height: 150, width: 150),
            ],
          ),
        ),
      ),
    );
  }
}
