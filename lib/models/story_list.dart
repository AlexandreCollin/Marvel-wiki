import 'package:marvel_wiki/models/story_summary.dart';

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
      available: json['available'] as int,
      returned: json['returned'] as int,
      collectionURI: json['collectionURI'] as String,
      items: (json['items'] as List<dynamic>)
          .map((dynamic e) => StorySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
