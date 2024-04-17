import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Pages/ForgetPassword/VerificationCode.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          whiteBackArrow: false,
          title: Text("Forget Password",
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
                        "assets/img/ForgetPassword/ForgetPassword.png")),
                Container(
                  width: 300,
                  child: Text(
                    "Please Enter Your E-mail Address To Recieve A Verification Code.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 50.0),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  style: TextStyle(fontSize: 15.0),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.alternate_email,
                      ),
                      iconColor: Colors.black,
                      labelText: "Enter Your E-mail",
                      labelStyle:
                          TextStyle(fontSize: 15.0, color: Colors.black)),
                ),
                SizedBox(height: 50.0),
                SizedBox(
                  height: 50,
                  width: 150,
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
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.all(12.0)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)))),
                    child: const Text("Send",
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
