class Speciality {
  final int speciality_id;
  final String Name;
  Speciality({required this.speciality_id, required this.Name});
  factory Speciality.fromJson(Map<String, dynamic> json) {
    print(json['FirstName']);
    return switch (json) {
      {
        "speciality_id": int speciality_id,
        "Name": String Name,
      } =>
        Speciality(
          speciality_id: speciality_id,
          Name: Name,
        ),
      _ => throw const FormatException('Failed to load Doctor.'),
    };
  }
}
