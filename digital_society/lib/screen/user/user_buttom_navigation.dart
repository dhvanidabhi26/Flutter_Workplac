import 'package:digital_society/screen/user/user_chat_screen.dart';
import 'package:digital_society/screen/user/user_home_screen.dart';
import 'package:digital_society/screen/user/user_profile_screen.dart';
import 'package:digital_society/screen/user/user_service_screen.dart';
import 'package:digital_society/utils/colorconstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserBottomNavigationBarExample extends StatefulWidget {
  const UserBottomNavigationBarExample({super.key});

  @override
  State<UserBottomNavigationBarExample> createState() =>
      _UserBottomNavigationBarExampleState();
}

class _UserBottomNavigationBarExampleState
    extends State<UserBottomNavigationBarExample> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
   const UserHomeScreen(),
    const UserChatScreen(),
    const UserServiceScreen(),
    const UserProfileScreen(),
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
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
           borderRadius: BorderRadius.all(
            const Radius.circular(100),
          ),
        ),
        child: FloatingActionButton(
          backgroundColor: ColorConstant.primary,
          onPressed: () {
             Get.to(() => UserHomeScreen());
          },
          child: Icon(
            Icons.add,
            color: ColorConstant.whiteColor,
          ),
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
              icon: Icon(
                _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
                size: 24,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 1
                    ? Icons.favorite
                    : Icons.favorite_border_sharp,
                size: 24,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 2
                    ? Icons.shopping_cart_rounded
                    : Icons.shopping_cart_outlined,
                size: 24,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 3 ? Icons.person : Icons.person_3_outlined,
                size: 24,
              ),
              label: '',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor:ColorConstant.primary,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
