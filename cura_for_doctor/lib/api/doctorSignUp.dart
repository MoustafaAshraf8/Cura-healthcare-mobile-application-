import 'dart:convert';

import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Doctor> doctorSignUp(
    {required Doctor doctor, required Function revertLoading}) async {
  revertLoading();
  await Future.delayed(Duration(seconds: 5));
  final dio = Dio();
  dio.options.baseUrl = "http://10.0.2.2:8080/api/";
  const url = "doctor/signup";
  dio.options.responseType = ResponseType.plain;
  final cancelToken = CancelToken();
  try {
    Response response = await dio.post(
      url,
      cancelToken: cancelToken,
      data: doctor.toJson(),
    );
    if (response.statusCode == 200) {
      var decoded = json.decode(response.data.toString());
      var newDoctor = Doctor.fromJson(decoded);
      print("#######################");
      print(newDoctor.toJson());
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("doctor", json.encode(newDoctor.toJson()));
      revertLoading();
      return newDoctor;
    } else {
      revertLoading();
      throw Exception('Failed to sign up.');
    }
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}
