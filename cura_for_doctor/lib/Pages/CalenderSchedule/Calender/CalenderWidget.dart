import 'package:cura_for_doctor/Pages/CalenderSchedule/AppointmentsWidget.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/Event/EventDataSource.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/Event/EventProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;

    return SfCalendar(
      view: CalendarView.month,
      dataSource: EventDataSource(events),
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      backgroundColor: Colors.white,
      onLongPress: (details) {
        final provider = Provider.of<EventProvider>(context, listen: false);

        provider.setDate(details.date!);
        showModalBottomSheet(
          context: context,
          builder: (context) => const AppointmentsWidget(),
        );
      },
    );
  }
}
