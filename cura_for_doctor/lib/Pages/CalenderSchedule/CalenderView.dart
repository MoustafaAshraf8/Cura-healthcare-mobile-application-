import 'package:cura_for_doctor/Pages/CalenderSchedule/Calender/CalenderWidget.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/EventEditing.dart';
import 'package:cura_for_doctor/class/AppTheme.dart';
import 'package:flutter/material.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const CalenderWidget(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.customGold,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: ((context) => const EventEditing())),
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
