// import 'dart:ui';

// import 'package:cura_for_doctor/model/DoctorSchedule.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import './Schedule.dart';

// class ScheduleDataSource extends CalendarDataSource {
//   ScheduleDataSource(List<DoctorSchedule> doctorScheduleList) {
//     // final schedules = Sched
//     this.appointments = doctorScheduleList;
//   }

//   Schedule getSchedule(int index) => appointments![index] as Schedule;

//   @override
//   DateTime getStartTime(int index) {
//     return appointments![index].from;
//   }

//   @override
//   DateTime getEndTime(int index) {
//     return appointments![index].to;
//   }

//   @override
//   Color getColor(int index) {
//     return appointments![index].backgroundColor;
//   }

//   @override
//   String getSubject(int index) {
//     return appointments![index].title;
//   }

//   @override
//   bool isAllDay(int index) {
//     return appointments![index].isAllDay;
//   }
// }
