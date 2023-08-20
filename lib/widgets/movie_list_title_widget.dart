import 'package:flutter/material.dart';

class MovieListTitle extends StatelessWidget {
  final String text;

  const MovieListTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xff14134a),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
