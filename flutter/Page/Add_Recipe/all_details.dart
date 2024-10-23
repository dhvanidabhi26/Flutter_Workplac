import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_recipe/constant/assestconstant.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/project_spicific/elevated_button.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';
import 'package:get/get.dart';

class AllDetails extends StatefulWidget {
  final String recipeName;
  final File recipeImage;
  final String recipeType;
  final String recipeDescription;
  final String ingredients; // Expected format: "Ingredient1, Ingredient2, ..."
  final String ingredientCounts; // Expected format: "Count1, Count2, ..."
  final String dish;
  final String cuisine;

  const AllDetails({
    super.key,
    required this.recipeName,
    required this.recipeImage,
    required this.recipeType,
    required this.recipeDescription,
    required this.ingredients,
    required this.ingredientCounts,
    required this.dish,
    required this.cuisine,
  });

  @override
  State<AllDetails> createState() => _AllDetailsState();
}

class _AllDetailsState extends State<AllDetails> {
  @override
  Widget build(BuildContext context) {
    // Split ingredients and counts into lists
    final List<String> ingredientList = widget.ingredients.split(',');
    final List<String> countList = widget.ingredientCounts.split(',');

    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Row(
            children: [
              Image.asset(Assestconstant.back, height: 40, width: 40),
              const SizedBox(width: 10),
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

        //------------------------- Recipe Image and Name -------------------------
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 150,
            width: Get.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: ColorConstant.greyColor, blurRadius: 2),
              ],
              color: ColorConstant.whiteColor,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: Image.file(
                        widget.recipeImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.recipeName,
                          style: AppTextTheme.bold.copyWith(
                              fontSize: 22, color: ColorConstant.blackColor),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Image.asset(Assestconstant.avatar, height: 40, width: 40),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  "Anita Rose",
                                  style: AppTextTheme.bold.copyWith(
                                      fontSize: 18,
                                      color: ColorConstant.primary),
                                ),
                                Text(
                                  "Kitchen Storie",
                                  style: AppTextTheme.medium.copyWith(
                                      fontSize: 14,
                                      color: ColorConstant.blackColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        //--------------------- Ingredients ----------------------------
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: ColorConstant.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ingredients:",
                    style: AppTextTheme.bold.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(
                    ingredientList.length,
                        (index) {
                      String ingredient = ingredientList[index].trim();
                      String count = countList.length > index ? countList[index].trim() : 'N/A';
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ColorConstant.greyColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '$ingredient - $count',
                          style: AppTextTheme.medium.copyWith(
                              fontSize: 14, color: ColorConstant.blackColor),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

        //-------------------------- Description -------------------------
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            "Description",
            style: AppTextTheme.bold.copyWith(
                fontSize: 18, color: ColorConstant.blackColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 150,
            width: Get.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: ColorConstant.greyColor, blurRadius: 2),
              ],
              color: ColorConstant.whiteColor,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                widget.recipeDescription,
                style: AppTextTheme.regular.copyWith(
                    fontSize: 13, color: ColorConstant.blackColor),
              ),
            ),
          ),
        ),

        const Spacer(),

        CustomElevatedButton(
          isGoogleButton: false,
          onPressed: () {},
          text: "Submit final recipe",
        ),
      ]),
    );
  }
}
