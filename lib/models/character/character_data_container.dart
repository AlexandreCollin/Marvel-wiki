import 'package:marvel_wiki/models/character/character.dart';

class CharacterDataContainer {
  const CharacterDataContainer({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<Character> results;

  factory CharacterDataContainer.fromJson(Map<String, dynamic> json) {
    return CharacterDataContainer(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      results: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e))
          .toList(),
    );
  }
}
