// ignore_for_file: unused_import

import 'package:cura_for_doctor/Pages/Onboarding/color.dart';
import 'package:cura_for_doctor/Pages/Onboarding/onboarding_data.dart';
import 'package:cura_for_doctor/Pages/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = OnboardingData();
  final pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                skip(),
              ],
            ),
            body(),
            buildDots(),
            button(),
          ],
        ),
      ),
    );
  }

  //Body
  Widget body() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Center(
        child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Images
                    Image.asset(controller.items[currentIndex].image),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    //Titles
                    Text(
                      controller.items[currentIndex].title,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: PrimaryColor,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),

                    //Descreptions
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Text(
                        controller.items[currentIndex].descreption,
                        style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  //Dots
  Widget buildDots() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            controller.items.length,
            (index) => AnimatedContainer(
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.005, vertical: height * 0.007),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: currentIndex == index ? PrimaryColor : Colors.grey),
                height: height * 0.007,
                width: currentIndex == index ? width * 0.07 : width * 0.017,
                duration: const Duration(milliseconds: 700))));
  }

  //Buttons
  Widget button() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        margin: EdgeInsets.symmetric(vertical: height * 0.02),
        width: width * 0.9,
        height: height * 0.06,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: PrimaryColor),
        child: TextButton(
          onPressed: () {
            setState(() {
              currentIndex != controller.items.length - 1
                  ? currentIndex++
                  : Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
            });
          },
          child: Text(
            currentIndex == controller.items.length - 1
                ? "Get Started"
                : "Continue",
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }

  //Skip
  Widget skip() {
    return TextButton(
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
            );
          });
        },
        child: Text(
          "Skip",
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: PrimaryColor),
        ));
  }
}
