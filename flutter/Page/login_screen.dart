import 'package:flutter/material.dart';
import 'package:food_recipe/Page/home/home_screen.dart';
import 'package:food_recipe/Page/signup_screen.dart';
import 'package:food_recipe/constant/assestconstant.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/project_spicific/buttomnavigator.dart';
import 'package:food_recipe/project_spicific/elevated_button.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';
import 'package:food_recipe/project_spicific/textformfiled.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Assestconstant.loginBackground))),
          child: Padding(
            padding: EdgeInsets.only(top: 350),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Login to your account",
                      style:AppTextTheme.semibold.copyWith(
                        fontSize: 24,
                        color: ColorConstant.blackColor
                      )),),
                  //Email
                  Textformfiled(controller:emailcontroller,title: 'Email Adrdess', text: 'JohnDeo@gmail.com'),
                  //Password
                  Textformfiled(controller:passwordcontroller,title: 'Password', text: '******'),
                  //ElevatedButton
                  CustomElevatedButton(
                    text: "Login",
                    backgroundColor: ColorConstant.primary,
                    textColor: ColorConstant.whiteColor,
                    onPressed: (){
                      Get.offAll(()=>BottomNavigationBarExample());
                    }, isGoogleButton: false,),
                  // GestureDetector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ?" , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                      SizedBox(width: 10),
                      GestureDetector(
                          onTap: () {
                            Get.to(()=>SignupScreen());
                          },
                          child: const Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold, color: ColorConstant.primary,),
                          )
                      )
                    ],
                  ),
                  //Image
                  Padding(
                    padding: EdgeInsets.only(top: 50,left: 140,right: 140),
                    child: Image.asset("assets/images/Google.png",height: 150,width: 150,),
                  )
                ])

            ),
            ),
          ),
        );
  }
}
