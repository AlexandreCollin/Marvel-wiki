import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.onChanged,
  });

  final Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextField(
            onChanged: onChanged,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
