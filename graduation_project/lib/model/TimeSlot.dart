class TimeSlot {
  final int timeslot_id;
  final int? patient_id;
  final String Start;
  final String End;

  const TimeSlot({
    required this.timeslot_id,
    this.patient_id,
    required this.Start,
    required this.End,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    try {
      return TimeSlot(
          timeslot_id: json["timeslot_id"],
          patient_id:
              json.containsKey("patient_id") ? json["patient_id"] : null,
          Start: json["Start"],
          End: json["End"]);
    } catch (err) {
      throw err;
    }
  }

  @override
  String toString() {
    return "TimeSlot:{timeslot_id: ${timeslot_id}, patient_id: ${patient_id}, Start: ${Start}, End: ${End}}";
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
