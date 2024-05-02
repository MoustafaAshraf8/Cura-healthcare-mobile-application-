import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:cura_for_doctor/Pages/ForgetPassword/VerificationCode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          whiteBackArrow: false,
          title: Text("Forget Password",
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
                        "assets/img/ForgetPassword/ForgetPassword.png")),
                Container(
                  width: width * 0.9,
                  child: Text(
                    "Please Enter Your E-mail Address To Recieve A Verification Code.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: height * 0.05),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  style: TextStyle(fontSize: 15.sp),
                  decoration: InputDecoration(
                      icon: const Icon(
                        Icons.alternate_email,
                      ),
                      iconColor: Colors.black,
                      labelText: "Enter Your E-mail",
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
                        MaterialPageRoute(
                            builder: (context) => VerificationCode()),
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
                    child: Text("Send",
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
