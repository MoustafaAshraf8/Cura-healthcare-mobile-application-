//import 'package:cura_for_doctor/model/Doctor.dart';
import 'dart:convert';

import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/User.dart';

Future<bool> DoctorSignIn(
    {required User user, required Function revertLoading}) async {
  final dio = Dio();
  dio.options.method = "POST";
  dio.options.baseUrl = "http://10.0.2.2:8080/api/";
  dio.options.responseType = ResponseType.plain;
  final cancelToken = CancelToken();
  const url = "doctor/login";
  try {
    revertLoading();
    print(user.toJson());
    Response response = await dio.request(url, data: user.toJson());

    if (response.statusCode == 200) {
      print(response);
      final decoded = json.decode(response.data.toString());
      final Doctor doctor = Doctor.fromJson(decoded);
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("doctor", response.data.toString());
      await Future.delayed(Duration(seconds: 2));
      return true;
    } else {
      throw Exception('Failed to sign in');
    }
  } catch (e) {
    print(e);
    cancelToken.cancel();
    return false;
  }
}
