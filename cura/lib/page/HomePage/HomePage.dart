import 'package:cura/model/AppTheme.dart';
import 'package:flutter/material.dart';
import 'widget/Header.dart';
import 'widget/CardCustom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background_light_Primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Header(name: " mohamad"),
            CardCustom(),
            CardCustom()
          ],
        ),
      ),
    );
  }
}
