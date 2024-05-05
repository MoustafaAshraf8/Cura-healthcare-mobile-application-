class TimeSlot {
  final int timeslot_id;
  final String Start;
  final String End;

  const TimeSlot({
    required this.timeslot_id,
    required this.Start,
    required this.End,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "timeslot_id": int timeslot_id,
        "Start": String Start,
        "End": String End,
      } =>
        TimeSlot(
          timeslot_id: timeslot_id,
          Start: Start,
          End: End,
        ),
      _ => throw const FormatException('Failed to load Time Slot.'),
    };
  }

  @override
  String toString() {
    return "TimeSlot:{timeslot_id: ${timeslot_id}, Start: ${Start}, End: ${End}}";
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
