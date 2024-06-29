import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:cura_for_doctor/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:cura_for_doctor/Pages/AppointmentPage/CustomLoadingCard.dart';
import 'package:cura_for_doctor/api/deleteReservedTimeSlot.dart';
import 'package:cura_for_doctor/api/getReservedTimeSlot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'ScheduleCardPatient.dart';

class WeekDays {
  String dayName;

  WeekDays({required this.dayName});
}

class ReservedTimeSlotPage extends StatefulWidget {
  const ReservedTimeSlotPage({super.key});

  @override
  State<ReservedTimeSlotPage> createState() => _ReservedTimeSlotPageState();
}

class _ReservedTimeSlotPageState extends State<ReservedTimeSlotPage> {
  Future<dynamic> schedules = getReservedTimeslot();
  bool _isInAsyncCall = false;

  void revertLoading() {
    setState(() {
      _isInAsyncCall = !_isInAsyncCall;
    });
  }

  void cancelTimeSlotFunction({required index, required timeslot_id}) async {
    setState(() {
      _isInAsyncCall = true;
    });
    bool deleted = await deleteReservedTimeSlot(
        timeslot_id: timeslot_id, revertLoading: revertLoading);
    if (deleted) {
      await (await schedules).removeAt(index);
    }
    setState(() {
      _isInAsyncCall = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: _isInAsyncCall,
          opacity: 0.1,
          blur: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Header --Page Header-- (Blue Part) --> Using Secondary Header Container "Not the home page"
              SecondaryHeaderContainer(
                  child: Column(
                children: [
                  SizedBox(
                    height: height * 0.005,
                  ),
                  TAppBar(
                    showBackArrow: false,
                    whiteBackArrow: true,
                    title: Text("Appointment",
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    actions: [
                      // Icon(
                      //   Icons.app_registration_outlined,
                      //   color: Colors.white,
                      //   size: 24.sp,
                      // ),
                    ],
                  ),
                ],
              )),

              ///Body --Page Body-- (White Part)
              //-- Weekday Slider --
              // SizedBox(
              //   height: height * 0.045,
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: week.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return GestureDetector(
              //         onTap: () {},
              //         child: Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 5.sp),
              //           child: Container(
              //             width: 100.sp,
              //             //height: 50.sp,
              //             decoration: BoxDecoration(
              //                 color: AppTheme.customBlue,
              //                 borderRadius: BorderRadius.circular(10)),
              //             child: Center(
              //                 child: Text(
              //               week[index].dayName,
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 14.sp,
              //                   fontWeight: FontWeight.bold),
              //             )),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // SizedBox(
              //   height: height * 0.01,
              // ),

              //-- Appointments --
              // for (int i = 0; i < _upcomingScheduleWidgets.length; i++)
              //   _upcomingScheduleWidgets[i]
              FutureBuilder(
                future: schedules,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return CustomLoadingCard();
                        },
                      ),
                    );
                  }

                  if (snapshot.hasError || !snapshot.hasData) {
                    return Text("error!");
                  }

                  if (snapshot.data.length == 0) {
                    return Expanded(
                      child: Center(
                        child: Container(
                          child: Image(
                              image: AssetImage("assets/img/Logo/Cura.png")),
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ScheduleCardPatient(
                          name:
                              "${snapshot.data[index]["patient"]["FirstName"]}  ${snapshot.data[index]["patient"]["LastName"]}",
                          gender: snapshot.data[index]["patient"]["Gender"],
                          Date: snapshot.data[index]["schedule"]["Date"],
                          Time: snapshot.data[index]["Start"],
                          PatientEmail: snapshot.data[index]["patient"]
                              ["Email"],
                          timeslot_id: snapshot.data[index]["timeslot_id"],
                          index: index,
                          cancelTimeSlotFunction: cancelTimeSlotFunction,
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
