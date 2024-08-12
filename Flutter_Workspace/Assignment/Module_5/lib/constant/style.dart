import 'package:flutter/material.dart';
import 'package:module_5/constant/color.dart';


class CustomStyle
{
  static AppStyle({double fontsizs = 16, Color color = primeColor, FontWeight fontWeight = FontWeight.w500})
{
TextStyle textStyle = TextStyle(color: color, fontSize: fontsizs,fontWeight: fontWeight);
return textStyle;
}
 }