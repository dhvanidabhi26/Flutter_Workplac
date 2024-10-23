import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_recipe/Page/Add_Recipe/all_details.dart';
import 'package:food_recipe/constant/assestconstant.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/constant/iconconstant.dart';
import 'package:food_recipe/project_spicific/elevated_button.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';
import 'package:get/get.dart';

class FindRecipe extends StatefulWidget {
  final String recipeName;
  final File recipeImage;
  final String recipeType;
  final String recipeDescription;
  final List<String> ingredients;
  final List<int> ingredientCounts;

  const FindRecipe({super.key, required this.recipeName, required this.recipeImage, required this.recipeType, required this.recipeDescription, required this.ingredients, required this.ingredientCounts});

  @override
  State<FindRecipe> createState() => _FindRecipeState();
}

class _FindRecipeState extends State<FindRecipe> {

  TextEditingController _dishcontroller = TextEditingController();
  TextEditingController _cuisinecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Row(
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
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  "Let's add some categories to make your \nrecipe easy to find!",
                  style: AppTextTheme.medium.copyWith(
                    fontSize: 16,
                    color: ColorConstant.blackColor,
                  ),
                ),
              ]),
              SizedBox(height: 50),
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(Iconconstant.recipe,height: 20,width: 20),
                      SizedBox(width: 5),
                      Text("Dish type",style: AppTextTheme.medium.copyWith(fontSize: 14,color: ColorConstant.blackColor),),
                    ],
                  ),
                  TextFormField(
                    controller: _dishcontroller,
                    decoration: InputDecoration(hintText: "Enter dish type"),
                    style: AppTextTheme.medium.copyWith(fontSize: 16,color: ColorConstant.greyColor),)
                ],
              ),
              SizedBox(height: 10,),
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(Iconconstant.recipe,height: 20,width: 20),
                      SizedBox(width: 5),
                      Text("Cuisine",style: AppTextTheme.medium.copyWith(fontSize: 14,color: ColorConstant.blackColor),),
                    ],
                  ),
                  TextFormField(
                    controller: _cuisinecontroller,
                    decoration: InputDecoration(hintText: "Enter cuisine"),
                    style: AppTextTheme.medium.copyWith(fontSize: 16,color: ColorConstant.greyColor),)
                ],
              ),
              Spacer(),
              CustomElevatedButton(text: "Next", onPressed: ()
              {
                Get.to(()=>AllDetails(
                  recipeName: widget.recipeName,
                  recipeImage: widget.recipeImage,
                  recipeType: widget.recipeType,
                  recipeDescription: widget.recipeDescription,
                  ingredients: widget.ingredients.toString(),
                  ingredientCounts: widget.ingredientCounts.toString(),
                  dish: _dishcontroller.text,
                  cuisine: _cuisinecontroller.text,
                ));
              }, isGoogleButton: false,)
            ],
          ),
        ),
      ),
    );
  }
}

