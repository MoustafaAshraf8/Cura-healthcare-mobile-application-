import 'package:flutter/material.dart';

import '../../../reusableComponent/CustomButton.dart';
import '../../../reusableComponent/TextFormFieldCustom.dart';

class Webpage extends StatelessWidget {
  final TextEditingController emailTextFormFieldController;
  final TextEditingController passwordTextFormFieldController;
  final Function()? printValues;

  const Webpage(
      {super.key,
      required this.emailTextFormFieldController,
      required this.passwordTextFormFieldController,
      required this.printValues});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15),
      child: Center(
        //mainAxisAlignment: MainAxisAlignment.start,

        child: ListView(
            // physics: const NeverScrollableScrollPhysics(),
            primary: false,
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(btnText: "next", onTap: printValues),
                      SizedBox(
                        width: 20,
                      ),
                      CustomButton(btnText: "next", onTap: printValues),
                    ],
                  ),

                  // CustomButton(btnText: "next", onTap: printValues),
                ],
              )
            ]),
        //     child: Stepper(
        //   connectorColor: MaterialStateColor.resolveWith(
        //       (states) => AppTheme.background_light_Secondart),
        //   //margin: EdgeInsets.all(20),
        //   //stepIconBuilder: ,
        //   elevation: 20.0,
        //   type: StepperType.vertical,
        //   currentStep: currentStep,
        //   onStepCancel: () => currentStep == 0
        //       ? null
        //       : setState(() {
        //           currentStep -= 1;
        //         }),
        //   onStepContinue: () {
        //     bool isLastStep = (currentStep == getSteps().length - 1);
        //     if (isLastStep) {
        //       //Do something with this information
        //     } else {
        //       setState(() {
        //         currentStep += 1;
        //       });
        //     }
        //   },
        //   onStepTapped: (step) => setState(() {
        //     currentStep = step;
        //   }),
        //   steps: getSteps(),
        // )
      ),
    );
  }
}
