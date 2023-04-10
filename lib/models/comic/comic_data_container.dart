import 'package:marvel_wiki/models/comic/comic.dart';

class ComicsDataContainer {
  ComicsDataContainer({
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
  final List<Comic> results;

  factory ComicsDataContainer.fromJson(Map<String, dynamic> json) {
    return ComicsDataContainer(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      results: (json['results'] as List)
          .map((comic) => Comic.fromJson(comic))
          .toList(),
    );
  }
}
