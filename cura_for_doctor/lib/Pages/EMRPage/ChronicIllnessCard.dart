import 'package:cura_for_doctor/Pages/EMRPage/getCustomFileModalBottomSheet.dart';
import 'package:cura_for_doctor/model/ChronicIllness.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChronicIllnessCard extends StatelessWidget {
  final ChronicIllness chronicIllness;
  ChronicIllnessCard({required this.chronicIllness, super.key});

/*
  {
    _id: ObjectId("66712ecc51f3694a8571c0f3"),
    illness: 'Diabetes',
    diagnosisDate: ISODate("2020-01-01T00:00:00.000Z"),
    treatment: 'Insulin',
    notes: 'Requires daily insulin injections',
    file: [ ObjectId("66712ecc51f3694a8571c0f5") ],
    __v: 1
  }
*/

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
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
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            chronicIllness.illness,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Colors.black54,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '${DateFormat.yMMMd().format(chronicIllness.diagnosisDate)}',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          const SizedBox(width: 5),
                          Text(
                            "treatment: ",
                            // style: const TextStyle(
                            //   color: Colors.black54,
                            // ),
                            style: const TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            chronicIllness.treatment,
                            // style: const TextStyle(
                            //   color: Colors.black54,
                            // ),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (chronicIllness.notes != null)
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            const SizedBox(width: 5),
                            Text(
                              "notes: ",
                              // style: const TextStyle(
                              //   color: Colors.black54,
                              // ),
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              chronicIllness.notes!,
                              // style: const TextStyle(
                              //   color: Colors.black54,
                              // ),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    // Container(
                    //   margin: EdgeInsets.only(bottom: 10),
                    //   child: const Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Icon(
                    //         Icons.calendar_month,
                    //         color: Colors.black54,
                    //       ),
                    //       SizedBox(width: 5),
                    //       Text(
                    //         "12/01/2023",
                    //         style: TextStyle(
                    //           color: Colors.black54,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // InkWell(
                        //   onTap: () {},
                        //   child: Container(
                        //     width: 150,
                        //     padding: const EdgeInsets.symmetric(vertical: 12),
                        //     decoration: BoxDecoration(
                        //       color: const Color(0xFFF4F6FA),
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     child: const Center(
                        //       child: Text(
                        //         "More",
                        //         style: TextStyle(
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.w500,
                        //           color: Colors.black54,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        InkWell(
                          onTap: () => getCustomFileModalBottomSheet(
                              context, chronicIllness.file),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            width: 150,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF11519b),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Files",
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
