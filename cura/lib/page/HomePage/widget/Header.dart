import 'package:flutter/material.dart';

import '../../../model/AppTheme.dart';

class Header extends StatelessWidget {
  final String name;
  const Header({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      // width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight:
                Radius.circular(30.0) //                 <--- border radius here
            ),
        // border: Border.all(color: Colors.black),
        color: Colors.black.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello, ${name}",
                style: TextStyle(fontSize: AppTheme.text_fontSize_1),
              ),
              // Text(
              //   "hope you are doing well!",
              //   style: TextStyle(fontSize: AppTheme.text_fontSize_1),
              // ),
            ],
          ),
          Icon(
            Icons.person,
            size: 80,
          )
        ],
      ),
    );
  }
}
