import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/AboutUs.dart';
import 'package:graduation_project/Pages/ChatBot.dart';
import 'package:graduation_project/Pages/ForgetPassword/ForgetPassword.dart';
import 'package:graduation_project/Pages/ForgetPassword/ResetPassword.dart';
import 'package:graduation_project/Pages/ForgetPassword/VerificationCode.dart';
import 'package:graduation_project/Pages/MainLayout.dart';
import 'package:graduation_project/Pages/Profile/EditMyAccount.dart';
import 'package:graduation_project/Pages/Profile/HelpCenterEmail.dart';
import 'package:graduation_project/Pages/Profile/MyAccount.dart';
import 'package:graduation_project/Pages/Profile/Notifictions.dart';
import 'package:graduation_project/Pages/Profile/Policy.dart';
import 'package:graduation_project/Pages/Profile/Settings.dart';
import './class/AppRouter.dart';
import 'package:graduation_project/Pages/Login.dart';
import 'package:graduation_project/Pages/Onboarding/onboarding.dart';
import 'package:graduation_project/Pages/Profile/Profile.dart';
import 'package:graduation_project/Pages/SchedulePage/Schedule.dart';
import 'package:graduation_project/Pages/SignUp.dart';
import 'package:graduation_project/Pages/Speciality.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.getMainLayoutRouter(),
      //
      title: 'Localizations Sample App',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      routes: {
        AppRouter.getMainLayoutRouter(): (context) => MainLayout(),
        AppRouter.getOnBoardingRoute(): (context) => OnboardingPage(),
        AppRouter.getSignUpRoute(): (context) => SignUp(),
        AppRouter.getLoginRoute(): (context) => Login(),
        AppRouter.getSpecialityRoute(): (context) => Speciality(),
        AppRouter.getProfileRoute(): (context) => Profile(),
        AppRouter.getScheduleList(): (context) => Schedule(),
        AppRouter.getForgetPasswordRoute(): (context) => ForgetPassword(),
        AppRouter.getVerificationCodeRoute(): (context) => VerificationCode(),
        AppRouter.getResetPasswordRoute(): (context) => ResetPassword(),
        AppRouter.getAboutUsRoute(): (context) => AboutUS(),
        //
        AppRouter.getMyAccountRoute(): (context) => MyAccount(),
        AppRouter.getEditMyAccountRoute(): (context) => EditMyAccount(),
        AppRouter.getNotificationsRoute(): (context) => Notifications(),
        AppRouter.getSettingsRoute(): (context) => Settings(),
        AppRouter.getHelpCenterEmailRoute(): (context) => HelpCenterEmail(),
        AppRouter.getPolicyAndAgreementsRoute(): (context) => policy(),
        AppRouter.getChatBotRoute(): (context) => chatScreen(),
      },
    );
  }
}
