import 'dart:convert';

import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:dio/dio.dart';

Future<bool> getDoctorBySpeciality(
    {required String speciality,
    required Function addToDoctorList,
    required Function revertLoading}) async {
  final dio = Dio();
  dio.options.method = "GET";
  dio.options.baseUrl = "http://10.0.2.2:8080/api/";
  dio.options.responseType = ResponseType.plain;
  final cancelToken = CancelToken();
  const url = "doctor";
  dio.options.queryParameters = {"speciality": speciality};
  try {
    revertLoading();

    // Response response =
    //     await dio.post(url, cancelToken: cancelToken, data: user.toJson());
    Response response = await dio.request(url);
    if (response.statusCode == 200) {
      var decoded = json.decode(response.data.toString());
      for (int i = 0; i < decoded.length; i++) {
        addToDoctorList(Doctor.fromJson(decoded[i]));
      }

      revertLoading();
      return true;
    } else {
      revertLoading();
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load doctor list for this speciality');
    }
  } catch (e) {
    print(e);
    cancelToken.cancel();
    throw e;
  }
}
