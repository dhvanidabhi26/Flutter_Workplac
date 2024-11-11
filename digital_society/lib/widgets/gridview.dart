import 'package:digital_society/utils/colorconstant.dart';
import 'package:digital_society/utils/text_theme.dart';
import 'package:flutter/material.dart';

class GridviewBuilderDemo extends StatelessWidget {
  final String name;
  final String image;
  final String subname;

  const GridviewBuilderDemo({super.key, required this.name, required this.image, required this.subname});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)
          ),
        color: ColorConstant.whiteColor
      ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(image,width: 80,height: 80,),
                    Text(name, style: AppTextTheme.bold.copyWith(fontSize: 16, color: ColorConstant.blackColor),
                      textAlign: TextAlign.center,),
                    Text(subname, style: AppTextTheme.medium.copyWith(fontSize: 14, color: ColorConstant.greyColor),
                      textAlign: TextAlign.center,),
                  ],
                ),
              ),
    );
  }
}
