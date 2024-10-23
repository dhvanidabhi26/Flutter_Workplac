import 'package:flutter/material.dart';
import 'package:food_recipe/Page/home/widgets/enjoy_delicous_food_details.dart';
import 'package:food_recipe/Page/home/widgets/enjoy_delicous_food_menu.dart';
import 'package:food_recipe/Page/home/widgets/enjoy_delicous_food_widget.dart';
import 'package:food_recipe/constant/assestconstant.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/constant/iconconstant.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';
import 'package:get/get.dart';

import 'screen/main_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  final List categories = [
    {"name": "Pizza", "image": Assestconstant.Pizza},
    {"name": "Burger", "image": Assestconstant.Burger},
    {"name": "Noodles", "image": Assestconstant.Noddles},
  ];

  final List details = [
    {
      "image": Assestconstant.EybisiSalad,
      "name": "Eybisi Salad Mix",
      "desc": "Mix vegetable ingredients",
    },
    {
      "image": Assestconstant.GreakSalad,
      "name": "Easy Greek Salad",
      "desc": "Loves and Lemon",
    },
  ];

  final List desc = [
    {
      "image": Assestconstant.FriedRice,
      "name": "Fried Rice",
      "desc": "Chinese, North Indian",
    },
    {
      "image": Assestconstant.Pasta,
      "name": "Pasta",
      "desc": "Chinese, Fast Food",
    },
    {
      "image": Assestconstant.FriedRice,
      "name": "Fried Rice",
      "desc": "Chinese, North Indian",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: _headerWidget(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _titleSection(),
                  _categoriesList(),
                  _menuList(),
                  _detailsList(),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: _drawerWidget(),
    );
  }

  Widget _headerWidget() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            _globalKey.currentState?.openDrawer();
          },
          icon: Image.asset(
            Iconconstant.menu,
            height: 22,
            width: 22,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstant.search,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: ColorConstant.searchtext,
                      size: 14,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Search food",
                      style: AppTextTheme.regular.copyWith(
                        fontSize: 12,
                        color: ColorConstant.searchtext,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            color: ColorConstant.search,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 50,
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              Iconconstant.filter,
              height: 24,
              width: 24,
            ),
          ),
        ),
      ],
    );
  }

  Widget _titleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        'Enjoy Delicious Food',
        style: AppTextTheme.bold.copyWith(
          fontSize: 22,
          color: ColorConstant.blackColor,
        ),
      ),
    );
  }

  Widget _categoriesList() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return EnjoyDelicousFoodWidget(
            image: categories[index]['image'],
            isSelected: false,
            name: categories[index]['name'],
            onPress: () {},
          );
        },
      ),
    );
  }

  Widget _menuList() {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: details.length,
        itemBuilder: (context, index) {
          return EnjoyDelicousFoodMenu(
            image: details[index]['image'],
            isSelected: false,
            name: details[index]['name'],
            onPress: () {},
            desc: details[index]['desc'],
          );
        },
      ),
    );
  }

  Widget _detailsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: desc.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return EnjoyDeliciousFoodDetails(
          image: desc[index]['image'],
          isSelected: false,
          name: desc[index]['name'],
          onPress: () {
            Get.offAll(() => IngradientsScreen());
          },
          desc: desc[index]['desc'],
        );
      },
    );
  }

  Widget _drawerWidget() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Image.asset(
                  Assestconstant.profile,
                  height: 60,
                  width: 60,
                ),
                SizedBox(width: 10),
                Text(
                  "John Deo",
                  style: AppTextTheme.bold.copyWith(
                    fontSize: 22,
                    color: ColorConstant.blackColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    _drawerItem("Cuisines List (counter)"),
                    _drawerItem("Cuisines List (counter)"),
                    _drawerActionItem("About Us", Icons.info_outline),
                    _drawerActionItem("Contact Us", Icons.person),
                    _drawerActionItem(
                        "Privacy Policy", Icons.privacy_tip_outlined),
                  ],
                )),
                _socialMediaSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 20),
      child: Text(
        title,
        style: AppTextTheme.medium.copyWith(
          fontSize: 17,
          color: ColorConstant.blackColor,
        ),
      ),
    );
  }

  Widget _drawerActionItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Row(
        children: [
          Icon(icon, size: 20),
          SizedBox(width: 10),
          Text(
            title,
            style: AppTextTheme.medium.copyWith(
              fontSize: 17,
              color: ColorConstant.blackColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialMediaSection() {
    return Column(
      children: [
        Text(
          "Follow us on Social Media",
          style: AppTextTheme.medium.copyWith(
            fontSize: 17,
            color: ColorConstant.blackColor,
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.all(15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: ColorConstant.whiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 1, blurRadius: 15)
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Assestconstant.fb,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: ColorConstant.whiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 1, blurRadius: 15)
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Assestconstant.twitter,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: ColorConstant.whiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 1, blurRadius: 15)
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Assestconstant.instragram,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ]),
        ),
        SizedBox(height: 30),
        Text(
          "V2.1",
          style: AppTextTheme.medium.copyWith(
            fontSize: 17,
            color: ColorConstant.blackColor,
          ),
        ),
      ],
    );
  }
}
