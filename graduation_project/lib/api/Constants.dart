class API {
  static String _ServerBaseUrl = "http://10.0.2.2:8080/api/";
  static String _PatientBaseUrl = "patient/";
  static String _PatientSignUp = "signup";

  constructor() {}

  static String getServerBaseUrl() {
    return _ServerBaseUrl;
  }

  static String getPatientSignUpUrl() {
    return _PatientBaseUrl + _PatientSignUp;
  }
}
