import 'package:digital_society/screen/admin/admin_home_screen.dart';
import 'package:digital_society/screen/auth/signup_screen.dart';
import 'package:digital_society/screen/user/user_buttom_navigation.dart';
import 'package:digital_society/screen/user/user_home_screen.dart';
import 'package:digital_society/utils/assestconstant.dart';
import 'package:digital_society/utils/colorconstant.dart';
import 'package:digital_society/utils/text_theme.dart';
import 'package:digital_society/services/toast_msg.dart';
import 'package:digital_society/widgets/button/elevatedbutton.dart';
import 'package:digital_society/widgets/password/password.dart';
import 'package:digital_society/widgets/text_formfield/textformfiled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  void login() {
    String adminEmail = "dhvani@gmail.com";
    String adminpassWord = "Dhvani@26";

    if (emailController.text.trim() == adminEmail &&
        passController.text.trim() == adminpassWord)
    {
      Get.to(()=> AdminHomeScreen());
    }
    else {
      _auth.signInWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passController.text.toString())
          .then((value) {
        Get.to(()=> UserBottomNavigationBarExample());
      })
          .onError((error, stackTrace) {
        FirebaseToastMsg().toastMessage(error.toString());
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: Form(
          key: _formkey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(Assestconstant.logo)),
                    SizedBox(height: 30),
                    Text(
                      "Welcome Back",
                      style: AppTextTheme.bold.copyWith(
                          color: ColorConstant.whiteColor, fontSize: 30),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Textformfiled(
                      text: 'Enter your Email',
                      textColor: ColorConstant.greyColor,
                      textSize: 14,
                      controller: emailController,
                      icon: Icon(Icons.mail),
                      title: 'Email',
                      titleColor: ColorConstant.greyColor,
                      titleSize: 14,
                      isLabelTextShow: true,
                    ),

                    Password(
                      text: 'Enter your PassWord',
                      textColor: ColorConstant.greyColor,
                      textSize: 14,
                      controller: passController,
                      icon: Icon(Icons.mail),
                      title: 'PassWord',
                      titleColor: ColorConstant.greyColor,
                      titleSize: 14,
                      isLabelTextShow: true,
                    ),
                    CustomElevatedButton(
                      text: 'Login',
                      onPressed: () {
                        if(_formkey.currentState!.validate());
                        login();
                      },
                      backgroundColor: ColorConstant.whiteColor,
                      textColor: ColorConstant.blackColor,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account ?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.whiteColor)),
                        SizedBox(width: 10),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => SignupScreen());
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
