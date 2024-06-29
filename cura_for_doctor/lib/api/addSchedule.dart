//import 'package:cura_for_doctor/model/Doctor.dart';
import 'dart:convert';

import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/User.dart';

Future<bool> addSchedule(
    {required String Date,
    required String Start,
    required String End,
    required Function revertLoading}) async {
  final dio = Dio();
  dio.options.baseUrl = "http://10.0.2.2:8080/api/";
  const url = "doctor/schedule";
  dio.options.responseType = ResponseType.plain;
  final cancelToken = CancelToken();
  final obj = {
    "Day": "Saturday",
    "Date": Date,
    "timeslot": [
      {"Start": Start, "End": End}
    ]
  };
  try {
    revertLoading();
    final prefs = await SharedPreferences.getInstance();
    var patientDataString = await prefs.getString('doctor');
    var decoded = json.decode((patientDataString as String));
    Doctor doctor = Doctor.fromJson(decoded);
    Response response = await dio.post(url,
        cancelToken: cancelToken,
        data: obj,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${doctor.accessToken}",
        }));

    if (response.statusCode == 200) {
      print(response);

      await Future.delayed(Duration(seconds: 2));
      return true;
    } else {
      throw Exception('Failed to add schedule in');
    }
  } catch (e) {
    print(e);
    cancelToken.cancel();
    await Future.delayed(Duration(seconds: 2));
    return false;
  }
}
