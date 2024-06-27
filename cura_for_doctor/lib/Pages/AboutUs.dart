import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 8, 55, 102),
        appBar: TAppBar(
          showBackArrow: true,
          whiteBackArrow: true,
          title: Text("About Us",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          actions: [
            Icon(
              Icons.help_outline,
              color: Colors.white,
              size: 24.sp,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                    height: height * 0.35,
                    width: width * 0.35,
                    child: const Image(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/img/Logo/Cura.png"))),
              ),
              SizedBox(height: height * 0.05),
              SizedBox(
                height: height * 0.45,
                child: Stack(
                  children: [
                    Positioned(
                      left: width * 0.07,
                      right: width * 0.2,
                      child: Container(
                        height: height * 0.17,
                        width: width * 0.25,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 195, 106),
                            border:
                                Border.all(color: Colors.white, width: 2.0)),
                        child: Padding(
                          padding: EdgeInsets.all(15.sp),
                          child: Text(
                            "CURA is the leading digital healthcare booking platform and practice management software in MENA.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: width * 0.23,
                      right: width * 0.07,
                      bottom: height * 0.155,
                      child: Container(
                        height: height * 0.17,
                        width: width * 0.25,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 8, 55, 102),
                            border:
                                Border.all(color: Colors.white, width: 2.0)),
                        child: Padding(
                          padding: EdgeInsets.all(15.sp),
                          child: Text(
                            "We are pioneering the shift to automated physician, clinic, and hospital bookings making healthcare easily accessible in the region.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
