import 'package:flutter/material.dart';
import 'package:marvel_wiki/models/comic/comic_data_container.dart';
import 'package:marvel_wiki/pages/creator/creator_page.dart';
import 'package:marvel_wiki/utils/api.dart';

class ComicPage extends StatefulWidget {
  const ComicPage({
    super.key,
    required this.resourceURI,
  });

  final String resourceURI;

  @override
  State<ComicPage> createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> {
  late Future<ComicsDataContainer> _comic;

  @override
  void initState() {
    super.initState();
    _comic = Api.getComicsFromUri(widget.resourceURI);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _comic,
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
                          e.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e.description ?? "No description available",
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 45,
                      ),
                      const Text(
                        "Creators",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Wrap(
                          spacing: 10.0,
                          children: e.creators.items.map((e) {
                            return InputChip(
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CreatorPage(
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
