import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Contants/CustomShapes/Card/ScheduleCard.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<Schedule> {
  int _buttonIndex = 0;

  final List<ScheduleCard> _upcomingScheduleWidgets = [
    const ScheduleCard(
        'Dr. Name', 'Speciality', 'Confirmed', 'assets/img/Logo/Cura.png'),
    const ScheduleCard(
        'Dr. Name', 'Speciality', 'Confirmed', 'assets/img/Logo/Cura.png'),
    const ScheduleCard(
        'Dr. Name', 'Speciality', 'Confirmed', 'assets/img/Logo/Cura.png'),
    const ScheduleCard(
        'Dr. Name', 'Speciality', 'Confirmed', 'assets/img/Logo/Cura.png'),
    const ScheduleCard(
        'Dr. Name', 'Speciality', 'Confirmed', 'assets/img/Logo/Cura.png'),
  ];

  final List<ScheduleCard> _completedScheduleWidgets = [
    const ScheduleCard(
        'Dr. Name', 'Speciality', 'Completed', 'assets/img/Logo/Cura.png'),
    const ScheduleCard(
        'Dr. Name', 'Speciality', 'Completed', 'assets/img/Logo/Cura.png'),
    const ScheduleCard(
        'Dr. Name', 'Speciality', 'Completed', 'assets/img/Logo/Cura.png'),
  ];

  final List<ScheduleCard> _canceledScheduleWidgets = [
    const ScheduleCard(
        'Dr. Name', 'Speciality', 'Canceled', 'assets/img/Logo/Cura.png'),
    const ScheduleCard(
        'Dr. Name', 'Speciality', 'Canceled', 'assets/img/Logo/Cura.png'),
    const ScheduleCard(
        'Dr. Name', 'Speciality', 'Canceled', 'assets/img/Logo/Cura.png')
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                    showBackArrow: true,
                    title: Text("Schedule History",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    actions: [
                      Icon(
                        Icons.history,
                        color: Colors.white,
                        size: 27,
                      ),
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
                          "Upcoming",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _buttonIndex == 0
                                ? Colors.white
                                : Colors.black38,
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
                          "Completed",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _buttonIndex == 1
                                ? Colors.white
                                : Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _buttonIndex = 2;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                          color: _buttonIndex == 2
                              ? const Color(0xFF11519b)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Canceled",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _buttonIndex == 2
                                ? Colors.white
                                : Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              // Widgets According to buttons
              if (_buttonIndex == 0)
                for (int i = 0; i < _upcomingScheduleWidgets.length; i++)
                  _upcomingScheduleWidgets[i]
              else if (_buttonIndex == 1)
                for (int i = 0; i < _completedScheduleWidgets.length; i++)
                  _completedScheduleWidgets[i]
              else
                for (int i = 0; i < _canceledScheduleWidgets.length; i++)
                  _canceledScheduleWidgets[i]
            ],
          ),
        ),

        ///Navigation Bar --Page Footer--
      ),
    );
  }
}
