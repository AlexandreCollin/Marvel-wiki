import 'package:flutter/material.dart';
import 'package:marvel_wiki/pages/home/home_page.dart';

void main() => runApp(const MarverWiki());

class MarverWiki extends StatelessWidget {
  const MarverWiki({super.key});

  static const Color _blackMarvel = Color.fromRGBO(32, 32, 32, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: _blackMarvel,
        appBarTheme: const AppBarTheme(
          color: _blackMarvel,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: Colors.black,
        ),
        chipTheme: const ChipThemeData(
          backgroundColor: _blackMarvel,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
