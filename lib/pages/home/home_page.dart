import 'package:flutter/material.dart';
import 'package:marvel_wiki/models/character/character.dart';
import 'package:marvel_wiki/pages/home/components/characters.dart';
import 'package:marvel_wiki/utils/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Future<void> _characters;
  final List<Character> _charactersList = [];
  late final int _total;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _characters = Api.getCharacters(
      offset: _charactersList.length,
    ).then((value) {
      _charactersList.addAll(value.results);
      _total = value.total;
    });
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
            if (snapshot.hasError) {
              return Center(
                child: Text("error ${snapshot.error}"),
              );
            }

            return Stack(
              alignment: Alignment.topRight,
              children: [
                MarvelCharacters(
                  characters: _charactersList,
                  loading: _loading,
                  onEndOfList: () {
                    if (_loading || _charactersList.length >= _total) {
                      return;
                    }
                    setState(() {
                      _loading = true;
                    });
                    Api.getCharacters(
                      offset: _charactersList.length,
                    ).then((value) {
                      setState(() {
                        _charactersList.addAll(value.results);
                        _loading = false;
                      });
                    });
                  },
                ),
                if (_loading)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
