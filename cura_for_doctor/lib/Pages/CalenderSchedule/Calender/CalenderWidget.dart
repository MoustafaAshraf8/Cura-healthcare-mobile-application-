import 'package:cura_for_doctor/Pages/CalenderSchedule/AppointmentsWidget.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/Event/EventDataSource.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/Event/EventProvider.dart';
import 'package:cura_for_doctor/model/DoctorSchedule.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../Event/Event.dart';

class CalenderWidget extends StatefulWidget {
  List<DoctorSchedule> doctorSchedule;
  CalenderWidget({required this.doctorSchedule, super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(builder: (context, provider, child) {
      final events = provider.events;
      return SfCalendar(
        view: CalendarView.month,
        dataSource: EventDataSource(events),
        initialSelectedDate: DateTime.now(),
        cellBorderColor: Colors.transparent,
        backgroundColor: Colors.white,
        onLongPress: (details) {
          provider.setDate(details.date!);
          showModalBottomSheet(
            context: context,
            builder: (context) =>
                AppointmentsWidget(selectedDate: details.date as DateTime),
          );
        },
      );
    });
  }
}
