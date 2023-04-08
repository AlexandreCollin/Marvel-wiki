import 'package:marvel_wiki/models/comic_list.dart';
import 'package:marvel_wiki/models/event_list.dart';
import 'package:marvel_wiki/models/marvel_image.dart';
import 'package:marvel_wiki/models/series_list.dart';
import 'package:marvel_wiki/models/story_list.dart';
import 'package:marvel_wiki/models/url.dart';

class Character {
  const Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.resourceURI,
    required this.urls,
    required this.thumbnail,
    required this.comics,
    required this.stories,
    required this.events,
    required this.series,
  });

  final int id;
  final String name;
  final String description;
  final DateTime modified;
  final String resourceURI;
  final List<Url> urls;
  final MarvelImage thumbnail;
  final ComicList comics;
  final StoryList stories;
  final EventList events;
  final SeriesList series;

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      modified: DateTime.parse(json['modified']),
      resourceURI: json['resourceURI'],
      urls: (json['urls'] as List<dynamic>).map((e) {
        return Url.fromJson(e);
      }).toList(),
      thumbnail: MarvelImage.fromJson(json['thumbnail']),
      comics: ComicList.fromJson(json['comics']),
      stories: StoryList.fromJson(json['stories']),
      events: EventList.fromJson(json['events']),
      series: SeriesList.fromJson(json['series']),
    );
  }
}
