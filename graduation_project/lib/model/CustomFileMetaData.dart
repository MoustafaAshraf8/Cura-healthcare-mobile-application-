class CustomFileMetaData {
  final String filename;
  final String encoding;
  final String mimeType;
  CustomFileMetaData({
    required this.filename,
    required this.encoding,
    required this.mimeType,
  });

  factory CustomFileMetaData.fromJson(Map<String, dynamic> json) {
    try {
      return CustomFileMetaData(
          filename: (json["filename"]).toString(),
          encoding: json["encoding"],
          mimeType: json['mimetype']);
    } catch (e) {
      print(e);
      throw const FormatException('Failed to load CustomFileMetaData.');
    }
  }

  Object getCreateObject() {
    return {
      filename: this.filename,
      encoding: this.encoding,
      mimeType: this.mimeType
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'filename': filename,
      'encoding': encoding,
      'mimeType': mimeType,
    };
  }
}
