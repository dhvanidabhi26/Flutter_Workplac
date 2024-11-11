import 'package:digital_society/screen/user/user_buttom_navigation.dart';
import 'package:digital_society/screen/user/user_home_screen.dart';
import 'package:digital_society/utils/assestconstant.dart';
import 'package:digital_society/utils/colorconstant.dart';
import 'package:digital_society/utils/text_theme.dart';
import 'package:digital_society/services/toast_msg.dart';
import 'package:digital_society/screen/auth/login_screen.dart';
import 'package:digital_society/widgets/button/elevatedbutton.dart';
import 'package:digital_society/widgets/password/password.dart';
import 'package:digital_society/widgets/text_formfield/textformfiled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(Assestconstant.logo),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Register",
                    style: AppTextTheme.bold.copyWith(
                      color: ColorConstant.whiteColor, fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 60),
                  Textformfiled(
                    text: 'Enter your Username',
                    textColor: ColorConstant.greyColor,
                    textSize: 14,
                    controller: usernameController,
                    icon: Icon(Icons.person),
                    title: 'Username',
                    titleColor: ColorConstant.greyColor,
                    titleSize: 14,
                    isLabelTextShow: true,
                  ),
                  Textformfiled(
                    text: 'Enter your Phone',
                    textColor: ColorConstant.greyColor,
                    textSize: 14,
                    controller: phoneController,
                    icon: Icon(Icons.phone_android_sharp),
                    title: 'Phone',
                    titleColor: ColorConstant.greyColor,
                    titleSize: 14,
                    isLabelTextShow: true,
                  ),
                  Textformfiled(
                    text: 'Enter House No.',
                    textColor: ColorConstant.greyColor,
                    textSize: 14,
                    controller: emailController,
                    icon: Icon(Icons.mail),
                    title: 'House No.',
                    titleColor: ColorConstant.greyColor,
                    titleSize: 14,
                    isLabelTextShow: true,
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
                    icon: Icon(Icons.lock),
                    title: 'PassWord',
                    titleColor: ColorConstant.greyColor,
                    titleSize: 14,
                    isLabelTextShow: true,
                  ),
                  SizedBox(height: 20),
                  CustomElevatedButton(
                    text: 'Sign up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _auth.createUserWithEmailAndPassword(
                          email: emailController.text.toString(),
                          password: passController.text.toString(),).then((value)
                        {
                          Get.to(()=>UserBottomNavigationBarExample());
                        }).onError((error,stackTrace){
                          FirebaseToastMsg().toastMessage(error.toString());
                        });

                      }
                    },
                    backgroundColor: ColorConstant.whiteColor,
                    textColor: ColorConstant.blackColor,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I have an account already?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.whiteColor,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => LoginScreen());
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
