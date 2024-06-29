// ignore_for_file: unused_import
import 'package:cura_for_doctor/Pages/AboutUs.dart';
import 'package:cura_for_doctor/Pages/AppointmentPage/ReservedTimeSlotPage.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/CalenderViewPage.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/Event/Event.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/Event/EventProvider.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/EventEditing.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/EventViewing.dart';
import 'package:cura_for_doctor/Pages/ForgetPassword/ForgetPassword.dart';
import 'package:cura_for_doctor/Pages/ForgetPassword/ResetPassword.dart';
import 'package:cura_for_doctor/Pages/ForgetPassword/VerificationCode.dart';
import 'package:cura_for_doctor/Pages/Login.dart';
import 'package:cura_for_doctor/Pages/MainLayout.dart';
import 'package:cura_for_doctor/Pages/Onboarding/onboarding.dart';
import 'package:cura_for_doctor/Pages/Profile/EditMyAccount.dart';
import 'package:cura_for_doctor/Pages/Profile/HelpCenterEmail.dart';
import 'package:cura_for_doctor/Pages/Profile/MyAccount.dart';
import 'package:cura_for_doctor/Pages/Profile/Notifictions.dart';
import 'package:cura_for_doctor/Pages/Profile/Policy.dart';
import 'package:cura_for_doctor/Pages/Profile/Profile.dart';
import 'package:cura_for_doctor/Pages/Profile/Settings.dart';
import 'package:cura_for_doctor/Pages/SignUpPage/SignUpPage.dart';
import 'package:cura_for_doctor/Pages/SignUpPage/UploadCertificate.dart';
import 'package:cura_for_doctor/class/AppRouter.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Pages/TestScheduleCreate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (context) => EventProvider(),
          child: MaterialApp(
            builder: DevicePreview.appBuilder,
            //Line El Theme da 3shan nl3'y ay t3del b3d el flutter upgrade
            theme: ThemeData(useMaterial3: false),
            debugShowCheckedModeBanner: false,
            //home: Home(),
            initialRoute: AppRouter.getLoginRoute(),
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
            //
            routes: {
              // AppRouter.getMainLayoutRouter(): (context) => MainLayout(),
              AppRouter.getOnBoardingRoute(): (context) => OnboardingPage(),
              AppRouter.getSignUpRoute(): (context) => SignUpPage(),
              AppRouter.getLoginRoute(): (context) => Login(),
              AppRouter.getForgetPasswordRoute(): (context) => ForgetPassword(),
              AppRouter.getVerificationCodeRoute(): (context) =>
                  VerificationCode(),
              AppRouter.getResetPasswordRoute(): (context) => ResetPassword(),
              AppRouter.getAboutUsRoute(): (context) => AboutUS(),

              // AppRouter.getProfileRoute(): (context) => Profile(),
              AppRouter.getCalenderViewRoute(): (context) => CalenderViewPage(),
              AppRouter.getEventEditingRoute(): (context) => EventEditing(),
              //AppRouter.getHomeRoute():(context)=>Home()
              //AppRouter.getEventViewingRoute(): (context) => EventViewing(event: Event),

              AppRouter.getMyAccountRoute(): (context) => MyAccount(),
              AppRouter.getEditMyAccountRoute(): (context) => EditMyAccount(),
              AppRouter.getNotificationsRoute(): (context) => Notifications(),
              AppRouter.getSettingsRoute(): (context) => Settings(),
              AppRouter.getHelpCenterEmailRoute(): (context) =>
                  HelpCenterEmail(),
              AppRouter.getPolicyAndAgreementsRoute(): (context) => policy(),
              // AppRouter.getUploadDataRoute(): (context) => UploadCertificate(),
            },
          ),
        );
      },
    );
  }
}
