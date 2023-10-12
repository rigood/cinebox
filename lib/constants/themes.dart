import 'package:flutter/material.dart';

class ColorThemes {
  static const primary = Color(0xff3c2a78);
  static const listTitleColor = Color(0xff14134a);
  static const movieTitleColor = Color(0xff514769);
  static const starColor = Color(0xff6337be);
  static const secondary = Color(0xff14b9cc);
  static const white = Colors.white;
  static const gray = Color(0xff868e96);
  static const black = Color(0xff0e0723);
  static const boxshadow = Color.fromRGBO(8, 7, 28, 0.1);
}

class CustomThemes {
  static const boxshadow = [
    BoxShadow(
      color: ColorThemes.boxshadow,
      blurRadius: 10.0,
      offset: Offset(0, 8),
    )
  ];
}
