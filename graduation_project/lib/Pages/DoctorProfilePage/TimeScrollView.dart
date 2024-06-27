import 'package:flutter/material.dart';
import 'package:graduation_project/model/TimeSlot.dart';

class TimeScrollView extends StatelessWidget {
  final List<TimeSlot>? timeSlotList;
  final int activeTimeSlot;
  final Function updateActiveTimeSlot;
  const TimeScrollView(
      {super.key,
      required this.timeSlotList,
      required this.activeTimeSlot,
      required this.updateActiveTimeSlot});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Select Time",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          // const SizedBox(height: 15),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: (timeSlotList != null) ? timeSlotList?.length : 0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => updateActiveTimeSlot(index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: index == activeTimeSlot
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
                            "${timeSlotList?[index].Start.substring(0, 5)} AM",
                            style: TextStyle(
                                fontSize: 17,
                                color: index == activeTimeSlot
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.6)),
                          ),
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
