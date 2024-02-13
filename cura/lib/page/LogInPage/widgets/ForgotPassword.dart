import 'package:cura/model/AppTheme.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "forgot password?",
            style: TextStyle(fontSize: AppTheme.text_fontSize_0),
          )
        ],
      ),
    );
  }
}
