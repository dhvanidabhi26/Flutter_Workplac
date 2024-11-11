import 'package:flutter/material.dart';

class Textformfiled extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final double titleSize;
  final Color titleColor;

  final String text;
  final Color textColor;
  final double textSize;


  final bool isLabelTextShow;

  final Icon icon;


  const Textformfiled({
    Key? key,
    required this.title,
    required this.text,
    required this.controller,
    required this.textColor,
    required this.titleColor,
    required this.titleSize,
    required this.isLabelTextShow,
    required this.icon,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding: const EdgeInsets.all(8.0),
      child:  Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                labelText: title,
                labelStyle: TextStyle(color:titleColor,fontSize:titleSize),
                hintText: isLabelTextShow ?text : null,
                hintStyle: TextStyle(color: textColor, fontSize:textSize),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: Colors.white,
                suffixIcon: icon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
