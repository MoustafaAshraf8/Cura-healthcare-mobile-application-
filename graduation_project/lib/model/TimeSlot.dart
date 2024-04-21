class TimeSlot {
  final int timeslot_id;
  final String Date;
  final String Start;
  final String End;

  const TimeSlot({
    required this.timeslot_id,
    required this.Date,
    required this.Start,
    required this.End,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    print(json['Date']);
    return switch (json) {
      {
        "timeslot_id": int timeslot_id,
        "Date": String Date,
        "Start": String Start,
        "End": String End,
      } =>
        TimeSlot(
          timeslot_id: timeslot_id,
          Date: Date,
          Start: Start,
          End: End,
        ),
      _ => throw const FormatException('Failed to load Time Slot.'),
    };
  }

  // Map<String, dynamic> toJson() {
  //   var obj = {
  //     "timeslot_id": timeslot_id,
  //     "Date": Date,
  //     "Start": Start,
  //     "End": End,
  //   };
  //   return obj;
  // }
}
