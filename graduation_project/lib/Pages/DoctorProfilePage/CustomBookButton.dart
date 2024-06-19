import 'package:flutter/material.dart';

class CustomBookButton extends StatefulWidget {
  final Function reserverTimeSlotFunction;
  final bool reserving;
  final bool reserved;
  CustomBookButton(
      {super.key,
      required this.reserverTimeSlotFunction,
      required this.reserving,
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
                  : (widget.reserving == false)
                      ? Text("Book Appointment",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold))
                      : Text("reserving"),
            ),
          ),
        ),
      ),
    );
  }
}
