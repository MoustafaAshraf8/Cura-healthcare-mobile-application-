class TimeSlot {
  final int? timeslot_id;
  final int? schedule_id;
  final int? patient_id;
  final String Start;
  final String End;

  const TimeSlot({
    required this.timeslot_id,
    required this.schedule_id,
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
          schedule_id: json["schedule_id"],
          Start: json["Start"],
          End: json["End"]);
    } catch (err) {
      throw err;
    }
  }

  @override
  String toString() {
    return "TimeSlot:{timeslot_id: ${timeslot_id}, schedule_id: ${schedule_id}, patient_id: ${patient_id}, Start: ${Start}, End: ${End}}";
  }

  Map<String, dynamic> toJson() {
    var obj = {
      "timeslot_id": timeslot_id,
      "schedule_id": schedule_id,
      "patient_id": patient_id,
      "Start": Start,
      "End": End,
    };
    return obj;
  }

  Map<String, dynamic> createBody() {
    return {Start: this.Start, End: this.End};
  }
}
