import 'package:flutter/material.dart';
import '../../model/AppTheme.dart';
import '../../reusableComponent/TextFormFieldCustom.dart';
import './widgets/ForgotPassword.dart';
import '../../reusableComponent/CustomButton.dart';
import './widgets/ORLine.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
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
                  bottom: 20.0, top: 20.0, left: 10.0, right: 10.0),
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
                            "Welcome back",
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
                              ),
                              //const SizedBox(height: 20),
                              TextFormFieldCustom(
                                placeholder: "Password",
                              ),
                              //const SizedBox(height: 10),
                              ForgotPassword(),
                              CustomButton(
                                btnText: "login",
                                onTap: () => {print("test")},
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
