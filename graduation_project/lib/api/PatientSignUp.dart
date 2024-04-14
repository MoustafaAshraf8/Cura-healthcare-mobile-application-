import 'package:dio/dio.dart';
import '../model/Patient.dart';

Future<bool> createPatient(
    {required Patient patient, required Function revertLoading}) async {
  try {
    revertLoading();
    final dio = Dio();
    dio.options.baseUrl = "http://10.0.2.2:8080/api/";
    dio.options.responseType = ResponseType.plain;

    final cancelToken = CancelToken();
    const url = "patient/signup";
    Response response = await dio.post(
      url,
      cancelToken: cancelToken,
      data: patient.toJson(),
    );
    if (response.statusCode == 200) {
      revertLoading();
      return true;
    } else {
      revertLoading();
      throw Exception('Failed to sign up.');
    }
  } catch (e) {
    print(e);
    throw e;
  }
}
