import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:graduation_project/model/DoctorSchedule.dart';
import 'package:graduation_project/model/TimeSlot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/Patient.dart';

Future<bool> reserveTimeSlot(
    {required List<DoctorSchedule> doctorSchedule,
    required int activeDay,
    required int activeTimeSlot,
    required Function revertReserving}) async {
  try {
    revertReserving();
    final dio = Dio();
    dio.options.baseUrl = "http://10.0.2.2:8080/api/";
    const url = "patient/reserveTimeSlot";
    dio.options.responseType = ResponseType.plain;

    final cancelToken = CancelToken();

    final prefs = await SharedPreferences.getInstance();
    var patientDataString = await prefs.getString('patient');
    var decoded = json.decode((patientDataString as String));
    var patient = Patient.fromJson(decoded);

    Response response = await dio.post(url,
        cancelToken: cancelToken,
        data: {
          "timeslot_id":
              doctorSchedule[activeDay].timeSlot[activeTimeSlot].timeslot_id
        },
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${patient.accessToken}",
        }));
    if (response.statusCode == 200) {
      var decoded = json.decode(response.data.toString());
      var updatedTimeSlot = TimeSlot.fromJson(decoded);
      print("#######################");
      print(updatedTimeSlot);
      revertReserving();
      return true;
    } else {
      revertReserving();
      throw Exception('Failed to reserver time slot.');
    }
  } catch (e) {
    print(e);
    throw e;
  }
}
