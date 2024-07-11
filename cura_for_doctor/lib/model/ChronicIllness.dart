import 'package:cura_for_doctor/model/File.dart';

class ChronicIllness {
  final String id;
  final String illness;
  final DateTime diagnosisDate;
  final String treatment;
  final String? notes;
  final List<File> file;
  ChronicIllness(
      {required this.id,
      required this.illness,
      required this.diagnosisDate,
      required this.treatment,
      this.notes,
      required this.file});

  factory ChronicIllness.fromJson(Map<String, dynamic> json) {
    try {
      var fileList = json["file"] as List;
      List<File> files = fileList.map((file) {
        return File.fromJson(file);
      }).toList();
      print(files.toString());
      return ChronicIllness(
          id: (json["id"]).toString(),
          illness: json["illness"],
          diagnosisDate: DateTime.parse(json["diagnosisDate"]),
          treatment: json["treatment"],
          notes: (json.containsKey('notes')) ? json["notes"] : null,
          file: files);
    } catch (e) {
      print(e);
      throw const FormatException('Failed to load ChronicIllness.');
    }
  }
}
