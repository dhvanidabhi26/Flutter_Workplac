import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_society/utils/assestconstant.dart';
import 'package:digital_society/utils/colorconstant.dart';
import 'package:digital_society/utils/text_theme.dart';
import 'package:digital_society/widgets/carousel.dart';
import 'package:digital_society/widgets/gridview.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final List<Map<String, String>> slider = [
    {
      'image': Assestconstant.slider1,
      'text': 'Explore the Digital Community',
    },
    {
      'image': Assestconstant.slider2,
      'text': 'Interact, Share, and Learn',
    },
    {
      'image': Assestconstant.slider3,
      'text': 'Experience a Connected World',
    },
  ];
  final List<Map<String, String>> gridview = [
    {
      'image': Assestconstant.notic,
      'name': 'Notice Board',
      'subname': 'Connect with society members',
    },
    {
      'image': Assestconstant.payment,
      'name': 'Payment',
      'subname': 'Pay your society dues directly',
    },
    {
      'image': Assestconstant.event,
      'name': 'Event',
      'subname': 'Stay updated on upcoming events',
    },
    {
      'image': Assestconstant.member,
      'name': 'Member Directory',
      'subname': 'Find and connect with society members',
    },
    {
      'image': Assestconstant.community,
      'name': 'Community Forum',
      'subname': 'Participate in discussions and share ideas',
    },
    {
      'image': Assestconstant.announcements,
      'name': 'Announcements',
      'subname': 'Get the latest updates from the society',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          //------------------AppBar----------------//
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)
                  ),color: ColorConstant.whiteColor
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(Assestconstant.profile),
                      backgroundColor: ColorConstant.blackColor,
                      foregroundColor: ColorConstant.blackColor,
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi Dhvani",style: AppTextTheme.medium.copyWith(color: ColorConstant.blackColor),),
                        Text("House no.1",style: AppTextTheme.medium.copyWith(color: ColorConstant.blackColor),),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.notifications_active,color: ColorConstant.blackColor,)
                  ],
                ),
              ),
            ),
          ),

          //-----------------Slider-----------------//
          CarouselSlider(
            items: slider.map((items) {
              return Builder(builder: (BuildContext context) {
                return CustomCarouselItem(
                    imagePath: items['image']!, text: items['text']!);
              });
            }).toList(),
            options: CarouselOptions(
              height: 250.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 16 / 9,
            ),
          ),

          //-----------------GridView-----------------//
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: gridview.length,
              itemBuilder: (context, index) {
                return GridviewBuilderDemo(
                  name: gridview[index]['name']!,
                  image: gridview[index]['image']!,
                  subname: gridview[index]['subname']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

