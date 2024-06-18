import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/Patient.dart';

Future<bool> createPatient(
    {required Patient patient, required Function revertLoading}) async {
  try {
    print(patient.toJson());
    revertLoading();
    final dio = Dio();
    dio.options.baseUrl = "http://10.0.2.2:8080/api/";
    const url = "patient/signup";
    dio.options.responseType = ResponseType.plain;
    final cancelToken = CancelToken();
    Response response = await dio.post(
      url,
      cancelToken: cancelToken,
      data: patient.signUpObject(),
    );
    if (response.statusCode == 200) {
      var decoded = json.decode(response.data.toString());
      var newPatient = Patient.fromJson(decoded);
      print("#######################");
      print(newPatient.toJson());
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("patient", json.encode(patient.toJson()));
      revertLoading();
      return true;
    } else {
      revertLoading();
      throw Exception('Failed to sign up.');
    }
  } catch (e) {
    print(e);
    throw e;
  }
}
