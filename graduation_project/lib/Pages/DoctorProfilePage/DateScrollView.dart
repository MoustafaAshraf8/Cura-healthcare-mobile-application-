import 'package:flutter/material.dart';
import 'package:graduation_project/model/DoctorSchedule.dart';

class DateScrollView extends StatelessWidget {
  final List<DoctorSchedule> doctorScheduleList;
  final int activeDay;
  final Function updateActiveDay;
  DateScrollView(
      {super.key,
      required this.doctorScheduleList,
      required this.activeDay,
      required this.updateActiveDay});

  final Map<String, String> dayConverter = {
    "Saturday": "Sat",
    "saturday": "Sat",
    "Sunday": "Sun",
    "sunday": "Sun",
    "Monday": "Mon",
    "monday": "Mon",
    "Tuesday": "Tue",
    "tuesday": "Tue",
    "Wednesday": "Wed",
    "wednesday": "Wed",
    "Thursday": "Thu",
    "thursday": "Thu",
    "Friday": "Fri",
    "friday": "Fri",
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Select Date",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          // const SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: doctorScheduleList.length,
                  // itemCount: doctorSchedule.timeSlot.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => updateActiveDay(index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: index == activeDay
                                ? const Color.fromARGB(255, 8, 55, 102)
                                : const Color(0xFFF2F8FF),
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 8, 55, 102),
                                blurRadius: 2.0,
                                spreadRadius: 2.0,
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              (dayConverter[doctorScheduleList[index].Day]
                                  as String),
                              // "${doctorSchedule.timeSlot[index].Start}",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: index == activeDay
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.6)),
                            ),
                            Text(
                              doctorScheduleList[index].Date.split('-')[
                                  doctorScheduleList[index]
                                          .Date
                                          .split('-')
                                          .length -
                                      1],
                              // doctorSchedule.Dayt,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: index == activeDay
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class WeekDays {
//   String dayName;

//   WeekDays({required this.dayName});
// }
