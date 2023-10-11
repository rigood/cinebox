import 'package:flutter/material.dart';
import 'package:cinebox/constants/colors.dart';
import 'package:cinebox/constants/sizes.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Sizes.size12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var char in ["C", "I", "N", "E", "B", "O", "X"])
            AppTitleLetter(
              letter: char,
            )
        ],
      ),
    );
  }
}

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
        color: ColorThemes.white,
      ),
      margin: const EdgeInsets.only(
        right: 2,
      ),
      width: Sizes.size14,
      alignment: Alignment.center,
      child: Text(
        letter,
        style: const TextStyle(
          fontFamily: 'Oswald',
          fontSize: Sizes.size14,
          color: ColorThemes.appTitleColor,
        ),
      ),
    );
  }
}
