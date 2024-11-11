import 'package:digital_society/utils/assestconstant.dart';
import 'package:digital_society/utils/colorconstant.dart';
import 'package:digital_society/utils/text_theme.dart';
import 'package:digital_society/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": Assestconstant.splash_screen1,
      "title": "Welcome to Digital Society",
      "description": "Empowering communities with seamless connectivity and smart solutions!"
    },
    {
      "image": Assestconstant.splash_screen2,
      "title": "Stay Connected",
      "description": "Manage and interact with your digital society efficiently, anytime and anywhere."
    },
    {
      "image": Assestconstant.splash_screen3,
      "title": "Transform Your Future",
      "description": "Track your progress and be part of a growing digital community for a better tomorrow."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemCount: _onboardingData.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Image.asset(
                _onboardingData[index]["image"]!,
                width: Get.width,
                height: Get.height/2,
              ),
              SizedBox(height: 20),
              Text(
                _onboardingData[index]["title"]!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Make text white
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  _onboardingData[index]["description"]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400], // Grey color text
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingData.length,
                      (dotIndex) => Container(
                    margin: const EdgeInsets.only(right: 5),
                    height: 10,
                    width: _currentIndex == dotIndex ? 12 : 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == dotIndex
                          ? ColorConstant.primary
                          : Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomSheet: Container(
        color: Colors.black,
        child: _currentIndex == _onboardingData.length - 1
            ? Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => LoginScreen());
            },
            child: Text("Get Started"),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: ColorConstant.primary,
            ),
          ),
        )
            : Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  _controller.jumpToPage(_onboardingData.length - 1);
                },
                child: Text(
                  "Skip",
                  style: AppTextTheme.bold.copyWith(
                    color: ColorConstant.primary,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.primary),
                onPressed: () {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
