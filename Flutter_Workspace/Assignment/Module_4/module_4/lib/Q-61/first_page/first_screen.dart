import 'package:flutter/material.dart';
import 'package:module_4/Q-61/first_page/menu.dart';
import 'package:module_4/Q-61/second_page/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class first_screen extends StatefulWidget
{
  const first_screen({super.key});

  @override
  State<first_screen> createState() => _first_screenState();
}

class _first_screenState extends State<first_screen>
{

  int _currentIndex = 0;
  late SharedPreferences prefs;

  final List<Widget> _tabs =
  [
    MenuTab(),
    CartTab(),
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index)
        {
          setState(() {
            _currentIndex = index;
          });
        },
        items:
        [
          BottomNavigationBarItem
            (
              icon: Icon(Icons.book),
              label: "Menu"
          ),
          BottomNavigationBarItem
            (
              icon: Icon(Icons.shopping_cart),
              label: "Cart"
          ),
        ],
      ),
    );
  }
}