import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/CustomBtn.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  int _btnIndex = 0;
  final _scheduleWidgets = [
    Center(
      child: Text("Upcoming"),
    ),
    Center(
      child: Text("Completed"),
    ),
  ];

  // void changeScene() {
  //   setState(() {
  //     _btnIndex = 0;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              height: 120,
              width: MediaQuery.of(context).size.width * 1,
              child: Center(
                child: Text(
                  "Appointements",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                // width: MediaQuery.of(context).size.width * 1,
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBtn(
                      text: "Upcoming",
                      onTap: () {
                        setState(() {
                          _btnIndex = 0;
                        });
                      },
                      color: _btnIndex == 0
                          ? Color.fromARGB(255, 219, 199, 19)
                          : Colors.blue,
                    ),
                    CustomBtn(
                        text: "Completed",
                        onTap: () {
                          setState(() {
                            _btnIndex = 1;
                          });
                        },
                        color: _btnIndex == 1
                            ? Color.fromARGB(255, 219, 199, 19)
                            : Colors.blue),
                    // CustomBtn(
                    //     text: "Completed",
                    //     onTap: () {
                    //       setState(() {
                    //         _btnIndex = 1;
                    //       });
                    //     },
                    //     color: _btnIndex == 1
                    //         ? Color.fromARGB(255, 255, 234, 44)
                    //         : Colors.blue),
                    // CustomBtn(
                    //     text: "Completed",
                    //     onTap: () {
                    //       setState(() {
                    //         _btnIndex = 1;
                    //       });
                    //     },
                    //     color: _btnIndex == 1
                    //         ? Color.fromARGB(255, 255, 234, 44)
                    //         : Colors.blue),
                  ],
                ),
              ),
              // _scheduleWidgets[_btnIndex],
              // SingleChildScrollView(
              //   child: Padding(
              //     padding: EdgeInsets.all(40),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         // Padding(
              //         //   padding: EdgeInsets.symmetric(horizontal: 15),
              //         //   child: Text("Appointements"),
              //         // )
              //       ],
              //     ),
              //   ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
