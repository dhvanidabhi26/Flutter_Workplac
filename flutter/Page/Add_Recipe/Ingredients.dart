import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_recipe/Page/Add_Recipe/find_recipe.dart';
import 'package:food_recipe/constant/assestconstant.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/project_spicific/elevated_button.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';
import 'package:get/get.dart';

class Ingredients extends StatefulWidget {
  final String recipeName;
  final File recipeImage;
  final String recipeType;
  final String recipeDescription;

  const Ingredients({
    Key? key,
    required this.recipeName,
    required this.recipeImage,
    required this.recipeType,
    required this.recipeDescription,
  }) : super(key: key);

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  List<String> ingredients = [];
  List<int> ingredientCounts = [];

  void increment(int index) {
    setState(() {
      if (ingredientCounts[index] < 10) {
        ingredientCounts[index]++;
      }
    });
  }

  void decrement(int index) {
    setState(() {
      if (ingredientCounts[index] > 0) {
        ingredientCounts[index]--;
      }
    });
  }

  void _showAddIngredientDialog() {
    TextEditingController newIngredientController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Ingredient"),
          content: TextField(
            controller: newIngredientController,
            decoration: InputDecoration(labelText: "Ingredient Name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                String newIngredient = newIngredientController.text.trim();
                if (newIngredient.isNotEmpty) {
                  setState(() {
                    ingredients.add(newIngredient);
                    ingredientCounts.add(0);
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              "A recipe would be nothing without the \ningredients! What goes in your dish?",
              style: AppTextTheme.medium.copyWith(fontSize: 16, color: ColorConstant.blackColor),
            ),
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Ingredients",
                  style: AppTextTheme.semibold.copyWith(fontSize: 16, color: ColorConstant.blackColor),
                ),
              ),
              ...List.generate(ingredients.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConstant.greyColor),
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  ingredients[index],
                                  style: AppTextTheme.regular.copyWith(fontSize: 14, color: ColorConstant.blackColor),
                                ),
                                Text(
                                  "(Tbs)",
                                  style: AppTextTheme.regular.copyWith(fontSize: 12, color: ColorConstant.greyColor),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  increment(index);
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: ColorConstant.blackColor),
                                      color: ColorConstant.whiteColor,
                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Icon(Icons.add),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text('${ingredientCounts[index]}'), // Display the count
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  decrement(index);
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: ColorConstant.blackColor),
                                      color: ColorConstant.whiteColor,
                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Icon(Icons.remove),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: _showAddIngredientDialog,
                  child: Container(
                    height: 60,
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConstant.primary),
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "+ Add an ingredient",
                          style: TextStyle(color: ColorConstant.primary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomElevatedButton(
              text: "Next",
              backgroundColor: ColorConstant.primary,
              textColor: ColorConstant.whiteColor,
              onPressed: () {
                if (ingredients.isNotEmpty) {
                  Get.to(() => FindRecipe(
                    recipeName: widget.recipeName,
                    recipeImage: widget.recipeImage,
                    recipeType: widget.recipeType,
                    recipeDescription: widget.recipeDescription,
                    ingredients: ingredients.toList(),
                    ingredientCounts: ingredientCounts.toList(),
                  ));
                }
              },
              isGoogleButton: false,
            ),
          ),
        ],
      ),
    );
  }
}
