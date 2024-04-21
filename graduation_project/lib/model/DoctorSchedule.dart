import 'package:graduation_project/model/TimeSlot.dart';

class DoctorSchedule {
  final int schedule_id;
  final String Day;
  final List<TimeSlot> timeSlot;

  const DoctorSchedule(
      {required this.schedule_id, required this.Day, required this.timeSlot});

  factory DoctorSchedule.fromJson(Map<String, dynamic> json) {
    // print(json['Day']);
    // return switch (json) {
    //   {
    //     "schedule_id": int schedule_id,
    //     "Day": String Day,
    //     "timeSlot": TimeSlot timeSlot
    //   } =>
    //     DoctorSchedule(
    //       schedule_id: schedule_id,
    //       Day: Day,
    //       t
    //     ),
    //   _ => throw const FormatException('Failed to load Doctor.'),
    // };
    try {
      return DoctorSchedule(
          schedule_id: json['schedule_id'],
          Day: json['Day'],
          // timeSlot: TimeSlot.fromJson(json['timeslot'])
          timeSlot: json['timeslot'].map((e) => TimeSlot.fromJson(e)));
    } catch (e) {
      throw const FormatException('Failed to load Schedule.');
    }
  }

  // Map<String, dynamic> toJson() {
  //   var obj = {
  //     "schedule_id": schedule_id,
  //     "Day": Day,
  //     "timeslot": TimeSlot.toJson(timeSlot)
  //   };
  //   return obj;
  // }
}
