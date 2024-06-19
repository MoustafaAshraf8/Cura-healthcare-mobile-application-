class AppRouter {
  static String _home = "/Home";
  static String _signUp = "/SignUp";
  static String _logIn = "/Login";
  static String _onBoarding = "/Onboarding";
  static String _speciality = "/Speciality";
  static String _profile = "/Profile";
  static String _doctorProfile = "/DoctorProfile";
  static String _doctorList = "/DoctorsList";
  static String _schedule = "/Schedule";
  static String _forgetPassword = "/ForgetPassword";
  static String _verificationCode = "/VerificationCode";
  static String _resetPassword = "/ResetPassword";
  static String _mainLayout = "/MainLayout";
  static String _aboutus = "/AboutUs";

  static String _myAccount = "/MyAccount";
  static String _editmyAccount = "/EditMyAccount";
  static String _notifications = "/Notifications";
  static String _settings = "/Settings";
  static String _helpCenterEmail = "/HelpCenterEmail";
  static String _policyandagreements = "/Policy";

  constructor() {}

  static String getHomeRoute() {
    return _home;
  }

  static String getSignUpRoute() {
    return _signUp;
  }

  static String getLoginRoute() {
    return _logIn;
  }

  static String getOnBoardingRoute() {
    return _onBoarding;
  }

  static String getSpecialityRoute() {
    return _speciality;
  }

  static String getProfileRoute() {
    return _profile;
  }

  static String getDoctorProfilePageRoute() {
    return _doctorProfile;
  }

  static String getDoctorListRoute() {
    return _doctorList;
  }

  static String getScheduleList() {
    return _schedule;
  }

  static String getForgetPasswordRoute() {
    return _forgetPassword;
  }

  static String getVerificationCodeRoute() {
    return _verificationCode;
  }

  static String getResetPasswordRoute() {
    return _resetPassword;
  }

  static String getMainLayoutRouter() {
    return _mainLayout;
  }

  static String getAboutUsRoute() {
    return _aboutus;
  }

  static String getMyAccountRoute() {
    return _myAccount;
  }

  static String getEditMyAccountRoute() {
    return _editmyAccount;
  }

  static String getNotificationsRoute() {
    return _notifications;
  }

  static String getSettingsRoute() {
    return _settings;
  }

  static String getHelpCenterEmailRoute() {
    return _helpCenterEmail;
  }

  static String getPolicyAndAgreementsRoute() {
    return _policyandagreements;
  }
}

/*
  routes: {
        "/Onboarding": (context) => OnboardingPage(),
        "/SignUp": (context) => SignUp(),
        "/Login": (context) => Login(),
        "/Home": (context) => Home(),
        "/Speciality": (context) => Speciality(),
        "/Profile": (context) => Profile(),
        "/DoctorProfile": (context) => DoctorProfile(),
        "/DoctorsList": (context) => DoctorsList(),
        "/Schedule": (context) => Schedule(),
      },
*/
