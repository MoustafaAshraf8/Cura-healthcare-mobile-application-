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

  static String getDoctorProfileRoute() {
    return _doctorProfile;
  }

  static String getDoctorListRoute() {
    return _doctorList;
  }

  static String getScheduleList() {
    return _schedule;
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