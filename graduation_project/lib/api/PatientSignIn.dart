import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:graduation_project/model/Patient.dart';
import 'package:graduation_project/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> signIn(
    {required User user, required Function revertLoading}) async {
  final dio = Dio();
  dio.options.method = "POST";
  dio.options.baseUrl = "http://10.0.2.2:8080/api/";
  dio.options.responseType = ResponseType.plain;
  final cancelToken = CancelToken();
  const url = "patient/signin";
  try {
    revertLoading();

    // Response response =
    //     await dio.post(url, cancelToken: cancelToken, data: user.toJson());
    Response response = await dio.request(url, data: user.toJson());
    if (response.statusCode == 200) {
      revertLoading();
      var decoded = json.decode(response.data.toString());
      var patient = Patient.fromJson(decoded);
      print(patient.toJson());
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("patient", response.data.toString());
      return true;
    } else {
      revertLoading();
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to sign in');
    }
  } catch (e) {
    revertLoading();
    print(e);
    cancelToken.cancel();
    return false;
  }
}
