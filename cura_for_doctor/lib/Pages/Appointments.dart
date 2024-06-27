import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:cura_for_doctor/Contants/CustomShapes/Card/ScheduleCardPatient.dart';
import 'package:cura_for_doctor/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:cura_for_doctor/class/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeekDays {
  String dayName;

  WeekDays({required this.dayName});
}

class Appointments extends StatelessWidget {
  const Appointments({super.key});
  @override
  Widget build(BuildContext context) {
    List<WeekDays> week = [
      WeekDays(dayName: "Saturday"),
      WeekDays(dayName: "Sunday"),
      WeekDays(dayName: "Monday"),
      WeekDays(dayName: "Tuesday"),
      WeekDays(dayName: "Wednesday"),
      WeekDays(dayName: "Thursday"),
      WeekDays(dayName: "Friday"),
    ];

    final List<ScheduleCardPatient> _upcomingScheduleWidgets = [
      const ScheduleCardPatient(
          'Name:', 'Gender:', 'Confirmed', 'assets/img/Logo/Cura.png'),
      const ScheduleCardPatient(
          'Name:', 'Gender:', 'Confirmed', 'assets/img/Logo/Cura.png'),
      const ScheduleCardPatient(
          'Name:', 'Gender:', 'Confirmed', 'assets/img/Logo/Cura.png'),
      const ScheduleCardPatient(
          'Name:', 'Gender:', 'Confirmed', 'assets/img/Logo/Cura.png'),
      const ScheduleCardPatient(
          'Name:', 'Gender:', 'Confirmed', 'assets/img/Logo/Cura.png'),
    ];

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Header --Page Header-- (Blue Part) --> Using Secondary Header Container "Not the home page"
            SecondaryHeaderContainer(
                child: Column(
              children: [
                SizedBox(
                  height: height * 0.005,
                ),
                TAppBar(
                  showBackArrow: true,
                  whiteBackArrow: true,
                  title: Text("Appointments",
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  actions: [
                    Icon(
                      Icons.app_registration_outlined,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ],
                ),
              ],
            )),

            ///Body --Page Body-- (White Part)
            //-- Weekday Slider --
            SizedBox(
              height: height * 0.045,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: week.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.sp),
                      child: Container(
                        width: 100.sp,
                        //height: 50.sp,
                        decoration: BoxDecoration(
                            color: AppTheme.customBlue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          week[index].dayName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),

            //-- Appointments --
            for (int i = 0; i < _upcomingScheduleWidgets.length; i++)
              _upcomingScheduleWidgets[i]
          ],
        ),
      ),
    ));
  }
}
