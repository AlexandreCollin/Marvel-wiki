class EventSummary {
  const EventSummary({
    required this.resourceURI,
    required this.name,
  });

  final String resourceURI;
  final String name;

  factory EventSummary.fromJson(Map<String, dynamic> json) {
    return EventSummary(
      resourceURI: json['resourceURI'] as String,
      name: json['name'] as String,
    );
  }
}
