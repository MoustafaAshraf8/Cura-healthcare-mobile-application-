import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleCard extends StatelessWidget {
  // const ScheduleCard(this.doctorName, this.doctorSpeciality,
  //     this.scheduleStatus, this.doctorImagePath,
  //     {super.key});

  // final String doctorName;
  // final String doctorSpeciality;
  // final String scheduleStatus;
  // final String doctorImagePath;
  final Map<String, dynamic> data;
  final int index;
  final Function cancelTimeSlotFunction;
  final Function rescheduleTimeSlot;
  ScheduleCard(
      {required this.data,
      required this.index,
      required this.cancelTimeSlotFunction,
      required this.rescheduleTimeSlot,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ListTile(
                    // titleAlignment: ListTileTitleAlignment.top,
                    title: Text(
                      // doctorName,
                      data["schedule"]["clinic"]["doctor"]["FirstName"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(data["schedule"]["clinic"]["doctor"]
                        ["speciality"]["Name"]),
                    trailing: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/img/Logo/Cura.png"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      // color: Colors.black,
                      thickness: 1,
                      height: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '${DateFormat.yMMMd().format(DateTime.parse(data["schedule"]["Date"]))}',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "${data["Start"].substring(0, 5)} AM",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.attach_money_outlined,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 5),
                          Text(
                            data["schedule"]["clinic"]["Fee"],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       padding: const EdgeInsets.all(5),
                      //       decoration: BoxDecoration(
                      //         color: data["schedule"]["clinic"]["doctor"]
                      //                         ["FirstName"] ==
                      //                     "Confirmed" ||
                      //                 data["schedule"]["clinic"]["doctor"]
                      //                         ["FirstName"] ==
                      //                     "Completed"
                      //             ? Colors.green
                      //             : Colors.red,
                      //         shape: BoxShape.circle,
                      //       ),
                      //     ),
                      //     const SizedBox(width: 5),
                      //     Text(
                      //       "scheduleStatus",
                      //       style: const TextStyle(
                      //         color: Colors.black54,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          cancelTimeSlotFunction(
                              index: index, timeslot_id: data["timeslot_id"]);
                        },
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4F6FA),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          rescheduleTimeSlot(
                              doctor_id: data["schedule"]["clinic"]["doctor"]
                                  ["doctor_id"]);
                        },
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF11519b),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Reschedule",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
