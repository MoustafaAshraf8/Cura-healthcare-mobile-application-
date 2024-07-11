import 'package:flutter/material.dart';
import 'package:cura_for_doctor/Pages/EMRPage/getCustomFileModalBottomSheet.dart';
import 'package:cura_for_doctor/model/Allergy.dart';
import 'package:intl/intl.dart';

class AllergyCard extends StatelessWidget {
  final Allergy allergy;

  AllergyCard({required this.allergy, super.key});

/*
  {
    _id: ObjectId("6670dc9c77d0d682cb195d75"),
    // allergen: 'Hazelnutsx1',
    reaction: 'Anaphylaxis',
    // severity: 'Severe',
    // diagnosisDate: ISODate("2015-06-01T00:00:00.000Z"),
    notes: 'Carries an epinephrine auto-injector',
    file: [ ObjectId("6670dc9c77d0d682cb195d77") ],
    __v: 1
  },
*/

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      // margin: EdgeInsets.only(bottom: 10),
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
                            allergy.allergen,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: (allergy.severity as String)
                                              .toLowerCase() ==
                                          "severe"
                                      ? Colors.red
                                      : Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                allergy.severity,
                                // style: const TextStyle(
                                //   color: Colors.black54,
                                // ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
                                '${DateFormat.yMMMd().format(allergy.diagnosisDate)}',
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
                            "reaction: ",
                            // style: const TextStyle(
                            //   color: Colors.black54,
                            // ),
                            style: const TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            allergy.reaction,
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
                    if (allergy.notes != null)
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
                              allergy.notes!,
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
                              context, allergy.file),
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

/*
  @override
  Widget build(BuildContext context) {
    return Table(
        defaultColumnWidth: FixedColumnWidth(120.0),
        border: TableBorder.all(
            color: Colors.black, style: BorderStyle.solid, width: 2),
        children: [
          TableRow(children: [
            Column(
              children: [
                Text(
                  'Website',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Tutorial',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Review',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ]),
        ]);
  }
*/
}
