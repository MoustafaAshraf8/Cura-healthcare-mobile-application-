import 'package:dio/dio.dart';
import '../class/Patient.dart';

Future<void> createPatient(
    {required Patient patient, required Function revertLoading}) async {
  try {
    revertLoading();
    final dio = Dio();
    dio.options.baseUrl = "http://10.0.2.2:8080/api/";
    dio.options.responseType = ResponseType.plain;
    final cancelToken = CancelToken();
    const url = "patient/signup";
    Response response = await dio.post(url, cancelToken: cancelToken, data: {
      "FirstName": patient.FirstName,
      "LastName": patient.LastName,
      "Email": patient.Email,
      "Password": patient.Password,
    });
    if (response.statusCode == 200) {
      revertLoading();
      return;
    } else {
      revertLoading();
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  } catch (e) {
    print(e);
    throw e;
  }
}
