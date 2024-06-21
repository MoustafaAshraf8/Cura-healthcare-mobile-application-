import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_project/model/File.dart';
import 'package:graduation_project/model/Patient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../class/AppTheme.dart';

class CustomWebViewPage extends StatefulWidget {
  final File file;
  const CustomWebViewPage({required this.file, super.key});

  @override
  State<CustomWebViewPage> createState() => _CustomWebViewPageState();
}

class _CustomWebViewPageState extends State<CustomWebViewPage> {
  String randomImage =
      "https://images.unsplash.com/photo-1493612276216-ee3925520721?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  String randompdf =
      "https://www.ece.uvic.ca/~itraore/elec567-13/notes/dist-03-4.pdf";
  Future<WebViewController> getWebViewController() async {
    final prefs = await SharedPreferences.getInstance();
    var patientDataString = await prefs.getString('patient');
    var decoded = await json.decode((patientDataString as String));
    Patient patient = await Patient.fromJson(decoded);
    const localIp = "192.168.1.8";
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        headers: {
          // 'Content-Type': 'application/pdf',
          // 'Accept': 'application/pdf',
          'Authorization': 'Bearer ${patient.accessToken}',
        },
        // local
        // Uri.parse('http://192.168.1.8:8080/file/6670c3ffb8cadfe730104568'),

        // pdf
        // Uri.parse('https://docs.google.com/viewer?url=${randompdf}'),

        // image
        // Uri.parse('https://docs.google.com/viewer?url=${randomImage}'),
        Uri.parse(
            'https://docs.google.com/gview?embedded=true&url=${randompdf}'),
        // Uri.parse(
        //     'https://docs.google.com/gview?embedded=true&url=http://${localIp}:8080/api/patient/emr/allergy/file/${widget.file.id}'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Flutter WebView'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            tooltip: 'CustomWebView',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: AppTheme.customBlue,
        ),
        body: FutureBuilder(
            future: getWebViewController(),
            builder: (BuildContext context,
                AsyncSnapshot<WebViewController> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("loading...");
              } else if (snapshot.hasError || !snapshot.hasData) {
                return Text("error");
              }
              return WebViewWidget(controller: snapshot.data!);
            }));
  }
}
