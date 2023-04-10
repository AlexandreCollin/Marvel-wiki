class ComicDate {
  ComicDate({
    required this.type,
    required this.date,
  });

  final String type;
  final DateTime date;

  factory ComicDate.fromJson(Map<String, dynamic> json) {
    return ComicDate(
      type: json['type'],
      date: DateTime.parse(json['date']),
    );
  }
}
