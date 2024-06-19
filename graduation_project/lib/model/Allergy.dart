import 'package:graduation_project/model/DoctorSchedule.dart';
import 'package:graduation_project/model/File.dart';

class Allergy {
  final String id;
  final String allergen;
  final String reaction;
  final String severity;
  final DateTime diagnosisDate;
  final String? notes;
  final List<File> file;
  Allergy(
      {required this.id,
      required this.allergen,
      required this.reaction,
      required this.severity,
      required this.diagnosisDate,
      this.notes,
      required this.file});

  factory Allergy.fromJson(Map<String, dynamic> json) {
    try {
      var fileList = json["file"] as List;
      List<File> files = fileList.map((file) {
        return File.fromJson(file.toString());
      }).toList();
      print(files.toString());
      return Allergy(
          id: (json["id"]).toString(),
          allergen: json["allergen"],
          reaction: json["reaction"],
          severity: json["severity"],
          diagnosisDate: DateTime.parse(json["diagnosisDate"]),
          notes: (json.containsKey('notes')) ? json["notes"] : null,
          file: files);
    } catch (e) {
      print(e);
      throw const FormatException('Failed to load Allergy.');
    }
  }
}
