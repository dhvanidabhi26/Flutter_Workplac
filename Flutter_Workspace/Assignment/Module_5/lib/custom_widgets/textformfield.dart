import 'package:flutter/material.dart';
import 'package:module_5/constant/color.dart';

Widget CustomTextField({required TextEditingController controller,required String hintText,Widget? prefixIcon,int? maxLines = 1}){
  return  Padding(
    padding: EdgeInsets.only(bottom: 20),
    child: TextFormField(
      controller: controller,
      cursorColor: primeColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: primeColor)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: primeColor)
        ),
        // prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.only(left: 10),
      ),
    ),
  );
}