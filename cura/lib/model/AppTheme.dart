// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

class TextTheme {
  static Color text_Light_Primary = Colors.black;
}

class AppTheme {
  // app
  // static Color background_light_Primary = const Color(0xff0174BE); // default
  static Color background_light_Primary = Color.fromARGB(255, 37, 130, 188);
  // static Color background_light_Primary = Colors.white;
  // static Color background_light_Secondart = const Color(0xffF6B17A); // default
  static Color background_light_Secondart =
      Color.fromARGB(255, 247, 169, 106); // default
  static Color background_light_Third = Colors.orange;

  // text
  static Color text_color_light_primary = Colors.black;
  static Color text_color_light_secondary = Colors.white;

  // text font
  static double text_fontSize_0 = 15.0;
  static double text_fontSize_1 = 20.0;
  static double text_fontSize_2 = 30.0;
  static double text_fontSize_3 = 40.0;
  static FontWeight text_fontWeight_1 = FontWeight.w400;

  // textfield
  static Color textField_Border_light = Colors.black;
  static Color textField_Border_light_focused = const Color(0xffF6B17A);
  static Color textField_Hint_light = Colors.black;

  static BorderRadius textField_borderRadius =
      BorderRadius.all(Radius.circular(20));

  static BorderSide textFormField_enabled_borderSide = BorderSide(
    color: AppTheme.textField_Border_light,
    width: 1.0,
    style: BorderStyle.solid,
  );
  static BorderSide textFormField_focused_borderSide = BorderSide(
      color: AppTheme.textField_Border_light_focused,
      width: 1.0,
      style: BorderStyle.solid,
      strokeAlign: 1.0);
}
