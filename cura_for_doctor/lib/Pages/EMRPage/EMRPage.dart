import 'package:flutter/material.dart';
import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:cura_for_doctor/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:cura_for_doctor/Pages/EMRPage/AllergyPage/AllergyListView.dart';
import 'package:cura_for_doctor/Pages/EMRPage/ChronicIllnessListView.dart';

class EMRPage extends StatefulWidget {
  final int patient_id;
  const EMRPage({required this.patient_id, super.key});

  @override
  State<EMRPage> createState() => _EMRPageState();
}

class _EMRPageState extends State<EMRPage> {
  int _buttonIndex = 0;
  List<String> ids = [
    "aaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaa",
  ];

  // Map<int, Widget> widgetMap = {
  //   0: AllergyListView(patient_id: widget.patient_id,),
  //   1: ChronicIllnessListView()
  // };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                  title: Text("EMR",
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
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F6FA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _buttonIndex = 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        color: _buttonIndex == 0
                            ? const Color(0xFF11519b)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Allergy",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color:
                              _buttonIndex == 0 ? Colors.white : Colors.black38,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _buttonIndex = 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        color: _buttonIndex == 1
                            ? const Color(0xFF11519b)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "ChronicIllness",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color:
                              _buttonIndex == 1 ? Colors.white : Colors.black38,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            // widgetMap[_buttonIndex] as Widget
            (_buttonIndex == 0)
                ? AllergyListView(patient_id: widget.patient_id)
                : ChronicIllnessListView(patient_id: widget.patient_id)
          ],
        ),
      ),
    );
  }
}
