import 'dart:convert';
import 'package:cura_for_doctor/model/ChronicIllness.dart';
import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:cura_for_doctor/model/Patient.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<ChronicIllness>> getEMRChronicIllness(
    {required int patient_id}) async {
  await Future.delayed(Duration(seconds: 1));
  try {
    final prefs = await SharedPreferences.getInstance();
    var doctorDataString = await prefs.getString('doctor');
    var decoded = json.decode((doctorDataString as String));
    var doctor = Doctor.fromJson(decoded);

    final dio = Dio();
    dio.options.baseUrl = "http://10.0.2.2:8080/api/";
    final url = "doctor/emr/chronicIllness/${patient_id}";
    dio.options.responseType = ResponseType.plain;
    final cancelToken = CancelToken();
    Response response = await dio.get(url,
        cancelToken: cancelToken,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${doctor.accessToken}",
        }));
    if (response.statusCode == 200) {
      var decoded = json.decode(response.data.toString());
      return decoded
          .map<ChronicIllness>(
              (chronicIllness) => new ChronicIllness.fromJson(chronicIllness))
          .toList();
    } else {
      throw Exception('Failed to load chronicIllness.');
    }
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}
