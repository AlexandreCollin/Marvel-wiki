import 'package:flutter/material.dart';
import 'package:marvel_wiki/pages/home/home_page.dart';

void main() => runApp(const MarverWiki());

class MarverWiki extends StatelessWidget {
  const MarverWiki({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
