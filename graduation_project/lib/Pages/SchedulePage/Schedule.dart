// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Pages/DoctorProfilePage/DoctorProfilePage.dart';
import 'package:graduation_project/Pages/SchedulePage/CustomLoadingScheduleCard.dart';
import 'package:graduation_project/Pages/SchedulePage/ScheduleCard.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:graduation_project/api/deleteReservedTimeSlot.dart';
import 'package:graduation_project/api/getSchedule.dart';
import 'package:graduation_project/class/AppTheme.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<Schedule> {
  int _buttonIndex = 0;
  bool _isInAsyncCall = false;
  double bur = 5;
  Future<List<dynamic>> schedules = getSchedule();
  void cancelTimeSlotFunction({required index, required timeslot_id}) async {
    setState(() {
      _isInAsyncCall = true;
    });
    await Future.delayed(Duration(seconds: 2));
    bool deleted = await deleteReservedTimeSlot(timeslot_id: timeslot_id);
    if (deleted) {
      await (await schedules).removeAt(index);
    }
    setState(() {
      _isInAsyncCall = false;
    });
  }

  void rescheduleTimeSlot({required doctor_id}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DoctorProfilePage(doctor_id: doctor_id),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: _isInAsyncCall,
          opacity: 0.1,
          blur: bur,
          progressIndicator:
              CircularProgressIndicator(color: AppTheme.customBlue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Header --Page Header-- (Blue Part) --> Using Secondary Header Container "Not the home page"
              const SecondaryHeaderContainer(
                  child: Column(
                children: [
                  //Header AppBar
                  SizedBox(
                    height: 5,
                  ),
                  TAppBar(
                    showBackArrow: false,
                    title: Text("Schedule",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    actions: [
                      // Icon(
                      //   Icons.history,
                      //   color: Colors.white,
                      //   size: 27,
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                ],
              )),

              ///Body --Page Body-- (White Part)
              // Container(
              //   padding: const EdgeInsets.all(5),
              //   margin: const EdgeInsets.symmetric(horizontal: 10),
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFF4F6FA),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         setState(() {
              //           _buttonIndex = 0;
              //         });
              //       },
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(
              //             vertical: 12, horizontal: 20),
              //         decoration: BoxDecoration(
              //           color: _buttonIndex == 0
              //               ? const Color(0xFF11519b)
              //               : Colors.transparent,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Text(
              //           "Upcoming",
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w500,
              //             color: _buttonIndex == 0
              //                 ? Colors.white
              //                 : Colors.black38,
              //           ),
              //         ),
              //       ),
              //     ),
              //     InkWell(
              //       onTap: () {
              //         setState(() {
              //           _buttonIndex = 1;
              //         });
              //       },
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(
              //             vertical: 12, horizontal: 20),
              //         decoration: BoxDecoration(
              //           color: _buttonIndex == 1
              //               ? const Color(0xFF11519b)
              //               : Colors.transparent,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Text(
              //           "Completed",
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w500,
              //             color: _buttonIndex == 1
              //                 ? Colors.white
              //                 : Colors.black38,
              //           ),
              //         ),
              //       ),
              //     ),
              //     InkWell(
              //       onTap: () {
              //         setState(() {
              //           _buttonIndex = 2;
              //         });
              //       },
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(
              //             vertical: 12, horizontal: 20),
              //         decoration: BoxDecoration(
              //           color: _buttonIndex == 2
              //               ? const Color(0xFF11519b)
              //               : Colors.transparent,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Text(
              //           "Canceled",
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w500,
              //             color: _buttonIndex == 2
              //                 ? Colors.white
              //                 : Colors.black38,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              //),
              // const SizedBox(height: 5),
              // Widgets According to buttons
              // if (_buttonIndex == 0)
              //   for (int i = 0; i < _upcomingScheduleWidgets.length; i++)
              //     _upcomingScheduleWidgets[i]
              // else if (_buttonIndex == 1)
              //   for (int i = 0; i < _completedScheduleWidgets.length; i++)
              //     _completedScheduleWidgets[i]
              // else
              //   for (int i = 0; i < _canceledScheduleWidgets.length; i++)
              //     _canceledScheduleWidgets[i]
              FutureBuilder(
                future: schedules,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return CustomLoadingScheduleCard();
                        },
                      ),
                    );
                  } else if (snapshot.hasError ||
                      !snapshot.hasData ||
                      snapshot.data!.length == 0) {
                    return Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/img/Logo/Cura.png")),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ScheduleCard(
                          data: snapshot.data![index],
                          index: index,
                          cancelTimeSlotFunction: cancelTimeSlotFunction,
                          rescheduleTimeSlot: rescheduleTimeSlot,
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),

        ///Navigation Bar --Page Footer--
      ),
    );
  }
}
