import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:cura_for_doctor/Pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        whiteBackArrow: false,
        title: Text("Reset Password",
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
                  image:
                      AssetImage("assets/img/ForgetPassword/NewPassword.png")),
              SizedBox(height: height * 0.02),
              Container(
                width: width * 0.9,
                child: Text(
                  "Your New Password Must Be Different From Previously Used Password!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: height * 0.05),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(fontSize: 15.sp),
                decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock,
                    ),
                    iconColor: Colors.black,
                    labelText: "Enter New Password",
                    labelStyle:
                        TextStyle(fontSize: 13.sp, color: Colors.black)),
              ),
              SizedBox(height: height * 0.005),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(fontSize: 15.sp),
                decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock,
                    ),
                    iconColor: Colors.black,
                    labelText: "Confirm New Password",
                    labelStyle:
                        TextStyle(fontSize: 13.sp, color: Colors.black)),
              ),
              SizedBox(height: height * 0.05),
              SizedBox(
                height: 42.sp,
                width: 140.sp,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.black),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(12.sp)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)))),
                  child: Text("Save",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
