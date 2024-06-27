import 'package:cura_for_doctor/Contants/CustomShapes/NavigationBar/CustomNavigationBar.dart';
import 'package:cura_for_doctor/Pages/Profile.dart';
import 'package:cura_for_doctor/Pages/Profile/Profile.dart';
import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentView = 0;
  Map<int, Widget> widgetMap = {
    // 0:
    4: const Profile()
  };

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
