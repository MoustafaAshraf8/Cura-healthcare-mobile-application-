import 'package:cura/model/AppTheme.dart';
import 'package:cura/page/SignUpPage/SignUpPage.dart';
import 'package:flutter/material.dart';
import 'page/LogInPage/LogInPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppTheme.text_color_light_primary),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/signuppage',
      routes: {
        '/loginpage': (context) => const LogInPage(),
        '/signuppage': (context) => const SignUpPage(),
      },
    );
  }
}
