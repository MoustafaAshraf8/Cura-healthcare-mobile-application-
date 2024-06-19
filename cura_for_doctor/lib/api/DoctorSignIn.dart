//import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:dio/dio.dart';
import '../model/User.dart';

Future<bool> signIn(
    {required User user, required Function revertLoading}) async {
  final dio = Dio();
  dio.options.method = "POST";
  dio.options.baseUrl = "http://10.0.2.2:8080/api/";
  dio.options.responseType = ResponseType.plain;
  final cancelToken = CancelToken();
  const url = "doctor/login";
  try {
    revertLoading();

    // Response response =
    //     await dio.post(url, cancelToken: cancelToken, data: user.toJson());
    Response response = await dio.request(url, data: user.toJson());

    if (response.statusCode == 200) {
      revertLoading();
      print(response);
      return true;
    } else {
      revertLoading();
      // If the server did not return a 200 OK! response,
      // then throw an exception.
      throw Exception('Failed to sign in');
    }
  } catch (e) {
    print(e);
    cancelToken.cancel();
    throw e;
  }
}
