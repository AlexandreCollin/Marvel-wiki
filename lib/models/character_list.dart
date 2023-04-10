import 'package:marvel_wiki/models/character_summary.dart';

class CharacterList {
  CharacterList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  final int available;
  final int returned;
  final String collectionURI;
  final List<CharacterSummary> items;

  factory CharacterList.fromJson(Map<String, dynamic> json) {
    return CharacterList(
      available: json['available'],
      returned: json['returned'],
      collectionURI: json['collectionURI'],
      items: (json['items'] as List<dynamic>)
          .map((e) => CharacterSummary.fromJson(e))
          .toList(),
    );
  }
}
