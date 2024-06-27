import 'package:flutter/material.dart';
import 'package:graduation_project/model/Patient.dart';
import 'package:graduation_project/model/TimeSlot.dart';

class CustomBookButton extends StatefulWidget {
  final Function reserverTimeSlotFunction;
  final bool disable;
  final bool reserved;
  // final TimeSlot selectedTimeSlot;
  // final Patient patient;
  CustomBookButton(
      {super.key,
      // required this.selectedTimeSlot,
      // required this.patient,
      required this.reserverTimeSlotFunction,
      required this.disable,
      required this.reserved});

  @override
  State<CustomBookButton> createState() => _CustomBookButtonState();
}

class _CustomBookButtonState extends State<CustomBookButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Material(
        color:
            (widget.reserved) ? Colors.green : Color.fromARGB(255, 8, 55, 102),
        borderRadius: BorderRadius.circular(50.0),
        child: GestureDetector(
          // onTap: () {},
          onTap: () {
            // if (widget.disable == false) widget.reserverTimeSlotFunction();
            widget.reserverTimeSlotFunction();
          },
          child: Container(
            height: 50,
            width: size.width,
            child: Center(
                child: (widget.reserved)
                    ? Icon(
                        Icons.done_outline_rounded,
                        size: 40.0,
                        color: Colors.black,
                      )
                    : Text("Book Appointment",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold))),
          ),
        ),
      ),
    );
  }
}
