import 'package:flutter/material.dart';
import '../model/AppTheme.dart';

PreferredSizeWidget? appBar(
    {required String text, required BuildContext context}) {
  return AppBar(
    primary: true,
    // toolbarHeight: MediaQuery.of(context).size.height * 0.08,
    toolbarHeight: 60,
    title: Text(
      text,
      style: TextStyle(
          color: AppTheme.text_color_light_secondary,
          fontSize: AppTheme.text_fontSize_1,
          fontWeight: AppTheme.text_fontWeight_1),
    ),
    centerTitle: true,
    leading: IconButton(
        icon: Icon(Icons.menu),
        iconSize: 40,
        color: AppTheme.text_color_light_secondary,
        onPressed: () {}),
    backgroundColor: AppTheme.text_color_light_primary,
  );
}
