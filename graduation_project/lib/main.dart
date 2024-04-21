// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/AboutUs.dart';
import 'package:graduation_project/Pages/ForgetPassword/ForgetPassword.dart';
import 'package:graduation_project/Pages/ForgetPassword/ResetPassword.dart';
import 'package:graduation_project/Pages/ForgetPassword/VerificationCode.dart';
import 'package:graduation_project/Pages/MainLayout.dart';
import './class/AppRouter.dart';
import 'package:graduation_project/Pages/DoctorProfile.dart';
import 'package:graduation_project/Pages/DoctorsList.dart';
import 'package:graduation_project/Pages/Home.dart';
import 'package:graduation_project/Pages/Login.dart';
import 'package:graduation_project/Pages/Onboarding/onboarding.dart';
import 'package:graduation_project/Pages/Profile.dart';
import 'package:graduation_project/Pages/Schedule.dart';
import 'package:graduation_project/Pages/SignUp.dart';
import 'package:graduation_project/Pages/Speciality.dart';

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
        AppRouter.getHomeRoute(): (context) => Home(),
        AppRouter.getSpecialityRoute(): (context) => Speciality(),
        AppRouter.getProfileRoute(): (context) => Profile(),
        // AppRouter.getDoctorProfileRoute(): (context) => DoctorProfile(),
        // AppRouter.getDoctorListRoute(): (context) =>
        //     DoctorsList(speciality: "default"),
        AppRouter.getScheduleList(): (context) => Schedule(),
        AppRouter.getForgetPasswordRoute(): (context) => ForgetPassword(),
        AppRouter.getVerificationCodeRoute(): (context) => VerificationCode(),
        AppRouter.getResetPasswordRoute(): (context) => ResetPassword(),
        AppRouter.getAboutUsRoute(): (context) => AboutUS(),
      },
    );
  }
}
