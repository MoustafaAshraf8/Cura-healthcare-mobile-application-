import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/PrimaryHeaderContainer.dart';
import 'package:graduation_project/Contants/CustomShapes/CustomLoading/CustomLoading.dart';
import 'package:graduation_project/Pages/DoctorProfilePage/CustomBookButton.dart';
import 'package:graduation_project/Pages/DoctorProfilePage/DateScrollView.dart';
import 'package:graduation_project/Pages/DoctorProfilePage/CustomDivider.dart';
import 'package:graduation_project/Pages/DoctorProfilePage/DoctorCard.dart';
import 'package:graduation_project/Pages/DoctorProfilePage/TimeScrollView.dart';
import 'package:graduation_project/api/getDoctorProfile.dart';
import 'package:graduation_project/api/getDoctorScheduleById.dart';
import 'package:graduation_project/model/DoctorProfile.dart';
import 'package:graduation_project/model/DoctorSchedule.dart';
import './WeekDays.dart';

class DoctorProfilePage extends StatefulWidget {
  final doctor_id;
  DoctorProfilePage({super.key, required this.doctor_id});

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  late DoctorProfile doctorProfile;

  int activeDay = 0;
  int activeTimeSlot = 0;
  var loading = false;

  void updateActiveDay(int index) {
    setState(() {
      activeDay = index;
    });
  }

  void updateActiveTimeSlot(int index) {
    setState(() {
      activeTimeSlot = index;
    });
  }

  void revertLoading() {
    setState(() {
      loading = !loading;
    });
  }

  void setDoctorProfile({required DoctorProfile doctorProfile}) {
    this.doctorProfile = doctorProfile;
  }

  void loadDoctorProfile() async {
    await getDoctorProfile(
        doctor_id: widget.doctor_id,
        setDoctorProfile: setDoctorProfile,
        revertLoading: revertLoading);
  }

  @override
  void initState() {
    loadDoctorProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return (loading == true)
        ? CustomLoading()
        : SafeArea(
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
                        DoctorCard(
                          doctorProfile: doctorProfile,
                        )
                      ],
                    )),

                    ///Body --Page Body-- (White Part)
                    const SizedBox(height: 0.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///Scrolable dates
                          DateScrollView(
                              doctorScheduleList:
                                  doctorProfile.clinic.doctorSchedule,
                              activeDay: activeDay,
                              updateActiveDay: updateActiveDay),

                          ///Divider between Select Date & Time
                          CustomDivider(),
                          const SizedBox(height: 0.0),

                          ///Scrlable Time
                          TimeScrollView(
                              timeSlotList:
                                  (doctorProfile.clinic.doctorSchedule.length >
                                          0)
                                      ? doctorProfile.clinic
                                          .doctorSchedule[activeDay].timeSlot
                                      : null,
                              activeTimeSlot: activeTimeSlot,
                              updateActiveTimeSlot: updateActiveTimeSlot),

                          ///Divider between Select Time & booking button
                          CustomDivider(),
                          // const SizedBox(height: 35.0),

                          ///Booking Button
                          CustomBookButton()
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
