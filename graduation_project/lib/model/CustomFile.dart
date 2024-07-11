import 'package:graduation_project/model/CustomFileMetaData.dart';

class CustomFile {
  final String base64;
  final CustomFileMetaData metadata;
  CustomFile({
    required this.base64,
    required this.metadata,
  });

  factory CustomFile.fromJson(Map<String, dynamic> json) {
    try {
      return CustomFile(
          base64: (json["base64"]).toString(),
          metadata: CustomFileMetaData.fromJson(json["metadata"]));
    } catch (e) {
      print(e);
      throw const FormatException('Failed to load CustomFile.');
    }
  }

  // Object getCreateObject() {
  //   return {base64: this.base64, metadata: this.metadata.getCreateObject()};
  // }

  Map<String, dynamic> toJson() {
    return {'base64': base64, 'metadata': this.metadata.toJson()};
  }
}
