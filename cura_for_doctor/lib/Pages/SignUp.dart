// ignore_for_file: file_names
import 'package:cura_for_doctor/Pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController firstNameTextEditingController =
      TextEditingController();

  final TextEditingController lastNameTextEditingController =
      TextEditingController();

  final TextEditingController emailTextEditingController =
      TextEditingController();

  final TextEditingController passwordTextEditingController =
      TextEditingController();

  final TextEditingController phoneNumberTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 8, 55, 102),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(45.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                    controller: firstNameTextEditingController,
                    onChanged: (value) => {print(value)},
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    style: TextStyle(fontSize: 13.sp),
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.person,
                        ),
                        iconColor: Colors.white,
                        labelText: "Enter Your First Name",
                        labelStyle:
                            TextStyle(fontSize: 13.sp, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  TextField(
                    controller: lastNameTextEditingController,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    style: TextStyle(fontSize: 13.sp),
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.person,
                        ),
                        iconColor: Colors.white,
                        labelText: "Enter Your Last Name",
                        labelStyle:
                            TextStyle(fontSize: 13.sp, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  TextField(
                    controller: phoneNumberTextEditingController,
                    keyboardType: TextInputType.phone,
                    obscureText: false,
                    style: TextStyle(fontSize: 13.sp),
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.phone_iphone,
                        ),
                        iconColor: Colors.white,
                        labelText: "Enter Your Phone Number",
                        labelStyle:
                            TextStyle(fontSize: 13.sp, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 8.sp,
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
                        labelText: "Enter Your Email",
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
                  SizedBox(
                    height: 10.sp,
                  ),
                  SizedBox(
                    height: 42.sp,
                    width: 140.sp,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          padding:
                              MaterialStatePropertyAll(EdgeInsets.all(12.sp)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)))),
                      onPressed: () {},
                      child: Text("Sign Up",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp)),
                    ),
                  ),
                  const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                          child: Text(
                            "Sign In",
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
    );
  }
}
