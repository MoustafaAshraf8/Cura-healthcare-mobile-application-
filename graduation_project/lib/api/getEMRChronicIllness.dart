import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:graduation_project/model/ChronicIllness.dart';
import 'package:graduation_project/model/Patient.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<ChronicIllness>> getEMRChronicIllness() async {
  await Future.delayed(Duration(seconds: 1));
  try {
    final prefs = await SharedPreferences.getInstance();
    var patientDataString = await prefs.getString('patient');
    var decoded = json.decode((patientDataString as String));
    var patient = Patient.fromJson(decoded);

    final dio = Dio();
    dio.options.baseUrl = "http://10.0.2.2:8080/api/";
    const url = "patient/emr/chronicIllness";
    dio.options.responseType = ResponseType.plain;
    final cancelToken = CancelToken();
    Response response = await dio.get(url,
        cancelToken: cancelToken,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${patient.accessToken}",
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
