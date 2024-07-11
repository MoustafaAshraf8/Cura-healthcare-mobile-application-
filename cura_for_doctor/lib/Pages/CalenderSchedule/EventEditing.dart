import 'package:cura_for_doctor/Pages/CalenderSchedule/Event/Event.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/Event/EventProvider.dart';
import 'package:cura_for_doctor/Pages/CalenderSchedule/Utils/Utils.dart';
import 'package:cura_for_doctor/class/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../api/addSchedule.dart';

class EventEditing extends StatefulWidget {
  const EventEditing({super.key, this.event});
  final Event? event;

  @override
  State<EventEditing> createState() => _EventEditingState();
}

class _EventEditingState extends State<EventEditing> {
  final _formKey = GlobalKey<FormState>();
  // final titleController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;

  bool loading = false;
  void revertLoading() {
    setState(() {
      loading = !loading;
    });
  }

  Future SaveFormToDataSource() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final event = Event(
          title: "",
          from: fromDate,
          to: toDate,
          description: "Description",
          isAllDay: false);
      print("at notifying...");

      Navigator.of(context).pop();
    }
  }

  void createTimeSlot() async {
    String date = DateFormat('yyyy-MM-dd').format(toDate);
    // String time =
    String fromTime = DateFormat('hh:mm:ss').format(fromDate);
    String toTime = DateFormat('hh:mm:ss').format(toDate);
    bool result = await addSchedule(
        Date: date, Start: fromTime, End: toTime, revertLoading: revertLoading);

    if (result == true) {
      final event = Event(
          title: "",
          from: fromDate,
          to: toDate,
          description: "Description",
          isAllDay: false);
      final provider = Provider.of<EventProvider>(context, listen: false);
      provider.addEvent(event);
      // provider.not

      print("at notifying...");
      Navigator.of(context).pop();
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  List<Widget> buildEditingActions() => [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: createTimeSlot,
          icon: const Icon(Icons.done),
          label: const Text("SAVE"),
        ),
      ];

  @override
  void initState() {
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 2));
    }
  }

  @override
  void dispose() {
    // titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.customGold,
        leading: const CloseButton(),
        actions: buildEditingActions(),
      ),
      body: ModalProgressHUD(
        inAsyncCall: loading,
        opacity: 0.1,
        blur: 5,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12.sp),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                // TextFormField(
                //   style: TextStyle(fontSize: 20.sp),
                //   decoration: const InputDecoration(
                //     border: UnderlineInputBorder(),
                //     hintText: "Add Title",
                //   ),
                //   onFieldSubmitted: (_) => SaveForm,
                //   validator: (title) => title != null && title.isEmpty
                //       ? "Title cannot be empty"
                //       : null,
                //   controller: titleController,
                // ),
                SizedBox(height: height * 0.03),
                //From & To Date

                Column(
                  children: [
                    buildHeader(
                        header: "FROM",
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: buildDropdownField(
                                text: Utils.toDate(fromDate),
                                onClicked: () => pickFromDateTime(
                                    pickFromDate: true, pickDate: true),
                              ),
                            ),
                            Expanded(
                              child: buildDropdownField(
                                text: Utils.toTime(fromDate),
                                onClicked: () => pickFromDateTime(
                                    pickFromDate: false, pickDate: false),
                              ),
                            ),
                          ],
                        )),
                    buildHeader(
                        header: "To",
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: buildDropdownField(
                                text: Utils.toDate(toDate),
                                onClicked: () => pickToDateTime(
                                    pickToDate: true, pickDate: true),
                              ),
                            ),
                            Expanded(
                              child: buildDropdownField(
                                text: Utils.toTime(toDate),
                                onClicked: () => pickToDateTime(
                                    pickToDate: true, pickDate: false),
                              ),
                            ),
                          ],
                        )),
                    InkWell(
                      onTap: () => {print(toDate)},
                      child: Text("press me"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Future pickFromDateTime(
      {required bool pickDate, required bool pickFromDate}) async {
    final date = await pickDateTime(fromDate,
        pickDate: pickDate, firstDate: pickDate ? fromDate : null);

    if (date == null) return;
    setState(() {
      fromDate = date;
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    });
  }

  Future pickToDateTime(
      {required bool pickDate, required bool pickToDate}) async {
    final date = await pickDateTime(toDate,
        pickDate: pickDate, firstDate: pickDate ? fromDate : null);

    if (date == null) return;
    setState(() {
      fromDate = DateTime(
          date.year, date.month, date.day, fromDate.hour, fromDate.minute);
      toDate = date;
    });
  }

  Future<DateTime?> pickDateTime(
    DateTime initialdate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialdate,
        firstDate: firstDate ?? DateTime(2015, 8),
        lastDate: DateTime(2101),
      );

      if (date == null) return null;

      final time =
          Duration(hours: initialdate.hour, minutes: initialdate.minute);

      return date.add(time);
    } else {
      final selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialdate),
      );

      if (selectedTime == null) return null;

      final date =
          DateTime(initialdate.year, initialdate.month, initialdate.day);
      final time =
          Duration(hours: selectedTime.hour, minutes: selectedTime.minute);

      return date.add(time);
    }
  }

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          child,
        ],
      );
}
