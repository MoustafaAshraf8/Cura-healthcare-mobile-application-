import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:graduation_project/model/Patient.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> deleteReservedTimeSlot({required timeslot_id}) async {
  await Future.delayed(Duration(seconds: 1));
  try {
    final prefs = await SharedPreferences.getInstance();
    var patientDataString = await prefs.getString('patient');
    var decoded = json.decode((patientDataString as String));
    var patient = Patient.fromJson(decoded);

    final dio = Dio();
    dio.options.baseUrl = "http://10.0.2.2:8080/api/";
    final url = "patient/timeslot/${timeslot_id}";
    dio.options.responseType = ResponseType.plain;
    final cancelToken = CancelToken();
    Response response = await dio.delete(
      url,
      cancelToken: cancelToken,
      options: Options(headers: {
        "Authorization": "Bearer ${patient.accessToken}",
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete reserverTimeSlot.');
    }
  } catch (e) {
    print(e);
    return false;
  }
}
