import 'package:cura_for_doctor/Pages/CalenderSchedule/Event/EventDataSource.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/Event/EventProvider.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/EventViewing.dart';
import 'package:cura_for_doctor/class/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentsWidget extends StatefulWidget {
  const AppointmentsWidget({super.key});

  @override
  State<AppointmentsWidget> createState() => _AppointmentsWidgetState();
}

class _AppointmentsWidgetState extends State<AppointmentsWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;

    if (selectedEvents.isEmpty) {
      return Center(
        child: Text("No Events Found!",
            style: TextStyle(color: Colors.black, fontSize: 22.sp)),
      );
    }

    return SfCalendar(
      view: CalendarView.timelineDay,
      dataSource: EventDataSource(provider.events),
      initialDisplayDate: provider.SelectedDate,
      appointmentBuilder: appointmentBuilder,
      todayHighlightColor: Colors.black,
      selectionDecoration: BoxDecoration(
        color: Colors.red.withOpacity(0.3),
      ),
      onTap: (details) {
        // if (details.appointments == null) return;

        // final event = details.appointments!.first;

        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: ((context) => EventViewing(event: event,))));
      },
    );
  }

  Widget appointmentBuilder(
    BuildContext context,
    CalendarAppointmentDetails details,
  ) {
    final event = details.appointments.first;

    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          event.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
