import 'package:marvel_wiki/models/series_summary.dart';

class SeriesList {
  const SeriesList({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });

  final int available;
  final String collectionURI;
  final List<SeriesSummary> items;
  final int returned;

  factory SeriesList.fromJson(Map<String, dynamic> json) {
    return SeriesList(
      available: json['available'],
      collectionURI: json['collectionURI'],
      items: (json['items'] as List<dynamic>)
          .map((e) => SeriesSummary.fromJson(e))
          .toList(),
      returned: json['returned'],
    );
  }
}
