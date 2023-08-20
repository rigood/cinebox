import 'package:flutter/material.dart';

class AppTitleLetter extends StatelessWidget {
  final String letter;

  const AppTitleLetter({
    super.key,
    required this.letter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(
        right: 2,
      ),
      width: 14,
      alignment: Alignment.center,
      child: Text(
        letter,
        style: const TextStyle(
          color: Color(0xff0e0723),
          fontSize: 14,
          fontFamily: 'Oswald',
        ),
      ),
    );
  }
}
