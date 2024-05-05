import 'package:graduation_project/model/TimeSlot.dart';

class DoctorSchedule {
  final int schedule_id;
  final String Day;
  final String Date;
  final List<TimeSlot> timeSlot;

  const DoctorSchedule(
      {required this.schedule_id,
      required this.Day,
      required this.Date,
      required this.timeSlot});

  factory DoctorSchedule.fromJson(Map<String, dynamic> json) {
    try {
      var timeSlotList = json["timeslot"] as List;
      return DoctorSchedule(
          schedule_id: json['schedule_id'],
          Day: json['Day'],
          Date: json['Date'],
          timeSlot:
              timeSlotList.map((slot) => TimeSlot.fromJson(slot)).toList());
    } catch (e) {
      print(e);
      throw const FormatException('Failed to load Schedule.');
    }
  }

  @override
  String toString() {
    return "DoctorSchedule:{schedule_id: ${schedule_id}, Day: ${Day}, Date: ${Date}, timeslot: ${timeSlot.toString()}}";
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
