// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/Login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 8, 55, 102),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 300,
                        width: 600,
                        child: Image.asset(
                          "assets/img/Logo/Cura.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const TextField(
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    style: TextStyle(fontSize: 15.0),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                        ),
                        iconColor: Colors.white,
                        labelText: "Enter Your First Name",
                        labelStyle:
                            TextStyle(fontSize: 15.0, color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const TextField(
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    style: TextStyle(fontSize: 15.0),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                        ),
                        iconColor: Colors.white,
                        labelText: "Enter Your Second Name",
                        labelStyle:
                            TextStyle(fontSize: 15.0, color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const TextField(
                    keyboardType: TextInputType.phone,
                    obscureText: false,
                    style: TextStyle(fontSize: 15.0),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.phone_iphone,
                        ),
                        iconColor: Colors.white,
                        labelText: "Enter Your Phone Number",
                        labelStyle:
                            TextStyle(fontSize: 15.0, color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    style: TextStyle(fontSize: 15.0),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                        ),
                        iconColor: Colors.white,
                        labelText: "Enter Your E-mail",
                        labelStyle:
                            TextStyle(fontSize: 15.0, color: Colors.white)),
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
                        iconColor: Colors.white,
                        labelText: "Enter Your Password",
                        labelStyle:
                            TextStyle(fontSize: 15.0, color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(12.0)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)))),
                      child: const Text("Sign Up",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0)),
                    ),
                  ),
                  const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account ?",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
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
