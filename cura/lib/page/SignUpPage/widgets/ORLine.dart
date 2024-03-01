import 'package:flutter/material.dart';
import '../../../model/AppTheme.dart';

class ORLine extends StatelessWidget {
  const ORLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
            child: Divider(
          thickness: 1.5,
          color: AppTheme.text_color_light_primary,
        )),
        SizedBox(
          width: 30,
        ),
        Text("OR",
            style: TextStyle(
                fontSize: AppTheme.text_fontSize_1,
                color: AppTheme.text_color_light_secondary)),
        SizedBox(
          width: 30,
        ),
        Expanded(
            child: Divider(
          thickness: 1.5,
          color: AppTheme.text_color_light_primary,
        )),
      ]),
    );
  }
}
