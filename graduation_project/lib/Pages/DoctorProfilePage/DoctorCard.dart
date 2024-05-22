import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/model/DoctorProfile.dart';

class DoctorCard extends StatelessWidget {
  final DoctorProfile doctorProfile;
  const DoctorCard({super.key, required this.doctorProfile});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.93,
      height: size.height * 0.28,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Stack(
        children: [
          //Text "Doctor Card"
          const Positioned(
              top: 10,
              left: 135,
              child: Text(
                "Docotor Card",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
          //Menu Icon
          const Positioned(
              top: 10,
              right: 15,
              child: Icon(
                Icons.menu,
                size: 25,
              )),
          const SizedBox(height: 5),
          //Profile Picture
          const Positioned(
              top: 30,
              left: 10,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("assets/img/Logo/Cura.png"),
              )),
          //Column contains : (Doctor's data : Verified/Name/Speciality/Rating)
          Positioned(
              top: 60,
              right: 10,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 184, 218, 246),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.verified,
                          color: Color.fromARGB(255, 21, 92, 151),
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Professional Doctor",
                          style: TextStyle(
                              color: Color.fromARGB(255, 21, 92, 151),
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    "Dr. ${doctorProfile.doctor.FirstName} ${doctorProfile.doctor.LastName}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "${doctorProfile.speciality.Name}",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(
                      //   Icons.star,
                      //   color: Color.fromARGB(255, 255, 195, 106),
                      // ),
                      // Icon(
                      //   Icons.star,
                      //   color: Color.fromARGB(255, 255, 195, 106),
                      // ),
                      // Icon(
                      //   Icons.star,
                      //   color: Color.fromARGB(255, 255, 195, 106),
                      // ),
                      // Icon(
                      //   Icons.star,
                      //   color: Color.fromARGB(255, 255, 195, 106),
                      // ),
                      // Icon(
                      //   Icons.star,
                      //   color: Color.fromARGB(255, 255, 195, 106),
                      // ),
                      RatingBarIndicator(
                        rating: doctorProfile.doctor.Rating * 1.0,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(width: 3),
                      Text(
                        "${doctorProfile.doctor.Rating}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              )),
          //Divider (Bewtween Profile Picture & Row under it)
          const Positioned(
            bottom: 55,
            left: 25,
            right: 25,
            child: Divider(
              color: Colors.grey,
              thickness: 2,
            ),
          ),
          //Row Under The Profile Picture
          Positioned(
            bottom: 10,
            left: 50,
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Patient",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${doctorProfile.clinic.PatientCount}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                    indent: 4,
                    endIndent: 4,
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        "Experience",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${doctorProfile.doctor.Experience}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                    indent: 4,
                    endIndent: 4,
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        "City",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${doctorProfile.clinic.City}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
