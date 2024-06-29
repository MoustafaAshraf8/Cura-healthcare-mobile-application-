import 'package:cura_for_doctor/model/DoctorSchedule.dart';
import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;

  const Event({
    this.title = "",
    this.description = "",
    required this.from,
    required this.to,
    this.backgroundColor = Colors.red,
    this.isAllDay = false,
  });

  // List<Event> fromDoctorScheduleList(List<DoctorSchedule> doctorSchedule){
  //   return doctorSchedule.map((schedule)=>
  //      schedule.timeSlot.map((slot)=> return new Event(from: DateTime.parse("${schedule.Date} ${slot.Start}"), to: DateTime.parse("${schedule.Date} ${slot.End}")))
  //   ).toList();
  // }

  static List<Event> fromDoctorScheduleList(
      List<DoctorSchedule> doctorSchedule) {
    // Flatten the list of time slots to a list of events
    return doctorSchedule.expand((schedule) {
      return schedule.timeSlot.map((slot) {
        return Event(
            from: DateTime.parse("${schedule.Date} ${slot.Start}"),
            to: DateTime.parse("${schedule.Date} ${slot.End}"));
      });
    }).toList();
  }
}
