class AppRouter {
  static String _home = "/Home";
  static String _signUp = "/SignUp";
  static String _chooseSpecialityPage = "/ChooseSpecialityPage";
  static String _logIn = "/Login";
  static String _onBoarding = "/Onboarding";
  static String _profile = "/Profile";
  static String _forgetPassword = "/ForgetPassword";
  static String _verificationCode = "/VerificationCode";
  static String _resetPassword = "/ResetPassword";
  static String _mainLayout = "/MainLayout";
  static String _aboutus = "/AboutUs";
  static String _appointments = "/Appointments";
  static String _calenderview = "/CalenderView";
  static String _eventEditing = "/EventEding";
  static String _eventViewing = "/EventViewing";

  static String _myAccount = "/MyAccount";
  static String _editmyAccount = "/EditMyAccount";
  static String _notifications = "/Notifications";
  static String _settings = "/Settings";
  static String _helpCenterEmail = "/HelpCenterEmail";
  static String _policyandagreements = "/Policy";
  static String _uploaddata = "/UploadData";

  constructor() {}

  static String getHomeRoute() {
    return _home;
  }

  static String getSignUpRoute() {
    return _signUp;
  }

  static String getChooseSpecialityPage() {
    return _chooseSpecialityPage;
  }

  static String getLoginRoute() {
    return _logIn;
  }

  static String getOnBoardingRoute() {
    return _onBoarding;
  }

  static String getProfileRoute() {
    return _profile;
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

  static String getAppointmentsRoute() {
    return _appointments;
  }

  static String getCalenderViewRoute() {
    return _calenderview;
  }

  static String getEventEditingRoute() {
    return _eventEditing;
  }

  static String getEventViewingRoute() {
    return _eventViewing;
  }

  static String getUploadDataRoute() {
    return _uploaddata;
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
