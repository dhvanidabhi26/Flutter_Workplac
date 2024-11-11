import 'package:digital_society/utils/colorconstant.dart';
import 'package:digital_society/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isImage;
  final double imageHeight;
  final double imageWidth;
  final Image? image;
  final bool isIcon;
  final Icon? icon;
  final double iconHeight;
  final double iconWidth;
  final double borderRadius;
  final bool isBorder;
  final Color borderColor;
  final double borderThikness;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius = 25.0,
    required this.isImage,
    this.image,
    required this.imageHeight,
    required this.imageWidth,
    required this.isIcon,
    this.icon,
    required this.iconHeight,
    required this.iconWidth,
    required this.isBorder,
    required this.borderColor,
    required this.borderThikness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                if (isImage && image != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                        height: imageHeight, width: imageWidth, child: image),
                  ),
                SizedBox(width: 10),
                Text(
                  text,
                  style: AppTextTheme.regular
                      .copyWith(fontSize: 14, color: ColorConstant.blackColor),
                ),
                SizedBox(
                  width: 20,
                ),
                if (isIcon && icon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                        height: iconHeight, width: iconWidth, child: icon),
                  ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: isBorder
                ? Border.all(
                    color: borderColor,
                    width: borderThikness,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
