import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cinebox/constants/themes.dart';
import 'package:cinebox/constants/gaps.dart';
import 'package:cinebox/constants/sizes.dart';
import 'package:cinebox/models/movie_model.dart';
import 'package:cinebox/services/api_service.dart';
import 'package:cinebox/widgets/app_title.dart';
import 'package:cinebox/widgets/movie_list_title.dart';
import 'package:cinebox/widgets/movie_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";

  late final List<Map<String, dynamic>> _movieLists = [
    {
      "title": "박스오피스",
      "future": ApiService.getMovies(popular),
      "type": MovieListType.ticketing,
    },
    {
      "title": "인기상영작",
      "future": ApiService.getMovies(nowPlaying),
      "type": MovieListType.basic,
    },
    {
      "title": "상영예정작",
      "future": ApiService.getMovies(comingSoon),
      "type": MovieListType.basic,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemes.white,
      appBar: AppBar(
        backgroundColor: ColorThemes.primary,
        foregroundColor: ColorThemes.white,
        leading: const Icon(
          Icons.card_membership,
        ),
        title: const AppTitle(),
        actions: const [
          Icon(Icons.notifications),
          Gaps.h10,
          Icon(Icons.menu_sharp),
          Gaps.h10,
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var movieList in _movieLists) ...[
              MovieListTitle(text: movieList["title"]),
              FutureBuilder(
                future: movieList["future"] as Future<List<MovieModel>>,
                builder: (context, snapshot) {
                  return MovieList(
                    type: movieList["type"],
                    snapshot: snapshot,
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
