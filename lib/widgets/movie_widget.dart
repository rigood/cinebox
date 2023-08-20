import 'package:flutter/material.dart';
import 'package:movie_app/screens/detail_screen.dart';

class Movie extends StatelessWidget {
  final int id;
  final String title, backdrop, poster;
  const Movie(
      {super.key,
      required this.id,
      required this.title,
      required this.backdrop,
      required this.poster});

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
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(8, 7, 28, 0.1),
              blurRadius: 10.0,
              offset: Offset(0, 8),
            )
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://image.tmdb.org/t/p/w200/$backdrop'),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xff514769),
                  fontSize: 16,
                  fontFamily: 'PretendardBold',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
