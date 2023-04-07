import 'package:flutter/material.dart';
import 'package:marvel_wiki/models/character_data_container.dart';
import 'package:marvel_wiki/utils/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Future<CharacterDataContainer> _characters;

  @override
  void initState() {
    super.initState();
    _characters = Api.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _characters,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError || !snapshot.hasData) {
              return const Center(
                child: Text(
                  "error",
                ),
              );
            }
            return GridView.count(
              crossAxisCount: 2,
              children: snapshot.data!.results.map((e) {
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
          },
        ),
      ),
    );
  }
}
