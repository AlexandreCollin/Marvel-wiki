import 'package:flutter/material.dart';
import 'package:marvel_wiki/models/character/character.dart';
import 'package:marvel_wiki/pages/comic/comic_page.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Image(image: NetworkImage(character.thumbnail.url)),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                if (character.description.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      character.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                else
                  const Text("No description available"),
                const Divider(
                  height: 45,
                ),
                const Text(
                  "Comics",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Wrap(
                    spacing: 10.0,
                    children: character.comics.items.map((e) {
                      return InputChip(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ComicPage(
                              resourceURI: e.resourceURI,
                            ),
                          ),
                        ),
                        label: Text(
                          e.name,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
