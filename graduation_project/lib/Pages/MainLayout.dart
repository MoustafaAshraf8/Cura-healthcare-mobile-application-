import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/CustomNavigationBar.dart';
import 'package:graduation_project/Pages/Profile.dart';
import 'package:graduation_project/Pages/Schedule.dart';

import 'Home.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentView = 0;
  Map<int, Widget> widgetMap = {0: Home(), 1: Schedule(), 4: Profile()};

  void updateView(int index) {
    setState(() {
      currentView = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: true,
      right: true,
      child: Scaffold(
        body: widgetMap[currentView],
        bottomNavigationBar: CustomNavigationBar(updateView: updateView),
      ),
    );
  }
}