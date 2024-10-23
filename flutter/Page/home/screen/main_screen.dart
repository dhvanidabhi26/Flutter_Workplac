import 'package:flutter/material.dart';
import 'package:food_recipe/constant/assestconstant.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/constant/iconconstant.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';
import 'package:get/get.dart';

class IngradientsScreen extends StatefulWidget {
  const IngradientsScreen({super.key});

  @override
  State<IngradientsScreen> createState() => _IngradientsScreenState();
}

class _IngradientsScreenState extends State<IngradientsScreen> {
  final List<String> ingredients = [
    "Cooking Oil",
    "Carrot",
    "Onion",
    "Garlic",
    "Salt",
    "Pepper",
    "Rice",
    "Soy Sauce"
  ];

  final List<String> quantities = [
    "2tsp",
    "2pc",
    "1pc",
    "2cloves",
    "1tsp",
    "1/2tsp",
    "1cup",
    "3tbsp"
  ];

  late List<bool> isSelected;
  int _selectedIndex = 0;
  int _options = 0;

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.filled(ingredients.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final hsize = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: hsize / 3,
              width: Get.width,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(Assestconstant.FriedRice1),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Image.asset(Assestconstant.back,
                              height: 40, width: 40),
                          onTap: () {
                            Get.back();
                          },
                        ),
                        SizedBox(width: 320),
                        Image.asset(Assestconstant.fv, height: 40, width: 40),
                      ],
                    ),
                  ),
                  Positioned(
                    top: hsize / 3.3,
                    left: 20,
                    child: Container(
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Fried Rice",
                            style: AppTextTheme.bold.copyWith(
                                fontSize: 18, color: ColorConstant.blackColor),
                          ),
                          Text(
                            "Pasta House, Kukatpally",
                            style: AppTextTheme.light.copyWith(
                                fontSize: 12, color: ColorConstant.greyColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: hsize / 3.2,
                    left: 380,
                    child: Image.asset(
                      Assestconstant.share,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(Assestconstant.profile, width: 50, height: 50),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Deo",
                        style: AppTextTheme.semibold.copyWith(
                            fontSize: 18, color: ColorConstant.blackColor),
                      ),
                      Text(
                        "Madhya Pradesh, India",
                        style: AppTextTheme.light.copyWith(
                            fontSize: 12, color: ColorConstant.greyColor),
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(Assestconstant.commite, width: 40, height: 40),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Divider(thickness: 1),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 15),
                      SizedBox(width: 5),
                      Text(
                        "4.5",
                        style: AppTextTheme.semibold.copyWith(
                            fontSize: 12, color: ColorConstant.blackColor),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "(12 reviews)",
                        style: AppTextTheme.regular.copyWith(
                            fontSize: 10, color: ColorConstant.greyColor),
                      ),
                    ],
                  ),
                  SizedBox(width: 70),
                  Row(
                    children: [
                      Icon(Icons.watch_later_outlined,
                          color: Colors.orange, size: 15),
                      SizedBox(width: 5),
                      Text(
                        "30 min",
                        style: AppTextTheme.semibold.copyWith(
                            fontSize: 12, color: ColorConstant.blackColor),
                      ),
                    ],
                  ),
                  SizedBox(width: 60),
                  Row(
                    children: [
                      ImageIcon(AssetImage(Iconconstant.chef),
                          size: 15, color: Colors.orange),
                      SizedBox(width: 5),
                      Text(
                        "Easy",
                        style: AppTextTheme.semibold.copyWith(
                            fontSize: 12, color: ColorConstant.blackColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /*====================== TAB BAR WIDGET =====================*/
            _tabBarWidget(),
            SizedBox(
              height: hsize * 0.4,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: _selectedIndex == 0
                    ? Ingredients()
                    : _selectedIndex == 1
                        ? description()
                        : Review(),
              ),
            ),
          ],
        ),
      ),
    ));
  }


  /*---------------  Tab bar for type -----------------*/
  _tabBarWidget(){
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 0;
              });
            },
            child: Column(
              children: [
                Text("Ingredients",  style: _selectedIndex == 0
                    ? AppTextTheme.bold.copyWith(
                    color: ColorConstant.blackColor, fontSize: 16)
                    : AppTextTheme.regular.copyWith(
                    color: ColorConstant.blackColor,
                    fontSize: 14),),
                const SizedBox(height: 5),
                Container(
                  height: 3,
                  width: Get.width * 0.3,
                  color: _selectedIndex == 0
                      ? ColorConstant.primary
                      : Colors.transparent,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
            child: Column(
              children: [
                Text("Description",
                  style: _selectedIndex == 1
                      ? AppTextTheme.bold.copyWith(
                      color: ColorConstant.blackColor, fontSize: 16)
                      : AppTextTheme.regular.copyWith(
                      color: ColorConstant.blackColor,
                      fontSize: 14),),
                const SizedBox(height: 5),
                Container(
                  height: 3,
                  width: Get.width * 0.3,
                  color: _selectedIndex == 1
                      ? ColorConstant.primary
                      : Colors.transparent,
                )

              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
            child: Column(
              children: [
                Text(
                  "Reviews(12)",
                  style: _selectedIndex == 2
                      ? AppTextTheme.bold.copyWith(
                      color: ColorConstant.blackColor,
                      fontSize: 16)
                      : AppTextTheme.regular.copyWith(
                      color: ColorConstant.blackColor,
                      fontSize: 14),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 3,
                  width: Get.width * 0.3,
                  color: _selectedIndex == 2
                      ? ColorConstant.primary
                      : Colors.transparent,
                )

              ],
            ),
          ),
        ],
      ),

    );
  }

  Widget Ingredients() {
    final hsize = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: hsize * 0.4,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: ingredients.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Radio<int>(
                    value: index,
                    groupValue: _options,
                    activeColor: Colors.orange,
                    onChanged: (int? value) {
                      if (value != null) {
                        setState(() {
                          _options = value;
                          isSelected = List.generate(
                            isSelected.length,
                                (i) => i == value,
                          ); // Update selected state
                        });
                      }
                    },
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ingredients[index],
                          style: AppTextTheme.regular.copyWith(
                            fontSize: 13,
                            color: ColorConstant.blackColor,
                          ),
                        ),
                        Text(
                          quantities[index],
                          style: AppTextTheme.regular.copyWith(
                            fontSize: 13,
                            color: ColorConstant.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget description() {
    final hsize = MediaQuery.of(context).size.height;
    return Container(
      height: hsize * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "Fried rice is a dish of cooked rice that has been stir-fried in a wok or a frying pan and is usually mixed "
              "with other ingredients such as eggs, vegetables, seafood, or meat. It is often eaten by itself or as an "
              "accompaniment to another dish.",
              style: AppTextTheme.regular
                  .copyWith(fontSize: 13, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              "Fried rice is a dish of cooked rice that has been stir-fried in a wok or a frying pan and is usually mixed "
              "with other ingredients such as eggs, vegetables, seafood, or meat. It is often eaten by itself or as an "
              "accompaniment to another dish.",
              style: AppTextTheme.regular
                  .copyWith(fontSize: 13, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget Review() {
    Widget _buildReviewItem() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  Assestconstant.profile,
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Deo",
                        style: AppTextTheme.semibold.copyWith(
                          fontSize: 18,
                          color: ColorConstant.blackColor,
                        ),
                      ),
                      Text(
                        "2 days ago",
                        style: AppTextTheme.light.copyWith(
                          fontSize: 12,
                          color: ColorConstant.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: List.generate(
                    4,
                    (index) => Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              "Fried rice is a dish of cooked rice that has been "
              "stir-fried in a wok or a frying pan and is usually "
              "mixed with other ingredients such as eggs.",
              style: AppTextTheme.regular.copyWith(
                fontSize: 14,
                color: ColorConstant.blackColor,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          _buildReviewItem(),
          Divider(thickness: 2),
          _buildReviewItem(),
        ],
      ),
    );
  }
}
