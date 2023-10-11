import 'package:flutter/material.dart';
import 'package:cinebox/screens/detail_screen.dart';

class TicketingMovie extends StatelessWidget {
  final int id;
  final String title, poster, releaseDate;
  final dynamic voteAverage;

  const TicketingMovie({
    super.key,
    required this.id,
    required this.title,
    required this.poster,
    required this.releaseDate,
    required this.voteAverage,
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
            Image.network('https://image.tmdb.org/t/p/w200/$poster'),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xff514769),
                      fontSize: 16,
                      fontFamily: 'MontserratBold',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        releaseDate,
                        style: const TextStyle(
                          color: Color(0xff868e96),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.star_rate_rounded,
                        size: 20,
                        color: Color(0xff6337be),
                      ),
                      Text(
                        '$voteAverage',
                        style: const TextStyle(
                          color: Color(0xff868e96),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff14b9cc),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
                      child: Text(
                        "바로예매",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
