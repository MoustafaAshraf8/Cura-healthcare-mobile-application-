class Doctor {
  final int? doctor_id;
  final String? FirstName;
  final String? LastName;
  final String? Gender;
  final String? Email;
  final int? Rating;
  final String? Experience;
  final String? PhoneNumber;
  final String? Password;
  final int? speciality_id;

  const Doctor(
      {this.Experience,
      this.doctor_id,
      this.FirstName,
      this.LastName,
      this.PhoneNumber,
      this.Password,
      this.Gender,
      this.Rating,
      this.speciality_id,
      this.Email});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    print(json['FirstName']);
    return switch (json) {
      {
        "doctor_id": int doctor_id,
        "FirstName": String FirstName,
        "LastName": String LastName,
        "Gender": String Gender,
        "Email": String Email,
        "Password": String Password,
        "PhoneNumber": String PhoneNumber,
        "Rating": int Rating,
        "Experience": String Experience,
        "speciality_id": int speciality_id
      } =>
        Doctor(
            doctor_id: doctor_id,
            FirstName: FirstName,
            LastName: LastName,
            Gender: Gender,
            Email: Email,
            PhoneNumber: PhoneNumber,
            Password: Password,
            Rating: Rating,
            Experience: Experience,
            speciality_id: speciality_id),
      _ => throw const FormatException('Failed to load Doctor.'),
    };
  }

  Map<String, dynamic> toJson() {
    var obj = {
      "FirstName": FirstName,
      "LastName": LastName,
      "Email": Email,
      "Password": Password,
      "speciality_id": 1
    };
    return obj;
  }
}
