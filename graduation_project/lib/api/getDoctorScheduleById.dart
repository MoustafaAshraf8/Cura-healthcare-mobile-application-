import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:graduation_project/model/DoctorSchedule.dart';

Future<bool> getDoctorScheduleById(
    {required int doctor_id,
    required Function setDoctorScheduleList,
    required Function revertLoading}) async {
  final dio = Dio();
  dio.options.method = "GET";
  dio.options.baseUrl = "http://10.0.2.2:8080/api/";
  dio.options.responseType = ResponseType.plain;
  final cancelToken = CancelToken();
  var url = "doctor/schedule/${doctor_id}";
  try {
    revertLoading();
    Response response = await dio.request(url);
    if (response.statusCode == 200) {
      var decoded = json.decode(response.data.toString());

      var scheduleList = decoded as List;

      List<DoctorSchedule> doctorSchedule = scheduleList.map((schedule) {
        return DoctorSchedule.fromJson(schedule);
      }).toList();

      setDoctorScheduleList(newDoctorScheduleList: doctorSchedule);
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
