import 'package:flutter/material.dart';
import 'package:task/home_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OpenHouseTaskScreen(),
    );
  }
}

