import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_recipe/Page/Add_Recipe/description.dart';
import 'package:food_recipe/constant/assestconstant.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/constant/iconconstant.dart';
import 'package:food_recipe/project_spicific/elevated_button.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FirstScreen extends StatefulWidget {

  const FirstScreen({super.key,});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  XFile? _image;

  TextEditingController _recipecontroller = TextEditingController();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10),
              child: Row(
                children: [
                  Image.asset(Assestconstant.back, height: 40, width: 40),
                  SizedBox(width: 10),
                  Text(
                    "Add Recipe",
                    style: AppTextTheme.bold.copyWith(fontSize: 18, color: ColorConstant.primary),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "We're excited to see your recipe! Let's start with the basics...",
                style: AppTextTheme.medium.copyWith(fontSize: 16, color: ColorConstant.blackColor),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Row(
                children: [
                  Image.asset(Iconconstant.chef, width: 20, height: 20, color: ColorConstant.greyColor),
                  SizedBox(width: 10),
                  Text(
                    "Name your recipe",
                    style: AppTextTheme.medium.copyWith(fontSize: 14, color: ColorConstant.greyColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: TextFormField(
                controller: _recipecontroller,
                decoration: InputDecoration(
                  hintText: "Enter the name of your recipe",
                  hintStyle: AppTextTheme.regular.copyWith(fontSize: 14, color: ColorConstant.greyColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
              child: Text(
                "Add A Recipe Photo",
                style: AppTextTheme.semibold.copyWith(fontSize: 16, color: ColorConstant.blackColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: _pickImage,
                child: _image != null
                    ? Image.file(File(_image!.path), width: 350, height: 350)
                    : Container(
                  height: 150,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: ColorConstant.imagebackground,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(Iconconstant.camera, width: 20, height: 20, color: ColorConstant.greyColor),
                      SizedBox(width: 10),
                      Text(
                        "Upload a final photo",
                        style: AppTextTheme.semibold.copyWith(fontSize: 14, color: ColorConstant.primary),
                      ),
                      Text(
                        "of your dish now",
                        style: AppTextTheme.semibold.copyWith(fontSize: 14, color: ColorConstant.primary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            CustomElevatedButton(text: "Next", onPressed: ()
            {
              Get.to(()=>Description(recipeName: _recipecontroller.text,recipeImage: File(_image?.path?? ""),));
            }, isGoogleButton: false,)
          ],
        ),
      ),
    );
  }
}
