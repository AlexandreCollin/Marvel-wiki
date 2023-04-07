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
      available: json['available'] as int,
      collectionURI: json['collectionURI'] as String,
      items: (json['items'] as List<dynamic>)
          .map((dynamic e) => EventSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      returned: json['returned'] as int,
    );
  }
}
