import 'package:flutter/material.dart';
import 'package:module_5/constant/color.dart';
import 'package:module_5/custom_widgets/title.dart';


Widget CustomDateTimeField({required TextEditingController controller,required String title,Widget? prefixIcon,String? hintText,void Function()? onTap}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTitle(title: title),
      Container(
          child:Center(
              child:TextField(
                controller: controller,
                readOnly: true,
                decoration: InputDecoration(
                    // prefixIcon: prefixIcon,
                    hintText: hintText,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: primeColor)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: primeColor)
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10)
                ),

                onTap:onTap,
              )
          )
      ),
    ],
  );
}
