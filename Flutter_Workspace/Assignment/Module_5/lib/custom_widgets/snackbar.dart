
import 'package:flutter/material.dart';
import 'package:module_5/constant/color.dart';
import 'package:module_5/constant/style.dart';


ScaffoldFeatureController<SnackBar, SnackBarClosedReason> CustomDialog({required BuildContext context,required String title,Color backgroundColor = Colors.lightBlueAccent,IconData? icon}){
  return  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Row(
        children: [
          icon != null?Icon(icon,size: 35,color: white,):SizedBox(),
          icon != null?SizedBox(width: 10,):SizedBox(),
          Text(title,style: CustomStyle.AppStyle(color: white,fontsizs: 16,fontWeight: FontWeight.w400),),
        ],
      ),
        backgroundColor: backgroundColor, padding: EdgeInsets.symmetric(vertical: 18,horizontal: 20),)
  );
}