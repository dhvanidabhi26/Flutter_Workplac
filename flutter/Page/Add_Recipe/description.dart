import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_recipe/Page/Add_Recipe/Ingredients.dart';
import 'package:food_recipe/constant/assestconstant.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/project_spicific/elevated_button.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';
import 'package:get/get.dart';

class Description extends StatefulWidget {

  final String recipeName;
  final File recipeImage;

  const Description({super.key, required this.recipeName, required this.recipeImage});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  TextEditingController _description = TextEditingController();
  final List<String> list = ["Select", "Easy", "Medium", "Low"];
  String dropdownValue = "Select";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Image.asset(Assestconstant.back, height: 40, width: 40),
                  SizedBox(width: 10),
                  Text(
                    "Add Recipe",
                    style: AppTextTheme.bold.copyWith(
                      fontSize: 18,
                      color: ColorConstant.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Something's cooking! Let's add a few more \n details...",
                  style: AppTextTheme.medium.copyWith(
                    fontSize: 16,
                    color: ColorConstant.blackColor,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  "Baking Time",
                  style: AppTextTheme.semibold.copyWith(
                    fontSize: 16,
                    color: ColorConstant.blackColor,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "How long does the dish need to \nbake for?",
                        style: AppTextTheme.medium.copyWith(
                          fontSize: 14,
                          color: ColorConstant.greyColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 40,
                      width: 70,
                      decoration: BoxDecoration(
                        color: ColorConstant.imagebackground,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          "10 min",
                          style: AppTextTheme.bold.copyWith(
                            fontSize: 14,
                            color: ColorConstant.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(thickness: 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Baking Type",
                  style: AppTextTheme.semibold.copyWith(
                    fontSize: 16,
                    color: ColorConstant.blackColor,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text("Select Difficulty: "),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.imagebackground,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: DropdownButton<String>(
                        dropdownColor: ColorConstant.whiteColor,
                        icon: Icon(Icons.keyboard_arrow_down),
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          }
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: AppTextTheme.semibold.copyWith(
                    fontSize: 16,
                    color: ColorConstant.blackColor,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 250,
                  width: 350,
                  decoration: BoxDecoration(
                    color: ColorConstant.imagebackground,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _description,
                      decoration:  InputDecoration(
                        hintText: "Description",
                        hintStyle: AppTextTheme.regular.copyWith(fontSize: 14,color: ColorConstant.greyColor),
                        border: InputBorder.none
                      ),
                    ),
                  )
                ),
              ],
            ),
            Spacer(),
            CustomElevatedButton(text: "Next", onPressed: ()
            {
              Get.to(()=>Ingredients(recipeName: widget.recipeName,recipeImage: widget.recipeImage,recipeDescription:_description.text,recipeType:dropdownValue,));
            }, isGoogleButton: false,)
          ],
        ),
      ),
    );
  }
}
