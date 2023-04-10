import 'package:flutter/material.dart';
import 'package:marvel_wiki/models/character/character.dart';
import 'package:marvel_wiki/pages/home/components/characters.dart';
import 'package:marvel_wiki/pages/home/components/search_bar.dart';
import 'package:marvel_wiki/utils/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<void> _characters;
  final List<Character> _charactersList = [];
  int _total = -1;
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
            if (snapshot.connectionState != ConnectionState.done &&
                _total == -1) {
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
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: MarvelCharacters(
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
                ),
                SearchBar(
                  onChanged: (value) {
                    setState(() {
                      _loading = true;
                      _characters = Api.getCharacters(
                        offset: 0,
                        nameStartWith: value ?? "",
                      ).then((value) {
                        setState(() {
                          _charactersList.clear();
                          _charactersList.addAll(value.results);
                          _loading = false;
                          _total = value.total;
                        });
                      });
                    });
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
