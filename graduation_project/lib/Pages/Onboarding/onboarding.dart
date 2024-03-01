// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/Login.dart';
import 'package:graduation_project/Pages/Onboarding/color.dart';
import 'package:graduation_project/Pages/Onboarding/onboarding_data.dart';
import 'package:graduation_project/Pages/SignUp.dart';

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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Images
                    Image.asset(controller.items[currentIndex].image),

                    const SizedBox(
                      height: 15,
                    ),
                    //Titles
                    Text(
                      controller.items[currentIndex].title,
                      style: const TextStyle(
                          fontSize: 25,
                          color: PrimaryColor,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    //Descreptions
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        controller.items[currentIndex].descreption,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16.0),
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
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            controller.items.length,
            (index) => AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: currentIndex == index ? PrimaryColor : Colors.grey),
                height: 7,
                width: currentIndex == index ? 30 : 7,
                duration: const Duration(milliseconds: 700))));
  }

  //Buttons
  Widget button() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: MediaQuery.of(context).size.width * .9,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: PrimaryColor),
        child: TextButton(
          onPressed: () {
            setState(() {
              currentIndex != controller.items.length - 1
                  ? currentIndex++
                  : Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
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
              MaterialPageRoute(builder: (context) => const SignUp()),
            );
          });
        },
        child: const Text(
          "Skip",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: PrimaryColor),
        ));
  }
}
