import 'dart:convert';

import 'package:dio/dio.dart';

Future<bool> getImageFunction(
    {required Function revertLoading, required Function setImage}) async {
  try {
    revertLoading();
    final dio = Dio();
    dio.options.responseType = ResponseType.plain;

    final cancelToken = CancelToken();
    const url = "http://10.0.2.2:80/image/6618fb7db4dfa8686e3fe4d7";
    Response response = await dio.get(
      url,
      cancelToken: cancelToken,
    );

    // Map parsed = json.decode(response);
    var decoded = json.decode(response.data.toString());
    print(decoded['img']);
    if (response.statusCode == 200) {
      setImage(decoded['img']);
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
