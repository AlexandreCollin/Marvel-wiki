import 'package:marvel_wiki/models/creator/creator.dart';

class CreatorDataContainer {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<Creator> results;

  CreatorDataContainer({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory CreatorDataContainer.fromJson(Map<String, dynamic> json) {
    return CreatorDataContainer(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      results:
          (json['results'] as List).map((i) => Creator.fromJson(i)).toList(),
    );
  }
}
