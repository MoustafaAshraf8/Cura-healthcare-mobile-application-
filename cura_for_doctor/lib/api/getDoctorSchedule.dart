import 'dart:convert';

import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:cura_for_doctor/model/DoctorSchedule.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<DoctorSchedule>> getDoctorSchedule() async {
  final dio = Dio();
  dio.options.baseUrl = "http://10.0.2.2:8080/api/";
  const url = "doctor/schedule";
  dio.options.responseType = ResponseType.plain;
  final cancelToken = CancelToken();

  try {
    final prefs = await SharedPreferences.getInstance();
    var patientDataString = await prefs.getString('doctor');
    var decoded = json.decode((patientDataString as String));
    Doctor doctor = Doctor.fromJson(decoded);

    Response response = await dio.get(url,
        cancelToken: cancelToken,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${doctor.accessToken}",
        }));

    if (response.statusCode == 200) {
      var decoded = json.decode(response.data.toString());
      List<DoctorSchedule> scheduleList = (decoded as List)
          .map((element) => DoctorSchedule.fromJson(element))
          .toList();
      print("000000000000");
      print(scheduleList.elementAt(0));
      print("000000000000");
      await Future.delayed(Duration(seconds: 3));

      return scheduleList;
    } else {
      throw Exception('Failed to sign up.');
    }
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}
