class Doctor {
  final int doctor_id;
  final String FirstName;
  final String LastName;
  final String Gender;
  final int Rating;
  final String Experience;

  const Doctor({
    required this.Experience,
    required this.doctor_id,
    required this.FirstName,
    required this.LastName,
    required this.Gender,
    required this.Rating,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    print(json['FirstName']);
    return switch (json) {
      {
        "doctor_id": int doctor_id,
        "FirstName": String FirstName,
        "LastName": String LastName,
        "Gender": String Gender,
        "Rating": int Rating,
        "Experience": String Experience
      } =>
        Doctor(
            doctor_id: doctor_id,
            FirstName: FirstName,
            LastName: LastName,
            Gender: Gender,
            Rating: Rating,
            Experience: Experience),
      _ => throw const FormatException('Failed to load Doctor.'),
    };
  }

  Map<String, dynamic> toJson() {
    var obj = {
      "doctor_id": doctor_id,
      "FirstName": FirstName,
      "LastName": LastName,
      "Gender": Gender,
      "Rating": Rating,
      "Experience": Experience
    };
    return obj;
  }
}
