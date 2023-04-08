import 'package:flutter/material.dart';
import 'package:marvel_wiki/models/character.dart';

class MarvelCharacters extends StatefulWidget {
  const MarvelCharacters({
    super.key,
    required this.characters,
    required this.onEndOfList,
    required this.loading,
  });

  final List<Character> characters;
  final Function() onEndOfList;
  final bool loading;

  @override
  State<MarvelCharacters> createState() => _MarvelCharactersState();
}

class _MarvelCharactersState extends State<MarvelCharacters> {
  final ScrollController _gridScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _gridScrollController.addListener(() {
      if (_gridScrollController.position.pixels >=
          _gridScrollController.position.maxScrollExtent - 250) {
        widget.onEndOfList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const BouncingScrollPhysics(),
      controller: _gridScrollController,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: widget.characters.map((e) {
        return Card(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image(
                image: NetworkImage(e.thumbnail.url),
              ),
              Text(
                e.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Colors.black,
                ),
              ),
              Text(
                e.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
