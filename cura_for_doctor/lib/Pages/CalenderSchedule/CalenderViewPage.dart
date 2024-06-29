import 'package:cura_for_doctor/Pages/CalenderSchedule/Calender/CalenderWidget.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/EventEditing.dart';
import 'package:cura_for_doctor/api/getDoctorSchedule.dart';
import 'package:cura_for_doctor/class/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Event/Event.dart';
import 'Event/EventProvider.dart';

class CalenderViewPage extends StatefulWidget {
  CalenderViewPage({super.key});

  @override
  State<CalenderViewPage> createState() => _CalenderViewPageState();
}

class _CalenderViewPageState extends State<CalenderViewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: getDoctorSchedule(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: Text("loading...")));
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return Scaffold(body: Center(child: Text("error occured")));
          }

          final eventList = Event.fromDoctorScheduleList(snapshot.data!);
          Provider.of<EventProvider>(context).setEvents(eventList);

          return Scaffold(
            body: CalenderWidget(
              doctorSchedule: snapshot.data!,
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppTheme.customGold,
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: ((context) => const EventEditing())),
                ),
              },
              child: const Icon(Icons.add, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
