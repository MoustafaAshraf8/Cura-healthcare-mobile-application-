import 'package:cura_for_doctor/model/Clinic.dart';
import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:cura_for_doctor/model/Speciality.dart';

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
