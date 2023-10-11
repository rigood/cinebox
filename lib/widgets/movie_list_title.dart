import 'package:flutter/material.dart';
import 'package:cinebox/constants/colors.dart';
import 'package:cinebox/constants/sizes.dart';

class MovieListTitle extends StatelessWidget {
  final String text;

  const MovieListTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        bottom: 10,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: Sizes.size20 + Sizes.size2,
          fontWeight: FontWeight.bold,
          color: ColorThemes.listTitleColor,
        ),
      ),
    );
  }
}
