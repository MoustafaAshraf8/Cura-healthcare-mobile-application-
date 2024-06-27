import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:graduation_project/model/DoctorProfile.dart';

Future<bool> getDoctorProfile(
    {required int doctor_id,
    required Function setDoctorProfile,
    required Function revertLoading}) async {
  final dio = Dio();
  dio.options.method = "GET";
  dio.options.baseUrl = "http://10.0.2.2:8080/api/";
  dio.options.responseType = ResponseType.plain;
  final cancelToken = CancelToken();
  var url = "doctor/profile/${doctor_id}";
  try {
    revertLoading();
    Response response = await dio.request(url);
    if (response.statusCode == 200) {
      var decoded = json.decode(response.data.toString());

      DoctorProfile doctorProfile = DoctorProfile.fromJson(decoded);
      setDoctorProfile(doctorProfile: doctorProfile);
      revertLoading();
      return true;
    } else {
      cancelToken.cancel();
      // revertLoading();
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to sign in');
    }
  } catch (e) {
    print(e);
    cancelToken.cancel();
    // throw e;
    return false;
  }
}
