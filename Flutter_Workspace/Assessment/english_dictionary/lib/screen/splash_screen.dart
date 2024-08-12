import 'dart:async';

import 'package:english_dictionary/screen/dictionary_page.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2),()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen())));
  }
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        body: Center(
          child: Image.asset("images/animation.jpg",
            height:double.infinity,
            width:double.infinity,),
        ),
      );
  }
}
