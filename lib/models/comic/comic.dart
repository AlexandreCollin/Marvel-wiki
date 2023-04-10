import 'package:marvel_wiki/models/character/comic_summary.dart';
import 'package:marvel_wiki/models/character/series_summary.dart';
import 'package:marvel_wiki/models/character_list.dart';
import 'package:marvel_wiki/models/comic/comic_date.dart';
import 'package:marvel_wiki/models/comic/comic_price.dart';
import 'package:marvel_wiki/models/creator_list.dart';
import 'package:marvel_wiki/models/event_list.dart';
import 'package:marvel_wiki/models/marvel_image.dart';
import 'package:marvel_wiki/models/story_list.dart';
import 'package:marvel_wiki/models/text_object.dart';
import 'package:marvel_wiki/models/url.dart';

class Comic {
  Comic({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.isbn,
    required this.upc,
    required this.diamondCode,
    required this.ean,
    required this.issn,
    required this.format,
    required this.pageCount,
    required this.textObjects,
    required this.resourceURI,
    required this.urls,
    required this.series,
    required this.variants,
    required this.collections,
    required this.collectedIssues,
    required this.dates,
    required this.prices,
    required this.thumbnail,
    required this.images,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.events,
  });

  final int id;
  final int digitalId;
  final String title;
  final double issueNumber;
  final String variantDescription;
  final String? description;
  final DateTime modified;
  final String isbn;
  final String upc;
  final String diamondCode;
  final String ean;
  final String issn;
  final String format;
  final int pageCount;
  final List<TextObject> textObjects;
  final String resourceURI;
  final List<Url> urls;
  final SeriesSummary series;
  final List<ComicSummary> variants;
  final List<ComicSummary> collections;
  final List<ComicSummary> collectedIssues;
  final List<ComicDate> dates;
  final List<ComicPrice> prices;
  final MarvelImage thumbnail;
  final List<MarvelImage> images;
  final CreatorList creators;
  final CharacterList characters;
  final StoryList stories;
  final EventList events;

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      id: json['id'],
      digitalId: json['digitalId'],
      title: json['title'],
      issueNumber: double.parse(json['issueNumber'].toString()),
      variantDescription: json['variantDescription'],
      description: json['description'],
      modified: DateTime.parse(json['modified']),
      isbn: json['isbn'],
      upc: json['upc'],
      diamondCode: json['diamondCode'],
      ean: json['ean'],
      issn: json['issn'],
      format: json['format'],
      pageCount: json['pageCount'],
      textObjects: (json['textObjects'] as List<dynamic>)
          .map((e) => TextObject.fromJson(e))
          .toList(),
      resourceURI: json['resourceURI'],
      urls:
          (json['urls'] as List<dynamic>).map((e) => Url.fromJson(e)).toList(),
      series: SeriesSummary.fromJson(json['series']),
      variants: (json['variants'] as List<dynamic>)
          .map((e) => ComicSummary.fromJson(e))
          .toList(),
      collections: (json['collections'] as List<dynamic>)
          .map((e) => ComicSummary.fromJson(e))
          .toList(),
      collectedIssues: (json['collectedIssues'] as List<dynamic>)
          .map((e) => ComicSummary.fromJson(e))
          .toList(),
      dates: (json['dates'] as List<dynamic>)
          .map((e) => ComicDate.fromJson(e))
          .toList(),
      prices: (json['prices'] as List<dynamic>)
          .map((e) => ComicPrice.fromJson(e))
          .toList(),
      thumbnail: MarvelImage.fromJson(json['thumbnail']),
      images: (json['images'] as List<dynamic>)
          .map((e) => MarvelImage.fromJson(e))
          .toList(),
      creators: CreatorList.fromJson(json['creators']),
      characters: CharacterList.fromJson(json['characters']),
      stories: StoryList.fromJson(json['stories']),
      events: EventList.fromJson(json['events']),
    );
  }
}
