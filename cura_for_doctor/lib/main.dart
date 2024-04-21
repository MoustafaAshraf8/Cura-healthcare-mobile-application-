// ignore_for_file: unused_import

import 'package:cura_for_doctor/Pages/AboutUs.dart';
import 'package:cura_for_doctor/Pages/ForgetPassword/ForgetPassword.dart';
import 'package:cura_for_doctor/Pages/ForgetPassword/ResetPassword.dart';
import 'package:cura_for_doctor/Pages/ForgetPassword/VerificationCode.dart';
import 'package:cura_for_doctor/Pages/Login.dart';
import 'package:cura_for_doctor/Pages/MainLayout.dart';
import 'package:cura_for_doctor/Pages/Onboarding/onboarding.dart';
import 'package:cura_for_doctor/Pages/SignUp.dart';
import 'package:cura_for_doctor/class/AppRouter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Line El Theme da 3shan nl3'y ay t3del b3d el flutter upgrade
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      //home: Home(),
      initialRoute: AppRouter.getOnBoardingRoute(),
      // routes: {
      //   "/Onboarding": (context) => OnboardingPage(),
      //   "/SignUp": (context) => SignUp(),
      //   "/Login": (context) => Login(),
      //   "/Home": (context) => Home(),
      //   "/Speciality": (context) => Speciality(),
      //   "/Profile": (context) => Profile(),
      //   "/DoctorProfile": (context) => DoctorProfile(),
      //   "/DoctorsList": (context) => DoctorsList(),
      //   "/Schedule": (context) => Schedule(),
      // },
      routes: {
        AppRouter.getMainLayoutRouter(): (context) => MainLayout(),
        AppRouter.getOnBoardingRoute(): (context) => OnboardingPage(),
        AppRouter.getSignUpRoute(): (context) => SignUp(),
        AppRouter.getLoginRoute(): (context) => Login(),
        AppRouter.getForgetPasswordRoute(): (context) => ForgetPassword(),
        AppRouter.getVerificationCodeRoute(): (context) => VerificationCode(),
        AppRouter.getResetPasswordRoute(): (context) => ResetPassword(),
        AppRouter.getAboutUsRoute(): (context) => AboutUS(),
      },
    );
  }
}
