class Patient {
  final String FirstName;
  final String LastName;
  final String Email;
  final String Password;
  final int PatientPhoneNumber;

  const Patient({
    required this.FirstName,
    required this.LastName,
    required this.Email,
    required this.Password,
    required this.PatientPhoneNumber,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "FirstName": String FirstName,
        "LastName": String LastName,
        "Email": String Email,
        "Password": String Password,
        "PatientPhoneNumber": int PatientPhoneNumber,
      } =>
        Patient(
          FirstName: FirstName,
          LastName: LastName,
          Email: Email,
          Password: Password,
          PatientPhoneNumber: PatientPhoneNumber,
        ),
      _ => throw const FormatException('Failed to load Patient.'),
    };
  }
}
