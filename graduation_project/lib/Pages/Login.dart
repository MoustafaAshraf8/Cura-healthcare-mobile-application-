// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/ForgetPassword/ForgetPassword.dart';
import "../class/AppRouter.dart";
import 'package:graduation_project/Contants/CustomShapes/CustomLoading/CustomLoading.dart';
import 'package:graduation_project/Pages/SignUp.dart';
import 'package:graduation_project/model/User.dart';
import '../api/PatientSignIn.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  var loading = false;
  var changeRoute = false;
  void changeRouteFunction() {
    Navigator.of(context).pushReplacementNamed(AppRouter.getHomeRoute());
  }

  void revertLoading() {
    setState(() {
      loading = !loading;
    });
  }

  void signin() async {
    User user = new User(
        Email: emailTextEditingController.value.text,
        Password: passwordTextEditingController.value.text);
    changeRoute = await signIn(user: user, revertLoading: revertLoading);
    if (changeRoute) {
      changeRouteFunction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return (loading == true)
        ? CustomLoading()
        : SafeArea(
            child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 8, 55, 102),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
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
                        TextField(
                          controller: emailTextEditingController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                              ),
                              iconColor: Colors.white,
                              labelText: "Enter Your E-mail",
                              labelStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: passwordTextEditingController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                              ),
                              iconColor: Colors.white,
                              labelText: "Enter Your Password",
                              labelStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
                        ),
                        Container(
                          height: 40,
                          alignment: Alignment.topRight,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgetPassword()),
                                );
                              },
                              child: Text(
                                "Forget Password ?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        //const SizedBox(
                        // height: 30.0,
                        //),
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            // onPressed: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => Home()),
                            //   );
                            // },
                            onPressed: signin,
                            style: ButtonStyle(
                                alignment: Alignment.center,
                                backgroundColor: const MaterialStatePropertyAll(
                                    Colors.black),
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.all(12.0)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)))),
                            child: const Text("Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0)),
                          ),
                        ),
                        const SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Do not have an account ?",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()),
                                  );
                                },
                                child: const Text(
                                  "Sign Up",
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
