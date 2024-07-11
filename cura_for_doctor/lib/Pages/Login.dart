// ignore_for_file: file_names

import 'package:cura_for_doctor/Pages/AppointmentPage/ReservedTimeSlotPage.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/CalenderViewPage.dart';
import 'package:cura_for_doctor/Pages/ForgetPassword/ForgetPassword.dart';
import 'package:cura_for_doctor/Pages/MainLayout.dart';
import 'package:cura_for_doctor/Pages/SignUpPage/SignUpPage.dart';
import 'package:cura_for_doctor/api/DoctorSignIn.dart';
import 'package:cura_for_doctor/model/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  var loading = false;

  void revertLoading() {
    setState(() {
      loading = !loading;
    });
  }

  void logInRequest() async {
    User user = User(
        Email: emailTextEditingController.value.text,
        Password: passwordTextEditingController.value.text);
    bool success = await DoctorSignIn(user: user, revertLoading: revertLoading);
    if (success) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => MainLayout()), (route) => false);
    } else {
      revertLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 8, 55, 102),
        body: ModalProgressHUD(
          inAsyncCall: loading,
          opacity: 0.1,
          blur: 5,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(45.sp),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Column(
                      children: [
                        Container(
                          height: height * 0.3,
                          width: width * 0.3,
                          child: Image.asset(
                            "assets/img/Logo/Cura.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      style: TextStyle(fontSize: 13.sp),
                      decoration: InputDecoration(
                          icon: const Icon(
                            Icons.email,
                          ),
                          iconColor: Colors.white,
                          labelText: "Enter Your E-mail",
                          labelStyle:
                              TextStyle(fontSize: 13.sp, color: Colors.white)),
                    ),
                    SizedBox(
                      height: 8.sp,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(fontSize: 13.sp),
                      decoration: InputDecoration(
                          icon: const Icon(
                            Icons.lock,
                          ),
                          iconColor: Colors.white,
                          labelText: "Enter Your Password",
                          labelStyle:
                              TextStyle(fontSize: 13.sp, color: Colors.white)),
                    ),
                    Container(
                      height: height * 0.05,
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgetPassword()),
                            );
                          },
                          child: Text(
                            "Forget Password ?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      height: 42.sp,
                      width: 140.sp,
                      child: ElevatedButton(
                        onPressed: logInRequest,
                        style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.black),
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(12.sp)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        child: Text("Login",
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.sp)),
                      ),
                    ),
                    const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Do not have an account ?",
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
