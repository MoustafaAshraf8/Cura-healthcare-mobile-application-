import 'package:cura_for_doctor/model/DoctorSchedule.dart';

class Clinic {
  final int clinic_id;
  final String Name;
  final String? City;
  final String? Longtitude;
  final String? Latitude;
  final String Fee;
  final int PatientCount;
  final List<DoctorSchedule> doctorSchedule;
  Clinic(
      {required this.clinic_id,
      required this.Name,
      required this.City,
      required this.Longtitude,
      required this.Latitude,
      required this.Fee,
      required this.PatientCount,
      required this.doctorSchedule});

  factory Clinic.fromJson(Map<String, dynamic> json) {
    try {
      var scheduleList = json["schedule"] as List;
      List<DoctorSchedule> doctorSchedule = scheduleList.map((schedule) {
        return DoctorSchedule.fromJson(schedule);
      }).toList();
      print(doctorSchedule.toString());
      return Clinic(
          clinic_id: json["clinic_id"],
          Name: json["Name"],
          City: json["City"],
          Longtitude: json["Longtitude"],
          Latitude: json["Latitude"],
          Fee: json["Fee"],
          PatientCount: json["PatientCount"],
          doctorSchedule: doctorSchedule);
    } catch (e) {
      print(e);
      throw const FormatException('Failed to load clinic.');
    }
  }
}
