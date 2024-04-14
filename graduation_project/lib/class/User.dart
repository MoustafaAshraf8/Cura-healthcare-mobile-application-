import 'dart:convert';

class User {
  final String Email;
  final String Password;

  const User({
    required this.Email,
    required this.Password,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "Email": String Email,
        "Password": String Password,
      } =>
        User(
          Email: Email,
          Password: Password,
        ),
      _ => throw const FormatException('Failed to load User.'),
    };
  }

  Map<String, dynamic> toJson() {
    var obj = {
      "Email": Email,
      "Password": Password,
    };
    return obj;
  }
}
