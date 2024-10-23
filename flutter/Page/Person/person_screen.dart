import 'package:flutter/material.dart';
import 'package:food_recipe/constant/assestconstant.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/project_spicific/elevated_button.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {

  TextEditingController namecontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController recipecontroller = TextEditingController();
  TextEditingController feedbackcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      Assestconstant.back,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "Profile",
                    style: AppTextTheme.bold.copyWith(fontSize: 18, color: Colors.orange),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 2,
                shadowColor: ColorConstant.greyColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Image.asset(Assestconstant.profile,width: 60,height: 60,),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("John Deo",style: AppTextTheme.bold.copyWith(fontSize: 22,color: ColorConstant.blackColor),),
                          Text("JohnDeo@gmail.com",style: AppTextTheme.regular.copyWith(fontSize: 14,color: ColorConstant.greyColor),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 2,
                shadowColor: ColorConstant.greyColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: namecontroller,
                          decoration: InputDecoration(
                            hintText: "JohnDeo",
                            hintStyle: AppTextTheme.regular.copyWith(fontSize: 14,color: ColorConstant.greyColor),
                            labelText: "Username",
                            labelStyle: AppTextTheme.semibold.copyWith(fontSize: 15,color: ColorConstant.blackColor)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: mobilecontroller,
                          decoration: InputDecoration(
                              hintText: "+91 9988776655",
                              hintStyle: AppTextTheme.regular.copyWith(fontSize: 14,color: ColorConstant.greyColor),
                              labelText: "Mobile Number",
                              labelStyle: AppTextTheme.semibold.copyWith(fontSize: 15,color: ColorConstant.blackColor)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: passcontroller,
                          decoration: InputDecoration(
                              hintText: "*******",
                              hintStyle: AppTextTheme.regular.copyWith(fontSize: 14,color: ColorConstant.greyColor),
                              labelText: "Change Password",
                              labelStyle: AppTextTheme.semibold.copyWith(fontSize: 15,color: ColorConstant.blackColor),
                              suffixIcon: Icon(Icons.arrow_forward_ios)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: recipecontroller,
                          decoration: InputDecoration(
                              hintText: "Your Recipes",
                              hintStyle: AppTextTheme.regular.copyWith(fontSize: 14,color: ColorConstant.greyColor),
                              labelText: "User Recipe",
                              labelStyle: AppTextTheme.semibold.copyWith(fontSize: 15,color: ColorConstant.blackColor),
                              suffixIcon: Icon(Icons.arrow_forward_ios)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: feedbackcontroller,
                          decoration: InputDecoration(
                              hintText: "Feedback",
                              hintStyle: AppTextTheme.regular.copyWith(fontSize: 14,color: ColorConstant.greyColor),
                              labelText: "Feedback",
                              labelStyle: AppTextTheme.semibold.copyWith(fontSize: 15,color: ColorConstant.blackColor)
                          ),
                        ),
                      ),
                      CustomElevatedButton(text:"Delete Account", onPressed: (){}, isGoogleButton: false)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
