import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:cura_for_doctor/Pages/ForgetPassword/ResetPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pinput/pinput.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          whiteBackArrow: false,
          title: Text("Verification Code",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                    image: AssetImage(
                        "assets/img/ForgetPassword/VerificationCode.png")),
                SizedBox(height: height * 0.02),
                Container(
                  width: width * 0.9,
                  child: Text(
                    "Please Enter The Verification Code That Have Been Sent To Your E-mail ..!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: height * 0.05),

                //Pinput Pacakge Usage (Verification Code)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: SizedBox(
                    width: width,
                    child: Pinput(
                      length: 4,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      defaultPinTheme: PinTheme(
                          height: height * 0.07,
                          width: width * 0.25,
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 1.sp,
                              ))),
                      focusedPinTheme: PinTheme(
                          height: height * 0.07,
                          width: width * 0.25,
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 1.sp,
                              ))),
                    ),
                  ),
                ),

                //Verify Button
                SizedBox(height: height * 0.05),
                SizedBox(
                  height: 42.sp,
                  width: 140.sp,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPassword()),
                      );
                    },
                    style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.black),
                        padding:
                            MaterialStatePropertyAll(EdgeInsets.all(12.sp)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)))),
                    child: Text("Verify",
                        style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
