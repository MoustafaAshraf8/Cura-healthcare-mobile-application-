import 'package:cura_for_doctor/Pages/EMRPage/EMRPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleCardPatient extends StatefulWidget {
  final int index;
  final int timeslot_id;
  final String PatientEmail;
  final String name;
  final int patient_id;
  final String gender;
  final String Date;
  final String Time;
  final Function cancelTimeSlotFunction;
  ScheduleCardPatient(
      {required this.index,
      required this.timeslot_id,
      required this.PatientEmail,
      required this.name,
      required this.patient_id,
      required this.gender,
      required this.Date,
      required this.Time,
      required this.cancelTimeSlotFunction,
      super.key});

  @override
  State<ScheduleCardPatient> createState() => _ScheduleCardPatientState();
}

class _ScheduleCardPatientState extends State<ScheduleCardPatient> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EMRPage(
                    patient_id: widget.patient_id,
                  )),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.01),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.sp),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: SizedBox(
                width: width,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        widget.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(widget.gender),
                      trailing: CircleAvatar(
                        radius: 25.sp,
                        backgroundImage: AssetImage("assets/img/Logo/Cura.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      child: Divider(
                        // color: Colors.black,
                        thickness: 1,
                        height: 20.sp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5.sp),
                            Text(
                              widget.Date,
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time_filled,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5.sp),
                            Text(
                              widget.Time.substring(0, 5),
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       padding: EdgeInsets.all(5.sp),
                        //       decoration: BoxDecoration(
                        //         color: scheduleStatus == "Confirmed" ||
                        //                 scheduleStatus == "Completed"
                        //             ? Colors.green
                        //             : Colors.red,
                        //         shape: BoxShape.circle,
                        //       ),
                        //     ),
                        //     SizedBox(width: 5.sp),
                        //     Text(
                        //       scheduleStatus,
                        //       style: const TextStyle(
                        //         color: Colors.black54,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    SizedBox(height: 15.sp),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                widget.cancelTimeSlotFunction(
                                    index: widget.index,
                                    timeslot_id: widget.timeslot_id);
                              },
                              child: Container(
                                // width: 100.sp,
                                padding: EdgeInsets.symmetric(vertical: 8.sp),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 220, 20, 6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.sp),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
