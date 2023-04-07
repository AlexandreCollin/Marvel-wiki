class SeriesSummary {
  const SeriesSummary({
    required this.resourceURI,
    required this.name,
  });

  final String resourceURI;
  final String name;

  factory SeriesSummary.fromJson(Map<String, dynamic> json) {
    return SeriesSummary(
      resourceURI: json['resourceURI'] as String,
      name: json['name'] as String,
    );
  }
}
