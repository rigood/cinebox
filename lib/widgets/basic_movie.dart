import 'package:cinebox/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:cinebox/screens/detail_screen.dart';

class BasicMovie extends StatelessWidget {
  final int id;
  final String title, backdrop, poster;

  const BasicMovie({
    super.key,
    required this.id,
    required this.title,
    required this.backdrop,
    required this.poster,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: id,
              title: title,
              poster: poster,
            ),
          ),
        );
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: ColorThemes.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: CustomThemes.boxshadow,
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w200/$backdrop',
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 10,
              ),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'PretendardBold',
                  fontSize: 16,
                  color: ColorThemes.movieTitleColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
