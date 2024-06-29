import 'dart:convert';
import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> deleteReservedTimeSlot(
    {required timeslot_id, required revertLoading}) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    var patientDataString = await prefs.getString('doctor');
    var decoded = json.decode((patientDataString as String));
    var doctor = Doctor.fromJson(decoded);

    final dio = Dio();
    dio.options.baseUrl = "http://10.0.2.2:8080/api/";
    final url = "doctor/timeslot/${timeslot_id}";
    dio.options.responseType = ResponseType.plain;
    final cancelToken = CancelToken();
    Response response = await dio.delete(
      url,
      cancelToken: cancelToken,
      options: Options(headers: {
        "Authorization": "Bearer ${doctor.accessToken}",
      }),
    );
    if (response.statusCode == 200) {
      await Future.delayed(Duration(seconds: 3));
      return true;
    } else {
      throw Exception('Failed to delete reserverTimeSlot.');
    }
  } catch (e) {
    print(e);
    await Future.delayed(Duration(seconds: 3));
    return false;
  }
}
