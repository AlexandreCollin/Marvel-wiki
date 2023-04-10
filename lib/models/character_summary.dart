class CharacterSummary {
  CharacterSummary({
    required this.resourceURI,
    required this.name,
    required this.role,
  });

  final String resourceURI;
  final String name;
  final String? role;

  factory CharacterSummary.fromJson(Map<String, dynamic> json) {
    return CharacterSummary(
      resourceURI: json["resourceURI"],
      name: json["name"],
      role: json["role"],
    );
  }
}
