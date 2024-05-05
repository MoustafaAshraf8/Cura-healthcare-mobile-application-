import 'package:flutter/material.dart';

class CustomBookButton extends StatelessWidget {
  const CustomBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Material(
        color: const Color.fromARGB(255, 8, 55, 102),
        borderRadius: BorderRadius.circular(50.0),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 50,
            width: size.width,
            child: const Center(
              child: Text("Book Appointment",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }
}
