import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  String text;
  Function() onTap;
  Color color;
  CustomBtn(
      {super.key,
      required this.text,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
