import 'package:marvel_wiki/models/comic_summary.dart';

class ComicList {
  const ComicList({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });

  final int available;
  final int returned;
  final String collectionURI;
  final List<ComicSummary> items;

  factory ComicList.fromJson(Map<String, dynamic> json) {
    return ComicList(
      available: json['available'],
      returned: json['returned'],
      collectionURI: json['collectionURI'],
      items: (json['items'] as List<dynamic>)
          .map((e) => ComicSummary.fromJson(e))
          .toList(),
    );
  }
}
