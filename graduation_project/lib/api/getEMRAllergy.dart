import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:graduation_project/model/Allergy.dart';
import 'package:graduation_project/model/Patient.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Allergy>> getEMRAllergy() async {
  // print("%%%%%%%%%%%%%%%%%%%%%%%%%%");
  await Future.delayed(Duration(seconds: 1));
  // print("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
  // return [
  //   new Allergy(
  //       id: "66712e2b308d1d3e5cbfcbdc",
  //       allergen: "Hazelnutsx1",
  //       reaction: "Anaphylaxis",
  //       severity: "Severe",
  //       diagnosisDate: DateTime.parse("2015-06-01T00:00:00.000Z"),
  //       files: [])
  // ];

  try {
    final prefs = await SharedPreferences.getInstance();
    var patientDataString = await prefs.getString('patient');
    var decoded = json.decode((patientDataString as String));
    var patient = Patient.fromJson(decoded);

    final dio = Dio();
    dio.options.baseUrl = "http://10.0.2.2:8080/api/";
    const url = "patient/emr/allergy";
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
          .map<Allergy>((allergy) => new Allergy.fromJson(allergy))
          .toList();
    } else {
      throw Exception('Failed to load allergy.');
    }
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}
