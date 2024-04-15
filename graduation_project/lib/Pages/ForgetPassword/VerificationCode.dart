import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Pages/ForgetPassword/ResetPassword.dart';
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
          title: Text("Verification Code",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage(
                        "assets/img/ForgetPassword/VerificationCode.png")),
                //SizedBox(height: height * 0.07),
                SizedBox(height: 20.0),
                Container(
                  width: width,
                  child: Text(
                    "Please Enter The Verification Code That Have Been Sent To Your E-mail ..!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: height * 0.05),

                //Pinput Pacakge Usage (Verification Code)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: width,
                    child: Pinput(
                      length: 4,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      defaultPinTheme: PinTheme(
                          height: 60.0,
                          width: 60.0,
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 1.0,
                              ))),
                      focusedPinTheme: PinTheme(
                          height: 60.0,
                          width: 60.0,
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ))),
                    ),
                  ),
                ),

                //Verify Button
                SizedBox(height: 50.0),
                SizedBox(
                  height: 50,
                  width: 150,
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
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.all(12.0)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)))),
                    child: const Text("Verify",
                        style: TextStyle(color: Colors.white, fontSize: 18.0)),
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
