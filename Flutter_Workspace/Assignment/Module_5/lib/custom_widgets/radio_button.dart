import 'package:flutter/material.dart';
import 'package:module_5/constant/color.dart';

Widget CustomRadioButton({required String title,required String value,required String? groupValue,required void Function(String?)? onChanged}) {
  return Row(
    children: [
      Text(title, style: TextStyle(color: Colors.black),),
      Radio(
        value: value,
        activeColor: primeColor,
        groupValue: groupValue,
        onChanged: onChanged,)
    ],
  );
}