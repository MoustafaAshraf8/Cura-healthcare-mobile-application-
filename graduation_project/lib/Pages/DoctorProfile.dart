import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/PrimaryHeaderContainer.dart';
import 'package:graduation_project/Contants/CustomShapes/CustomLoading/CustomLoading.dart';
import 'package:graduation_project/api/getDoctorScheduleById.dart';
import 'package:graduation_project/model/DoctorSchedule.dart';

class WeekDays {
  String dayName;

  WeekDays({required this.dayName});
}

class DoctorProfile extends StatefulWidget {
  final doctor_id;
  DoctorProfile({super.key, required this.doctor_id});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  // var loading = false;

  // void revertLoading() {
  //   setState(() {
  //     loading = !loading;
  //   });
  // }

  // late var doctorSchedule;

  // void setDoctorSchedule(DoctorSchedule newDoctorSchedule) {
  //   doctorSchedule = newDoctorSchedule;
  // }

  // void loadDoctorSchedule() async {
  //   await getDoctorScheduleById(
  //       doctor_id: widget.doctor_id,
  //       setDoctorSchedule: setDoctorSchedule,
  //       revertLoading: revertLoading);
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   loadDoctorSchedule();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    List<WeekDays> week = [
      WeekDays(dayName: "Sat"),
      WeekDays(dayName: "Sun"),
      WeekDays(dayName: "Mon"),
      WeekDays(dayName: "Tue"),
      WeekDays(dayName: "Wed"),
      WeekDays(dayName: "Thu"),
      WeekDays(dayName: "Fri"),
    ];
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ///Header --Page Header-- (Blue Part) Using "Primary Header Countainer"
              PrimaryHeaderContainer(
                  child: Column(
                children: [
                  //Header AppBar
                  const SizedBox(
                    height: 5,
                  ),
                  const TAppBar(
                    showBackArrow: true,
                    title: Text(
                      "Doctor Profile",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    actions: [
                      Icon(
                        Icons.person_pin_rounded,
                        color: Colors.white,
                        size: 27,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //Doctor Profile Card
                  Container(
                    width: size.width * 0.93,
                    height: size.height * 0.28,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
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
                              backgroundImage:
                                  AssetImage("assets/img/Logo/Cura.png"),
                            )),
                        //Column contains : (Doctor's data : Verified/Name/Speciality/Rating)
                        Positioned(
                            top: 60,
                            right: 10,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 184, 218, 246),
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
                                            color: Color.fromARGB(
                                                255, 21, 92, 151),
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 7),
                                const Text(
                                  "Dr. Jennefier Kourteny",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  "Cardiology Consultation",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 2),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 255, 195, 106),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 255, 195, 106),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 255, 195, 106),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 255, 195, 106),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 255, 195, 106),
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      "4.8",
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
                        const Positioned(
                          bottom: 10,
                          left: 50,
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Patient",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "2100+",
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
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "10 yrs+",
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
                                      "Adderss",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Alexandria",
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
                  ),
                ],
              )),

              ///Body --Page Body-- (White Part)
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Select Date",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 15),

                    ///Scrolable dates
                    Container(
                      height: 90,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: week.length,
                        // itemCount: doctorSchedule.timeSlot.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: index == 1
                                      ? const Color.fromARGB(255, 8, 55, 102)
                                      : const Color(0xFFF2F8FF),
                                  borderRadius: BorderRadius.circular(50.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 8, 55, 102),
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ]),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "${index + 8}",
                                    // "${doctorSchedule.timeSlot[index].Start}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: index == 1
                                            ? Colors.white
                                            : Colors.black.withOpacity(0.6)),
                                  ),
                                  Text(
                                    week[index].dayName,
                                    // doctorSchedule.Dayt,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: index == 1
                                            ? Colors.white
                                            : Colors.black.withOpacity(0.6)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    ///Divider between Select Date & Time
                    const Divider(
                      color: Colors.grey,
                      thickness: 5.0,
                      indent: 25.0,
                      endIndent: 25.0,
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "Select Time",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 15),

                    ///Scrlable Time
                    Container(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: index == 2
                                    ? const Color.fromARGB(255, 8, 55, 102)
                                    : const Color(0xFFF2F8FF),
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 8, 55, 102),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ),
                                ]),
                            child: Center(
                              child: Text(
                                "${index + 8}:00 AM",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: index == 2
                                        ? Colors.white
                                        : Colors.black.withOpacity(0.6)),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    ///Divider between Select Time & booking button
                    const Divider(
                      color: Colors.grey,
                      thickness: 5.0,
                      indent: 5.0,
                      endIndent: 5.0,
                    ),
                    const SizedBox(height: 35.0),

                    ///Booking Button
                    Material(
                      color: const Color.fromARGB(255, 8, 55, 102),
                      borderRadius: BorderRadius.circular(50.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: size.width,
                          child: const Center(
                            child: Text("Book Appointment",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
