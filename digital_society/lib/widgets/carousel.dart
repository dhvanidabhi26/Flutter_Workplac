import 'package:digital_society/utils/colorconstant.dart';
import 'package:digital_society/utils/text_theme.dart';
import 'package:flutter/material.dart';

class CustomCarouselItem extends StatelessWidget {
  final String imagePath;
  final String text;

  const CustomCarouselItem({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image as background
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              text,
              style:  AppTextTheme.medium.copyWith(color: ColorConstant.whiteColor,fontSize: 22),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
