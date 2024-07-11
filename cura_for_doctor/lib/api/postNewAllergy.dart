import 'dart:convert';

import 'package:cura_for_doctor/model/Allergy.dart';
import 'package:cura_for_doctor/model/CustomFile.dart';
import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> postNewAllergy({
  required int patient_id,
  required Allergy allergy,
  required List<CustomFile> customFileList,
}) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    var doctorDataString = await prefs.getString('doctor');
    var decoded = json.decode((doctorDataString as String));
    var doctor = Doctor.fromJson(decoded);

    final dio = Dio();
    dio.options.baseUrl = "http://10.0.2.2:8080/api/";
    final url = "doctor/emr/allergy/${patient_id}";
    dio.options.responseType = ResponseType.plain;
    final cancelToken = CancelToken();
    print("55555555555");
    // List<dynamic> obj = [];

    Response response = await dio.post(url,
        cancelToken: cancelToken,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${doctor.accessToken}",
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
