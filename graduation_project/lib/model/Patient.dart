class Patient {
  final int? patient_id;
  final String FirstName;
  final String LastName;
  final String Email;
  final String? Password;
  final int? PhoneNumber;
  final String? accessToken;
  final String Gender;
  final String DOB;

  Patient(
      {this.patient_id,
      required this.FirstName,
      required this.LastName,
      required this.Email,
      required this.Password,
      required this.PhoneNumber,
      required this.accessToken,
      this.Gender = "male",
      this.DOB = "2030-10-10"});

  factory Patient.fromJson(Map<String, dynamic> json) {
    // print(json);
    try {
      return Patient(
          patient_id:
              json.containsKey("patient_id") ? json["patient_id"] : null,
          FirstName: json["FirstName"],
          LastName: json["LastName"],
          Email: json["Email"],
          Password: json.containsKey("Password") ? json["Password"] : null,
          Gender: json["Gender"],
          DOB: "2030-10-10",
          PhoneNumber: json.containsKey("PhoneNumber")
              ? int.parse(json["PhoneNumber"])
              : null,
          accessToken:
              json.containsKey("accessToken") ? json["accessToken"] : null);
    } catch (err) {
      print(err);
      throw err;
    }
  }

  // method that display all properties
  Map<String, dynamic> toJson() {
    var obj = {
      "patient_id": patient_id,
      "FirstName": FirstName,
      "LastName": LastName,
      "Email": Email,
      "Password": Password,
      "Gender": Gender,
      "DOB": DOB,
      "PhoneNumber": PhoneNumber,
      "accessToken": accessToken
    };
    return obj;
  }

  // methods to return properties required for signup, means without null values (ex: accessToken)
  Map<String, dynamic> signUpObject() {
    var obj = {
      "FirstName": FirstName,
      "LastName": LastName,
      "Email": Email,
      "Password": Password,
      "Gender": Gender,
      "DOB": DOB,
    };
    return obj;
  }
}
