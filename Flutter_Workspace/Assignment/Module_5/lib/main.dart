import 'package:flutter/material.dart';
import 'package:module_5/pages/first_page.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Flutter Sqflite Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData
        (
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );;
  }
}