
import 'package:digital_society/widgets/button/button.dart';
import 'package:digital_society/widgets/button/elevatedbutton.dart';
import 'package:digital_society/widgets/drop_downbutton/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<String> _name = ["dhvani", "meet", "miteh", "parth"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          DropdownButtonWidget(items: _name),
          SizedBox(height: 10),
          CustomElevatedButton(
            text: 'Login',
            onPressed: () {},
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 10),
          Button(
            text: 'Login with Gmail',
            onPressed: () {},
            backgroundColor: Colors.blue,
            textColor: Colors.black,
            isImage: true,
            image: Image.asset("assets/images/download.png"),
            imageHeight: 50,
            imageWidth: 50,
            isIcon: true,
            icon: Icon(Icons.arrow_forward_ios_outlined),
            iconHeight: 20,
            iconWidth: 20,
            isBorder: false,
            borderColor: Colors.red,
            borderThikness: 3,
          )
        ],
      ),
    );
  }
}
