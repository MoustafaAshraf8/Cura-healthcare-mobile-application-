import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:graduation_project/model/Allergy.dart';
import 'package:graduation_project/model/CustomFile.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/Patient.dart';

Future<bool> postNewAllergy({
  required Allergy allergy,
  required List<CustomFile> customFileList,
}) async {
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
    print("55555555555");
    // List<dynamic> obj = [];

    Response response = await dio.post(url,
        cancelToken: cancelToken,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${patient.accessToken}",
          },
        ),
        data: {
          "data": {
            "allergen": allergy.allergen,
            "reaction": allergy.reaction,
            "severity": allergy.severity,
            "diagnosisDate":
                DateFormat('yyyy-MM-dd').format(allergy.diagnosisDate),
            "notes": allergy.notes,
          },
          "files": customFileList.map((file) => file.toJson()).toList()
        });
    if (response.statusCode == 200) {
      await Future.delayed(Duration(seconds: 5));
      return true;
    } else {
      throw Exception('Failed to add new allergy.');
    }
  } catch (e) {
    print(e);
    return false;
  }
}
