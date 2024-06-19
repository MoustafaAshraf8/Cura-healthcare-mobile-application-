import 'package:graduation_project/model/DoctorSchedule.dart';

class File {
  final String id;
  File({required this.id});
/*
  factory File.fromJson(Map<String, dynamic> json) {
    try {
      // var scheduleList = json["schedule"] as List;
      // List<DoctorSchedule> doctorSchedule = scheduleList.map((schedule) {
      //   return DoctorSchedule.fromJson(schedule);
      // }).toList();
      // print(doctorSchedule.toString());
      return File(
        id: json["id"],
      );
    } catch (e) {
      print(e);
      throw const FormatException('Failed to load clinic.');
    }
  }
  */
  factory File.fromJson(String id) {
    try {
      // var scheduleList = json["schedule"] as List;
      // List<DoctorSchedule> doctorSchedule = scheduleList.map((schedule) {
      //   return DoctorSchedule.fromJson(schedule);
      // }).toList();
      // print(doctorSchedule.toString());
      return File(
        id: id,
      );
    } catch (e) {
      print(e);
      throw const FormatException('Failed to load clinic.');
    }
  }
}
