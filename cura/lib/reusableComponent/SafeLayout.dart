import 'package:cura/reusableComponent/AppBar_custom.dart';
import 'package:flutter/material.dart';
import '../model/AppTheme.dart';

class SafeLayout extends StatelessWidget {
  final Widget widget;
  const SafeLayout({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        // maintainBottomViewPadding: true,
        // minimum:
        //     const EdgeInsets.only(bottom: 10.0, top: 0.0, left: 0.0, right: 0.0),
        child: Scaffold(
            backgroundColor: AppTheme.background_light_Primary,
            //appBar: appBar(text: "Home Page", context: context),
            body: SafeArea(
                top: true,
                bottom: true,
                left: true,
                right: true,
                maintainBottomViewPadding: true,
                minimum: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    bottom: MediaQuery.of(context).size.height * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05),
                child: widget)));
  }
}
