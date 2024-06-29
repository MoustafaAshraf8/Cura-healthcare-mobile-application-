// import 'package:cura_for_doctor/model/DoctorSchedule.dart';
// import 'package:flutter/material.dart';

// class Schedule {
//   final String title;
//   final String description;
//   final DateTime from;
//   final DateTime to;
//   final Color backgroundColor;
//   final bool isAllDay;

//   const Schedule({
//     required this.title,
//     required this.description,
//     required this.from,
//     required this.to,
//     this.backgroundColor = Colors.red,
//     this.isAllDay = false,
//   });

//   // factory Schedule.fromJson(DoctorSchedule doctorSchedule) {
//   //   try {
//   //     return Schedule(title: "schedule", description: "description", from: doctorSchedule., to: to)
//   //   } catch (e) {
//   //     print(e);
//   //     throw const FormatException('Failed to load doctorProfile.');
//   //   }
//   // }
// }

import 'dart:ui';

class Meeting {
  Meeting(
      {required this.from,
      required this.to,
      this.id,
      this.recurrenceId,
      this.eventName = '',
      this.isAllDay = true,
      this.background,
      this.exceptionDates,
      this.recurrenceRule});

  DateTime from;
  DateTime to;
  bool isAllDay;
  Object? id;
  Object? recurrenceId;
  String eventName;
  Color? background;
  String? fromZone;
  String? toZone;
  String? recurrenceRule;
  List<DateTime>? exceptionDates;
}
