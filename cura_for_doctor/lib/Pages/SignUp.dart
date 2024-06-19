// ignore_for_file: file_names
import 'package:cura_for_doctor/api/CreateDoctor.dart';
import './Login.dart';
import '../Contants/CustomShapes/CustomLoading/CustomLoading.dart';
import 'package:flutter/material.dart';
import '../class/AppRouter.dart';
import '../model/Doctor.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

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

  void signUpRequest() async {
    Doctor doctor = Doctor(
        FirstName: firstNameTextEditingController.value.text,
        LastName: lastNameTextEditingController.value.text,
        Email: emailTextEditingController.value.text,
        Password: passwordTextEditingController.value.text,
        PhoneNumber: phoneNumberTextEditingController.value.text);
    changeRoute =
        await createDoctor(doctor: doctor, revertLoading: revertLoading);
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
                          controller: firstNameTextEditingController,
                          onChanged: (value) => {print(value)},
                          keyboardType: TextInputType.name,
                          obscureText: false,
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                              ),
                              iconColor: Colors.white,
                              labelText: "Enter Your First Name",
                              labelStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: lastNameTextEditingController,
                          keyboardType: TextInputType.name,
                          obscureText: false,
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                              ),
                              iconColor: Colors.white,
                              labelText: "Enter Your Last Name",
                              labelStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: phoneNumberTextEditingController,
                          keyboardType: TextInputType.phone,
                          obscureText: false,
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.phone_iphone,
                              ),
                              iconColor: Colors.white,
                              labelText: "Enter Your Phone Number",
                              labelStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
                        ),
                        const SizedBox(
                          height: 10.0,
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
                              labelText: "Enter Your Email",
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
                        const SizedBox(
                          height: 30.0,
                        ),
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: signUpRequest,
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
                            child: const Text("Sign Up",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0)),
                          ),
                        ),
                        const SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account ?",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
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
