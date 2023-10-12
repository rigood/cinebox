import 'package:cinebox/constants/gaps.dart';
import 'package:cinebox/constants/sizes.dart';
import 'package:cinebox/constants/themes.dart';
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
          color: ColorThemes.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: CustomThemes.boxshadow,
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w200/$poster',
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 20,
                right: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'MontserratBold',
                      fontSize: 16,
                      color: ColorThemes.movieTitleColor,
                    ),
                  ),
                  Gaps.v5,
                  Row(
                    children: [
                      Text(
                        releaseDate,
                        style: const TextStyle(
                          fontSize: Sizes.size14,
                          color: ColorThemes.gray,
                        ),
                      ),
                      Gaps.h5,
                      const Icon(
                        Icons.star_rate_rounded,
                        size: Sizes.size20,
                        color: ColorThemes.starColor,
                      ),
                      Text(
                        '$voteAverage',
                        style: const TextStyle(
                          fontSize: Sizes.size14,
                          color: ColorThemes.gray,
                        ),
                      ),
                    ],
                  ),
                  Gaps.v10,
                  Container(
                    decoration: BoxDecoration(
                      color: ColorThemes.secondary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.size6,
                        horizontal: Sizes.size12,
                      ),
                      child: Text(
                        "바로예매",
                        style: TextStyle(
                          fontSize: Sizes.size14,
                          color: ColorThemes.white,
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
