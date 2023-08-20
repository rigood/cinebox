import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/services/api_service.dart';
import 'package:movie_app/widgets/app_title_letter.widget.dart';
import 'package:movie_app/widgets/boxoffice_movie_widget.dart';
import 'package:movie_app/widgets/movie_list_title_widget.dart';
import 'package:movie_app/widgets/movie_widget.dart';
import 'package:movie_app/widgets/skeleton_boxoffice_movie_widget.dart';
import 'package:movie_app/widgets/skeleton_movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";

  final Future<List<MovieModel>> popularMovies = ApiService.getMovies(popular);

  final Future<List<MovieModel>> nowPlayingMovies =
      ApiService.getMovies(nowPlaying);

  final Future<List<MovieModel>> comingSoonMovies =
      ApiService.getMovies(comingSoon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff3c2a78),
        foregroundColor: Colors.white,
        leading: const Icon(
          Icons.card_membership,
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTitleLetter(letter: "C"),
            AppTitleLetter(letter: "I"),
            AppTitleLetter(letter: "N"),
            AppTitleLetter(letter: "E"),
            AppTitleLetter(letter: "B"),
            AppTitleLetter(letter: "O"),
            AppTitleLetter(letter: "X"),
          ],
        ),
        actions: const [
          Icon(Icons.notifications),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.menu_sharp),
        ],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MovieListTitle(text: "박스오피스"),
              FutureBuilder(
                future: nowPlayingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 450,
                      child: makeBoxOfficeList(snapshot),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const MovieListTitle(text: "인기상영작"),
              FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 180,
                      child: makeMovieList(snapshot),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const MovieListTitle(text: "상영예정작"),
              FutureBuilder(
                future: comingSoonMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 180,
                      child: makeMovieList(snapshot),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }

  ListView makeMovieList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        if (snapshot.connectionState != ConnectionState.waiting) {
          return Movie(
            id: movie.id,
            title: movie.title,
            backdrop: movie.backdropPath,
            poster: movie.posterPath,
          );
        } else {
          return const SkeletonMovie();
        }
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }

  ListView makeBoxOfficeList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        if (snapshot.connectionState != ConnectionState.waiting) {
          return BoxOfficeMovie(
            id: movie.id,
            title: movie.title,
            poster: movie.posterPath,
            releaseDate: movie.releaseDate,
            voteAverage: movie.voteAverage,
          );
        } else {
          return const SkeletonBoxOfficeMovie();
        }
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }
}
