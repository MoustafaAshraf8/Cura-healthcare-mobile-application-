import 'package:graduation_project/model/Clinic.dart';
import 'package:graduation_project/model/Doctor.dart';
import 'package:graduation_project/model/Speciality.dart';

class DoctorProfile {
  final Doctor doctor;
  final Clinic clinic;
  final Speciality speciality;
  DoctorProfile(
      {required this.doctor, required this.clinic, required this.speciality});

  factory DoctorProfile.fromJson(Map<String, dynamic> json) {
    try {
      return DoctorProfile(
        doctor: Doctor.fromJson(json),
        speciality: Speciality.fromJson(json["speciality"]),
        clinic: Clinic.fromJson(json["clinic"]),
      );
    } catch (e) {
      print(e);
      throw const FormatException('Failed to load doctorProfile.');
    }
  }
}
