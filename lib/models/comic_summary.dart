class ComicSummary {
  const ComicSummary({
    required this.resourceURI,
    required this.name,
  });

  final String resourceURI;
  final String name;

  factory ComicSummary.fromJson(Map<String, dynamic> json) {
    return ComicSummary(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }
}
