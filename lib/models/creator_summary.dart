class CreatorSummary {
  CreatorSummary({
    required this.resourceURI,
    required this.name,
    required this.role,
  });

  final String resourceURI;
  final String name;
  final String role;

  factory CreatorSummary.fromJson(Map<String, dynamic> json) {
    return CreatorSummary(
      resourceURI: json['resourceURI'],
      name: json['name'],
      role: json['role'],
    );
  }
}
