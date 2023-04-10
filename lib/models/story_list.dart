import 'package:marvel_wiki/models/character/story_summary.dart';

class StoryList {
  const StoryList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  final int available;
  final int returned;
  final String collectionURI;
  final List<StorySummary> items;

  factory StoryList.fromJson(Map<String, dynamic> json) {
    return StoryList(
      available: json['available'],
      returned: json['returned'],
      collectionURI: json['collectionURI'],
      items: (json['items'] as List<dynamic>)
          .map((e) => StorySummary.fromJson(e))
          .toList(),
    );
  }
}
