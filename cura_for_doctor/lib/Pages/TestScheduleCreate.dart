import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class TestScheduleCreate extends StatefulWidget {
  const TestScheduleCreate({super.key});

  @override
  State<TestScheduleCreate> createState() => _TestScheduleCreateState();
}

class _TestScheduleCreateState extends State<TestScheduleCreate> {
  DateTime? newDateTime;

  void showDateTimePicker() async {
    newDateTime = await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("press me"),
            ElevatedButton(
                onPressed: showDateTimePicker,
                child: Icon(Icons.calendar_month)),
            // (newDateTime != null) ? newDateTime : Text("null")
          ],
        ),
      ),
    ));
  }
}
