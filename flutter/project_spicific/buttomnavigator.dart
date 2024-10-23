import 'package:flutter/material.dart';
import 'package:food_recipe/Page/Add_Recipe/image_picker.dart';
import 'package:food_recipe/Page/Favourite/fv_screen.dart';
import 'package:food_recipe/Page/Person/person_screen.dart';
import 'package:food_recipe/Page/Shopping/shopping_screen.dart';
import 'package:food_recipe/Page/home/home_screen.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/constant/iconconstant.dart';
import 'package:get/get.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    FvScreen(),
    ShoppingScreen(),
    PersonScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bgColor,
      body: _pages[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstant.primary,
        onPressed: ()
        {
          Get.to(()=>FirstScreen());
        },
        child: Icon(
          Icons.add,
          color: ColorConstant.whiteColor,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedIndex == 0 ? Iconconstant.home2 : Iconconstant.home,
                height: 20,
                width: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedIndex == 1 ? Iconconstant.fv2 : Iconconstant.fv,
                height: 20,
                width: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedIndex == 2 ? Iconconstant.shopping2 : Iconconstant.shopping,
                height: 30,
                width: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedIndex == 3 ? Iconconstant.person2 : Iconconstant.person,
                height: 25,
                width: 25,
              ),
              label: '',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.red,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
