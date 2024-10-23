import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/Page/login_screen.dart';
import 'package:food_recipe/constant/assestconstant.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/project_spicific/elevated_button.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';
import 'package:get/get.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:Get.height ,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Assestconstant.splashBackground),fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(Assestconstant.FoodRecipes),
            ),
            const SizedBox(height: 20),
            Text(
              "Simple and delicious \nrecipes for everyone",
              textAlign: TextAlign.center,
              style: AppTextTheme.regular.copyWith(
                  fontSize: 24
              ),
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              text: "Sign In",
              backgroundColor: Colors.white,
              textColor: ColorConstant.primary,
              onPressed: ()
              {
                Get.to(()=> LoginScreen());
              }, isGoogleButton: false,),
            const SizedBox(height: 10),
            CustomElevatedButton(
              text: "Continue With Google",
              backgroundColor: Colors.white,
              textColor: ColorConstant.primary,
              onPressed: (){}, isGoogleButton: true,)
          ],
        ),
      ),

    );
  }
}
