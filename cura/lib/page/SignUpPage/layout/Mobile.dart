import 'package:cura/page/SignUpPage/getStep.dart';
import 'package:flutter/material.dart';

import '../../../reusableComponent/CustomButton.dart';
import '../../../reusableComponent/TextFormFieldCustom.dart';

class Mobile extends StatefulWidget {
  final TextEditingController emailTextFormFieldController;
  final TextEditingController passwordTextFormFieldController;
  final Function()? printValues;

  const Mobile(
      {super.key,
      required this.emailTextFormFieldController,
      required this.passwordTextFormFieldController,
      required this.printValues});

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  int steps = 2;
  int currentStep = 0;

  void prevStep() {
    if (currentStep > 0) {
      setState(() {
        print("------------");
        currentStep--;
      });
    }
  }

  void nextStep() {
    if (currentStep < steps - 1) {
      setState(() {
        print("+++++++++");
        currentStep++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: Center(
        //mainAxisAlignment: MainAxisAlignment.start,

        child: ListView(
            // physics: const NeverScrollableScrollPhysics(),
            primary: false,
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getStep(currentStep),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(btnText: "previous", onTap: prevStep),
                      SizedBox(
                        width: 20,
                      ),
                      CustomButton(btnText: "next", onTap: nextStep),
                    ],
                  ),

                  // CustomButton(btnText: "next", onTap: printValues),
                ],
              )
            ]),
      ),
    );
  }

  Widget getStep(int step) {
    List<Widget> steps = [
      Column(
        children: [
          TextFormFieldCustom(
            placeholder: "Name",
            password: false,
            textFieldController: widget.emailTextFormFieldController,
          ),
          TextFormFieldCustom(
            placeholder: "Email",
            password: false,
            textFieldController: widget.emailTextFormFieldController,
          ),
          TextFormFieldCustom(
            placeholder: "Password",
            password: false,
            textFieldController: widget.emailTextFormFieldController,
          ),
        ],
      ),
      Column(
        children: [
          TextFormFieldCustom(
            placeholder: "address",
            password: false,
            textFieldController: widget.emailTextFormFieldController,
          ),
          TextFormFieldCustom(
            placeholder: "city",
            password: false,
            textFieldController: widget.emailTextFormFieldController,
          ),
          TextFormFieldCustom(
            placeholder: "hospital",
            password: false,
            textFieldController: widget.emailTextFormFieldController,
          ),
        ],
      ),
    ];

    if (step < 0) {
      return steps[0];
    } else if (step > steps.length) {
      return steps[steps.length - 1];
    }
    return steps[step];
  }
}
