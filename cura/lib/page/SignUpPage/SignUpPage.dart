import 'package:cura/page/SignUpPage/layout/Webpage.dart';
import 'package:cura/page/SignUpPage/layout/mobile.dart';
import 'package:cura/responsive/ResponsiveWidget.dart';
import 'package:cura/reusableComponent/AppBar_custom.dart';
import 'package:flutter/material.dart';
import '../../model/AppTheme.dart';
import '../../reusableComponent/TextFormFieldCustom.dart';
import '../../reusableComponent/CustomButton.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int currentStep = 0;
  final nameTextFormFieldController = TextEditingController();
  final emailTextFormFieldController = TextEditingController();
  final passwordTextFormFieldController = TextEditingController();

  void printValues() {
    late String name = nameTextFormFieldController.text;
    late String email = emailTextFormFieldController.text;
    late String password = passwordTextFormFieldController.text;
    print("email: ${email}");
    print("name: ${name}");
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
          appBar: appBar("SignUp"),
          body: SafeArea(
              top: true,
              bottom: true,
              left: true,
              right: true,
              maintainBottomViewPadding: true,
              minimum: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05),
              child: ResponsiveWidget(
                  mobile: Mobile(
                      emailTextFormFieldController:
                          emailTextFormFieldController,
                      passwordTextFormFieldController:
                          passwordTextFormFieldController,
                      printValues: printValues),
                  webpage: Webpage(
                      emailTextFormFieldController:
                          emailTextFormFieldController,
                      passwordTextFormFieldController:
                          passwordTextFormFieldController,
                      printValues: printValues)))),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text("Personal_Info"),
        content: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormFieldCustom(
              placeholder: "Name",
              password: false,
              textFieldController: emailTextFormFieldController,
            ),
            TextFormFieldCustom(
              placeholder: "Phone number",
              password: false,
              textFieldController: emailTextFormFieldController,
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text("email_password"),
        content: Column(
          children: [
            TextFormFieldCustom(
              placeholder: "Email",
              password: false,
              textFieldController: emailTextFormFieldController,
            ),
            //const SizedBox(height: 20),
            TextFormFieldCustom(
              placeholder: "Password",
              password: true,
              textFieldController: passwordTextFormFieldController,
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text("email_password"),
        content: Column(
          children: [
            TextFormFieldCustom(
              placeholder: "Email",
              password: false,
              textFieldController: emailTextFormFieldController,
            ),
            //const SizedBox(height: 20),
            TextFormFieldCustom(
              placeholder: "Password",
              password: true,
              textFieldController: passwordTextFormFieldController,
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        title: const Text("email_password"),
        content: Column(
          children: [
            TextFormFieldCustom(
              placeholder: "Email",
              password: false,
              textFieldController: emailTextFormFieldController,
            ),
            //const SizedBox(height: 20),
            TextFormFieldCustom(
              placeholder: "Password",
              password: true,
              textFieldController: passwordTextFormFieldController,
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        title: const Text("email_password"),
        content: Column(
          children: [
            TextFormFieldCustom(
              placeholder: "Email",
              password: false,
              textFieldController: emailTextFormFieldController,
            ),
            //const SizedBox(height: 20),
            TextFormFieldCustom(
              placeholder: "Password",
              password: true,
              textFieldController: passwordTextFormFieldController,
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 5 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 5,
        title: const Text("email_password"),
        content: Column(
          children: [
            TextFormFieldCustom(
              placeholder: "Email",
              password: false,
              textFieldController: emailTextFormFieldController,
            ),
            //const SizedBox(height: 20),
            TextFormFieldCustom(
              placeholder: "Password",
              password: true,
              textFieldController: passwordTextFormFieldController,
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 6 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 6,
        title: const Text("email_password"),
        content: Column(
          children: [
            TextFormFieldCustom(
              placeholder: "Email",
              password: false,
              textFieldController: emailTextFormFieldController,
            ),
            //const SizedBox(height: 20),
            TextFormFieldCustom(
              placeholder: "Password",
              password: true,
              textFieldController: passwordTextFormFieldController,
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 7 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 7,
        title: const Text("email_password"),
        content: Column(
          children: [
            TextFormFieldCustom(
              placeholder: "Email",
              password: false,
              textFieldController: emailTextFormFieldController,
            ),
            //const SizedBox(height: 20),
            TextFormFieldCustom(
              placeholder: "Password",
              password: true,
              textFieldController: passwordTextFormFieldController,
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 8 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 8,
        title: const Text("email_password"),
        content: Column(
          children: [
            TextFormFieldCustom(
              placeholder: "Email",
              password: false,
              textFieldController: emailTextFormFieldController,
            ),
            //const SizedBox(height: 20),
            TextFormFieldCustom(
              placeholder: "Password",
              password: true,
              textFieldController: passwordTextFormFieldController,
            ),
          ],
        ),
      ),
    ];
  }
}
