import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:marvel_wiki/models/character/character_data_container.dart';
import 'package:marvel_wiki/models/comic/comic_data_container.dart';
import 'package:marvel_wiki/models/creator/creator_data_container.dart';

class Api {
  static const String privateKey = "Private Key";
  static const String publicKey = "Public Key";

  static const String baseEndpoint = 'https://gateway.marvel.com/v1/public';

  static Future<Map<String, dynamic>> _send(
    String endpoint, {
    Map<String, String>? queryParameters,
  }) async {
    log("Api: send request to $endpoint");
    final String now = DateTime.now().toString();
    final Uri url = Uri.parse(endpoint).replace(
      queryParameters: {
        'apikey': publicKey,
        'ts': now,
        'hash':
            md5.convert(utf8.encode(now + privateKey + publicKey)).toString(),
        ...?queryParameters,
      },
    );

    final response = await http.get(url);

    final body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return Future.error(body);
    }

    return body;
  }

  static Future<CharacterDataContainer> getCharacters({
    int offset = 0,
    String nameStartWith = "",
  }) {
    final Map<String, String> queryParameters = {
      'offset': offset.toString(),
    };

    if (nameStartWith.isNotEmpty) {
      queryParameters['nameStartsWith'] = nameStartWith;
    }

    return _send(
      "$baseEndpoint/characters",
      queryParameters: queryParameters,
    ).then((value) {
      return CharacterDataContainer.fromJson(value["data"]);
    });
  }

  static Future<ComicsDataContainer> getComicsFromUri(String uri) async {
    return _send(uri).then((value) {
      return ComicsDataContainer.fromJson(value["data"]);
    });
  }

  static Future<CreatorDataContainer> getCreatorsFromUri(String uri) async {
    return _send(uri).then((value) {
      return CreatorDataContainer.fromJson(value["data"]);
    });
  }
}
