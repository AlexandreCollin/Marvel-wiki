import 'package:marvel_wiki/models/event_summary.dart';

class EventList {
  const EventList({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });

  final int available;
  final String collectionURI;
  final List<EventSummary> items;
  final int returned;

  factory EventList.fromJson(Map<String, dynamic> json) {
    return EventList(
      available: json['available'],
      collectionURI: json['collectionURI'],
      items: (json['items'] as List<dynamic>)
          .map((e) => EventSummary.fromJson(e))
          .toList(),
      returned: json['returned'],
    );
  }
}
