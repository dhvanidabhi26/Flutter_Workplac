import 'package:flutter/material.dart';
import 'package:food_recipe/constant/assestconstant.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/constant/iconconstant.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';
import 'package:get/get.dart';

class FvScreen extends StatefulWidget {
  const FvScreen({super.key});

  @override
  State<FvScreen> createState() => _FvScreenState();
}

class _FvScreenState extends State<FvScreen> {
  final List<Map<String, String>> details = [
    {
      "image": Assestconstant.EybisiSalad,
      "name": "Eybisi Salad Mix",
      "desc": "Mix vegetable ingredients",
    },
    {
      "image": Assestconstant.GreakSalad,
      "name": "Easy Greek Salad",
      "desc": "Loves and Lemon",
    },
    {
      "image": Assestconstant.EybisiSalad,
      "name": "Eybisi Salad Mix",
      "desc": "Mix vegetable ingredients",
    },
    {
      "image": Assestconstant.GreakSalad,
      "name": "Easy Greek Salad",
      "desc": "Loves and Lemon",
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Image.asset(
                  Assestconstant.back,
                  height: 40,
                  width: 40,
                ),
                const SizedBox(width: 20),
                Text(
                  "Favourite",
                  style: AppTextTheme.bold.copyWith(fontSize: 18, color: Colors.orange),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: details.length,
              itemBuilder: (BuildContext context, int index) {
                final item = details[index];
                final String image = item["image"]!;
                final String name = item["name"]!;
                final String desc = item["desc"]!;
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 2,
                  shadowColor:Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(5.0)),
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(image),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          name,
                                          style: AppTextTheme.semibold.copyWith(
                                            fontSize: 15,
                                            color: ColorConstant.blackColor,
                                          ),
                                        ),
                                        Text(
                                          desc,
                                          style: AppTextTheme.regular.copyWith(
                                            fontSize: 12,
                                            color: ColorConstant.greyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 10,
                              left: Get.width*0.35,
                              child: Image.asset(Iconconstant.favourite,width: 25,height: 25,color: ColorConstant.primary,))
                        ],
                      ),
                    ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
