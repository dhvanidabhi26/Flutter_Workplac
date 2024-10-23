import 'package:flutter/material.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';

class EnjoyDelicousFoodMenu extends StatelessWidget {
  final bool isSelected;
  final String image;
  final String name;
  final String desc;
  final VoidCallback onPress;

  const EnjoyDelicousFoodMenu({super.key, required this.isSelected, required this.image, required this.name, required this.desc, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 2.0,
      child: Container(
        height: 260,
        width: 200,
        padding:const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color:ColorConstant.whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 2.0,
                  child: Container(
                    height: 35,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: ColorConstant.greenColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("4.5",style: AppTextTheme.bold.copyWith(
                          fontSize: 14,
                          color: ColorConstant.whiteColor
                        )),
                        const SizedBox (width: 2),
                        const Icon(Icons.star,color: ColorConstant.whiteColor,size: 15,)
                      ],
                    ),
                  ),
                )
              ],
            ),
            Image.asset(
              image,
              height: 140,
              width: 140,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 10),
            Text(name,style: AppTextTheme.semibold.copyWith(
                fontSize: 18,
                color: ColorConstant.blackColor)),
              Text(desc, style: AppTextTheme.regular.copyWith(
                fontSize: 12,
                color: ColorConstant.greyColor)),
          ],
        ),
      ),
    );
  }
}
