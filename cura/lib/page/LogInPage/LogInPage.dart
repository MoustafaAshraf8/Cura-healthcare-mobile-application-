import 'package:cura/page/LogInPage/widgets/ORLine.dart';
import 'package:flutter/material.dart';
import '../../model/AppTheme.dart';
import '../../reusableComponent/TextFormFieldCustom.dart';
import './widgets/ForgotPassword.dart';
import '../../reusableComponent/CustomButton.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final emailTextFormFieldController = TextEditingController();
  final passwordTextFormFieldController = TextEditingController();

  void printValues() {
    late String email = emailTextFormFieldController.text;
    late String password = passwordTextFormFieldController.text;
    print("email: ${email}");
    print("password: ${password}");
  }

  @override
  Widget build(BuildContext context) {
    // SafeArea for the system components (ex: Android status bar)
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      maintainBottomViewPadding: true,
      // minimum:
      //     const EdgeInsets.only(bottom: 10.0, top: 0.0, left: 0.0, right: 0.0),
      child: Scaffold(
          backgroundColor: AppTheme.background_light_Primary,
          body: SafeArea(
              top: true,
              bottom: true,
              left: true,
              right: true,
              maintainBottomViewPadding: true,
              minimum: const EdgeInsets.only(
                  bottom: 20.0, top: 40.0, left: 10.0, right: 10.0),
              child: Center(
                child: ListView(
                    //physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 50),
                          const Icon(Icons.lock, size: 100),
                          const SizedBox(height: 20),
                          Text(
                            "Welcome back!",
                            style: TextStyle(
                                color: AppTheme.text_color_light_primary,
                                fontSize: AppTheme.text_fontSize_3),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(children: [
                              TextFormFieldCustom(
                                placeholder: "Email",
                                password: false,
                                textFieldController:
                                    emailTextFormFieldController,
                              ),
                              //const SizedBox(height: 20),
                              TextFormFieldCustom(
                                placeholder: "Password",
                                password: true,
                                textFieldController:
                                    passwordTextFormFieldController,
                              ),
                              //const SizedBox(height: 10),
                              ForgotPassword(),
                              CustomButton(
                                btnText: "login",
                                onTap: printValues,
                              ),
                              ORLine(),
                              CustomButton(
                                btnText: "signup",
                                onTap: () => {print("test")},
                              ),
                            ]),
                          )
                        ],
                      )
                    ]),
              ))),
    );
  }
}
