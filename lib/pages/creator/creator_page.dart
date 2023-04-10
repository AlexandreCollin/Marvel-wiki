import 'package:flutter/material.dart';
import 'package:marvel_wiki/models/creator/creator_data_container.dart';
import 'package:marvel_wiki/pages/comic/comic_page.dart';
import 'package:marvel_wiki/utils/api.dart';

class CreatorPage extends StatefulWidget {
  const CreatorPage({
    super.key,
    required this.resourceURI,
  });

  final String resourceURI;

  @override
  State<CreatorPage> createState() => _CreatorPageState();
}

class _CreatorPageState extends State<CreatorPage> {
  late final Future<CreatorDataContainer> _creators;

  @override
  void initState() {
    super.initState();
    _creators = Api.getCreatorsFromUri(widget.resourceURI);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _creators,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: snapshot.data!.results.map((e) {
                  return Column(
                    children: [
                      Image(image: NetworkImage(e.thumbnail.url)),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          e.fullName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Wrap(
                          spacing: 10.0,
                          children: e.comics.items.map((e) {
                            return InputChip(
                              label: Text(
                                e.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ComicPage(
                                      resourceURI: e.resourceURI,
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
