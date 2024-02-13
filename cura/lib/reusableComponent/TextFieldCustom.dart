// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../model/AppTheme.dart';

class TextFieldCustom extends StatelessWidget {
  final String? placeholder;
  final bool obscure;
  const TextFieldCustom(
      {super.key,
      this.placeholder = "default placeholder",
      this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      cursorColor: AppTheme.text_color_light_primary,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          gapPadding: 80.0,
          borderSide:
              BorderSide(color: AppTheme.textField_Border_light, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          gapPadding: 80.0,
          borderSide:
              BorderSide(color: AppTheme.textField_Border_light, width: 2),
        ),
        hintText: placeholder,
        hintStyle: TextStyle(color: AppTheme.text_color_light_primary),
      ),
    );
  }
}
