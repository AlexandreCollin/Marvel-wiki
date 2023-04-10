class TextObject {
  TextObject({
    required this.type,
    required this.language,
    required this.text,
  });

  final String type;
  final String language;
  final String text;

  factory TextObject.fromJson(Map<String, dynamic> json) {
    return TextObject(
      type: json["type"],
      language: json["language"],
      text: json["text"],
    );
  }
}
