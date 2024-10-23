import 'package:flutter/material.dart';
import 'package:food_recipe/Page/Favourite/non_fv_screen.dart';
import 'package:get/get.dart';
import 'Page/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: "PublicSans"
      ),
      debugShowCheckedModeBanner: false,
      home: SpalshScreen());
  }
}
