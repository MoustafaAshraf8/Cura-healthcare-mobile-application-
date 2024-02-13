import 'package:flutter/material.dart';
import '../model/AppTheme.dart';

class TextFormFieldCustom extends StatefulWidget {
  final String placeholder;
  const TextFormFieldCustom({super.key, this.placeholder = "placeholder"});

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.all(0),
      child: TextFormField(
        validator: (value) {
          print(value);
          if (value == null ||
              value.isEmpty ||
              !value.contains('@') ||
              !value.contains('.')) {
            return 'Invalid Email';
          }
          return null;
        },
        keyboardType: TextInputType.text,
        cursorColor: AppTheme.textField_Border_light,
        decoration: InputDecoration(
          labelText: widget.placeholder,
          labelStyle: TextStyle(
              color: AppTheme.text_color_light_primary,
              fontSize: AppTheme.text_fontSize_1,
              fontWeight: AppTheme.text_fontWeight_1),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppTheme.textField_borderRadius,
            gapPadding: 80.0,
            borderSide: AppTheme.textFormField_enabled_borderSide,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppTheme.textField_borderRadius,
            gapPadding: 80.0,
            borderSide: AppTheme.textFormField_focused_borderSide,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: AppTheme.textField_borderRadius,
            gapPadding: 80.0,
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
