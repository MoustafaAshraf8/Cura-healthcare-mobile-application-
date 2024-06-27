import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: const Divider(
        color: Colors.grey,
        thickness: 5.0,
        indent: 0.0,
        endIndent: 0.0,
      ),
    );
  }
}
