class Patient {
  final String FirstName;
  final String LastName;
  final String Email;
  final String Password;
  final int PhoneNumber;

  const Patient({
    required this.FirstName,
    required this.LastName,
    required this.Email,
    required this.Password,
    required this.PhoneNumber,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "FirstName": String FirstName,
        "LastName": String LastName,
        "Email": String Email,
        "Password": String Password,
        "PhoneNumber": int PhoneNumber,
      } =>
        Patient(
          FirstName: FirstName,
          LastName: LastName,
          Email: Email,
          Password: Password,
          PhoneNumber: PhoneNumber,
        ),
      _ => throw const FormatException('Failed to load Patient.'),
    };
  }

  Map<String, dynamic> toJson() {
    var obj = {
      "FirstName": FirstName,
      "LastName": LastName,
      "Email": Email,
      "Password": Password,
      "PhoneNumber": PhoneNumber
    };
    return obj;
  }
}
