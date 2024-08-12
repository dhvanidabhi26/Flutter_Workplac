import 'package:flutter/material.dart';
import 'package:module_5/constant/color.dart';
import 'package:module_5/constant/style.dart';


Widget CustomSearchField({required TextEditingController controller,required String hintText,Widget? prefixIcon,int? maxLines = 1,void Function(String)? onChanged}){
  return  TextFormField(
    controller: controller,
    cursorColor: white,
    maxLines: maxLines,
    enableSuggestions: false,
    autocorrect: false,
    style: TextStyle(color: white,fontWeight: FontWeight.w400, decoration: TextDecoration.none, decorationThickness: 0,),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: CustomStyle.AppStyle(color: white,fontWeight: FontWeight.w400),
      enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: white,width: 2)
      ),
      focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: white,width: 2)
      ),
      // prefixIcon: Icon(Icons.account_circle_outlined,color: primeColor,)
      prefixIcon: prefixIcon,
      contentPadding: EdgeInsets.only(left: 10),
    ),
    onChanged:onChanged,

  );
}