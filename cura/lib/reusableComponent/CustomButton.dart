import 'package:cura/model/AppTheme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function()? onTap;

  const CustomButton({super.key, required this.btnText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
          decoration: BoxDecoration(
              color: AppTheme.text_color_light_primary,
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              btnText,
              style: TextStyle(
                  color: AppTheme.text_color_light_secondary,
                  fontWeight: AppTheme.text_fontWeight_1,
                  fontSize: AppTheme.text_fontSize_1),
            ),
          ),
        ),
      ),
    );
  }
}
