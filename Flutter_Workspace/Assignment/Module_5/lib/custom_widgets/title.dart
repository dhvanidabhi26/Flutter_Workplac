import 'package:flutter/material.dart';
import 'package:module_5/constant/color.dart';
import 'package:module_5/constant/style.dart';


Widget CustomTitle({required String title}){
  return Row(
    children: [
      SizedBox(width: 5,),
      Padding(
        padding: EdgeInsets.only(bottom: 2),
        child: Text(title,style: CustomStyle.AppStyle(color: greyColor,fontsizs: 14)),
      ),
    ],
  );
}
