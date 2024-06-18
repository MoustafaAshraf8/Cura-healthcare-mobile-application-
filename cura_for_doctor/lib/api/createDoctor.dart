import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:dio/dio.dart';

Future<bool> createDoctor(
    {required Doctor doctor, required Function revertLoading}) async {
  try {
    print(doctor.toJson());
    revertLoading();
    final dio = Dio();
    dio.options.baseUrl = "http://10.0.2.2:8080/api/";
    const url = "doctor/signup";
    dio.options.responseType = ResponseType.plain;
    final cancelToken = CancelToken();
    Response response = await dio.post(
      url,
      cancelToken: cancelToken,
      data: doctor.toJson(),
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
