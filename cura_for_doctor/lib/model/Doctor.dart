class Doctor {
  int? doctor_id;
  String? FirstName;
  String? LastName;
  String? Gender;
  String? Email;
  String? DOB;
  int? Rating;
  String? Experience;
  String? PhoneNumber;
  String? Password;
  int? speciality_id;
  String? accessToken;

  Doctor(
      {this.Experience,
      this.doctor_id,
      this.FirstName,
      this.LastName,
      this.PhoneNumber,
      this.Password,
      this.Gender,
      this.Rating,
      this.speciality_id,
      this.Email,
      this.DOB,
      this.accessToken});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    print("jjjjjjjjjjjjjjjjjj");
    print(json);
    print("jjjjjjjjjjjjjjjjjj");
    // return switch (json) {
    //   {
    //     "doctor_id": int doctor_id,
    //     "FirstName": String FirstName,
    //     "LastName": String LastName,
    //     "Gender": String Gender,
    //     "Email": String Email,
    //     "Password": String Password,
    //     "PhoneNumber": String PhoneNumber,
    //     "Rating": int Rating,
    //     "Experience": String Experience,
    //     "speciality_id": int speciality_id
    //   } =>
    //     Doctor(
    //         doctor_id: doctor_id,
    //         FirstName: FirstName,
    //         LastName: LastName,
    //         Gender: Gender,
    //         Email: Email,
    //         PhoneNumber: PhoneNumber,
    //         Password: Password,
    //         Rating: Rating,
    //         Experience: Experience,
    //         speciality_id: speciality_id),
    //   _ => throw const FormatException('Failed to load Doctor.'),
    // };

    try {
      return Doctor(
          doctor_id: json.containsKey("doctor_id") ? json["doctor_id"] : null,
          FirstName: json["FirstName"],
          LastName: json["LastName"],
          Email: json["Email"],
          Password: json.containsKey("Password") ? json["Password"] : null,
          Gender: json.containsKey("Gender") ? json["Gender"] : null,
          DOB: json.containsKey("DOB") ? json["DOB"] : null,
          PhoneNumber:
              json.containsKey("PhoneNumber") ? json["PhoneNumber"] : null,
          Rating: json.containsKey("Rating") ? json["Rating"] : null,
          Experience:
              json.containsKey("Experience") ? json["Experience"] : null,
          speciality_id:
              json.containsKey("speciality_id") ? json["speciality_id"] : null,
          accessToken:
              json.containsKey("accessToken") ? json["accessToken"] : null);
    } catch (err) {
      print(err);
      throw FormatException('Failed to load Doctor.');
    }

    /*
            
           

           
            
           
            int? speciality_id;
  String? accessToken;
    */
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

  Map<String, dynamic> signUpObject() {
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
