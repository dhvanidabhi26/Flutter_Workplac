import 'package:flutter/material.dart';
import 'package:food_recipe/constant/colorconstant.dart';

class Textformfiled extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String text;

  const Textformfiled({
    Key? key, required this.title, required this.text, required this.controller,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(title,style: TextStyle(color: ColorConstant.blackColor,fontSize: 12),),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            style: const TextStyle(fontSize: 15),
            decoration: InputDecoration(
              hintText: text,
              hintStyle: const TextStyle(color: Colors.grey,fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
