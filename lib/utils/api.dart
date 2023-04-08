import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:marvel_wiki/models/character_data_container.dart';

class Api {
  static const String privateKey = "PRIVATE_KEY";
  static const String publicKey = "PUBLIC_KEY";

  static const String baseEndpoint = 'https://gateway.marvel.com/v1/public';

  static Future<Map<String, dynamic>> _send(
    String endpoint, {
    Map<String, String>? queryParameters,
  }) async {
    final String now = DateTime.now().toString();
    final Uri url = Uri.parse("$baseEndpoint/$endpoint").replace(
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
  }) {
    return _send('characters', queryParameters: {
      'offset': offset.toString(),
    }).then((value) {
      return CharacterDataContainer.fromJson(value["data"]);
    });
  }
}
