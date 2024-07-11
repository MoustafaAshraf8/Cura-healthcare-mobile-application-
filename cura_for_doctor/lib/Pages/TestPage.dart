import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Future<dynamic> getRequest() async {
    await Future.delayed(Duration(seconds: 2));
    Dio dio = Dio();
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
    final cancelToken = CancelToken();
    dio.options.responseType = ResponseType.plain;
    final url = "https://10.0.2.2:80/";
    Response response = await dio.get(
      url,
      cancelToken: cancelToken,
    );

    final decoded = json.decode(response.data.toString());

    print("77777777777777777777777");
    print(decoded);
    print("77777777777777777777777");

    return decoded;
  }

  Future<dynamic> postRequest() async {
    print("5555555555555 pressed 555555555555");
    Dio dio = Dio();
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
    final cancelToken = CancelToken();
    dio.options.responseType = ResponseType.plain;
    final url = "https://10.0.2.2:80/";
    Response response = await dio.post(
      url,
      data: {"msg": "hello from ssl cura"},
      cancelToken: cancelToken,
    );

    final decoded = json.decode(response.data.toString());

    print("88888888888888888888888");
    print(decoded);
    print("88888888888888888888888");

    return decoded;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: FutureBuilder(
        future: getRequest(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("loading...");
          }

          if (snapshot.hasError || !snapshot.hasData) {
            print("!!!!!!!!!!!!!!!!!!!!!");
            print(snapshot.error);
            print("!!!!!!!!!!!!!!!!!!!!!");
            return Text("error occured!");
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    postRequest();
                  },
                  child: Text("press me")),
              Text(snapshot.data["msg"])

              // (newDateTime != null) ? newDateTime : Text("null")
            ],
          );
        },
      )),
    ));
  }
}
