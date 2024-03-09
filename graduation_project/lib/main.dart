// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/Home.dart';
import 'package:graduation_project/Pages/Login.dart';
import 'package:graduation_project/Pages/SignUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
