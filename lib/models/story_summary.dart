class StorySummary {
  const StorySummary({
    required this.resourceURI,
    required this.name,
    required this.type,
  });

  final String resourceURI;
  final String name;
  final String type;

  factory StorySummary.fromJson(Map<String, dynamic> json) {
    return StorySummary(
      resourceURI: json['resourceURI'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
    );
  }
}
