import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:cura_for_doctor/Pages/Login.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        whiteBackArrow: false,
        title: Text("Reset Password",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image:
                      AssetImage("assets/img/ForgetPassword/NewPassword.png")),
              const SizedBox(height: 20.0),
              Container(
                width: width,
                child: const Text(
                  "Your New Password Must Be Different From Previously Used Password!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: height * 0.05),
              const TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(fontSize: 15.0),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                    ),
                    iconColor: Colors.black,
                    labelText: "Enter New Password",
                    labelStyle: TextStyle(fontSize: 15.0, color: Colors.black)),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(fontSize: 15.0),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                    ),
                    iconColor: Colors.black,
                    labelText: "Confirm New Password",
                    labelStyle: TextStyle(fontSize: 15.0, color: Colors.black)),
              ),
              const SizedBox(height: 50.0),
              SizedBox(
                height: 50,
                width: 150,
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
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(12.0)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)))),
                  child: const Text("Save",
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}