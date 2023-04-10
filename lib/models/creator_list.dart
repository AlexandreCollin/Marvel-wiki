import 'package:marvel_wiki/models/creator_summary.dart';

class CreatorList {
  CreatorList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  final int available;
  final int returned;
  final String collectionURI;
  final List<CreatorSummary> items;

  factory CreatorList.fromJson(Map<String, dynamic> json) {
    return CreatorList(
      available: json['available'],
      returned: json['returned'],
      collectionURI: json['collectionURI'],
      items: (json['items'] as List<dynamic>)
          .map((e) => CreatorSummary.fromJson(e))
          .toList(),
    );
  }
}
