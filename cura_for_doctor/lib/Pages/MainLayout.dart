import 'package:cura_for_doctor/Contants/CustomShapes/NavigationBar/CustomNavigationBar.dart';
import 'package:cura_for_doctor/Pages/AppointmentPage/ReservedTimeSlotPage.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/CalenderViewPage.dart';
import 'package:cura_for_doctor/Pages/HomePage/Home.dart';
import 'package:cura_for_doctor/Pages/Profile/Profile.dart';
import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  Doctor doctor = new Doctor();
  MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentView = 0;
  Map<int, Widget> widgetMap = {
    // 0: HomePage(),
    0: ReservedTimeSlotPage(),
    3: Profile()
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
