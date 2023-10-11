import 'package:flutter/material.dart';
import 'package:cinebox/constants/sizes.dart';
import 'package:cinebox/constants/gaps.dart';
import 'package:cinebox/models/movie_model.dart';
import 'package:cinebox/widgets/ticketing_movie.dart';
import 'package:cinebox/widgets/basic_movie.dart';
import 'package:cinebox/widgets/ticketing_movie_skeleton.dart';
import 'package:cinebox/widgets/basic_movie_skeleton.dart';

enum MovieListType {
  basic,
  ticketing,
}

class MovieList extends StatelessWidget {
  final MovieListType type;
  final AsyncSnapshot<List<MovieModel>> snapshot;

  const MovieList({
    super.key,
    required this.type,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: type == MovieListType.ticketing ? 450 : 180,
      margin: const EdgeInsets.only(
        bottom: Sizes.size20,
      ),
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: Sizes.size20,
          right: Sizes.size20,
          top: type == MovieListType.ticketing ? 0 : Sizes.size5,
          bottom: Sizes.size20,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.hasError ? 1 : snapshot.data?.length ?? 3,
        itemBuilder: (context, index) {
          if (snapshot.hasData &&
              snapshot.connectionState != ConnectionState.waiting) {
            var movie = snapshot.data![index];
            return type == MovieListType.ticketing
                ? TicketingMovie(
                    id: movie.id,
                    title: movie.title,
                    poster: movie.posterPath,
                    releaseDate: movie.releaseDate,
                    voteAverage: movie.voteAverage,
                  )
                : BasicMovie(
                    id: movie.id,
                    title: movie.title,
                    backdrop: movie.backdropPath,
                    poster: movie.posterPath,
                  );
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
            );
          } else {
            return type == MovieListType.ticketing
                ? const TicketingMovieSkeleton()
                : const BasicMovieSkeleton();
          }
        },
        separatorBuilder: (context, index) => Gaps.h20,
      ),
    );
  }
}
