import 'package:flutter/material.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final bool isGoogleButton;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = ColorConstant.primary,
    this.textColor = Colors.white,
    this.borderRadius = 25.0,
    required this.isGoogleButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isGoogleButton
        ? Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: onPressed,
              child: Container(
                height: 60,
                width: Get.width,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: AppTextTheme.regular.copyWith(
                          fontSize: 14,
                          color: ColorConstant.primary
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        "assets/images/Group 403.png",
                        height: 20,
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(onTap: onPressed,

              child: Container(
                height: 60,
                width: Get.width,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: textColor, fontSize: 14),
                  ),
                ),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
          );
  }
}
