import 'package:marvel_wiki/models/character/series_list.dart';
import 'package:marvel_wiki/models/comic_list.dart';
import 'package:marvel_wiki/models/event_list.dart';
import 'package:marvel_wiki/models/marvel_image.dart';
import 'package:marvel_wiki/models/story_list.dart';
import 'package:marvel_wiki/models/url.dart';

class Creator {
  final int id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String suffix;
  final String fullName;
  final String modified;
  final String resourceURI;
  final List<Url> urls;
  final MarvelImage thumbnail;
  final SeriesList series;
  final StoryList stories;
  final ComicList comics;
  final EventList events;

  Creator({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.suffix,
    required this.fullName,
    required this.modified,
    required this.resourceURI,
    required this.urls,
    required this.thumbnail,
    required this.series,
    required this.stories,
    required this.comics,
    required this.events,
  });

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      id: json['id'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      suffix: json['suffix'],
      fullName: json['fullName'],
      modified: json['modified'],
      resourceURI: json['resourceURI'],
      urls: (json['urls'] as List).map((i) => Url.fromJson(i)).toList(),
      thumbnail: MarvelImage.fromJson(json['thumbnail']),
      series: SeriesList.fromJson(json['series']),
      stories: StoryList.fromJson(json['stories']),
      comics: ComicList.fromJson(json['comics']),
      events: EventList.fromJson(json['events']),
    );
  }
}
