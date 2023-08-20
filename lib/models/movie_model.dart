class MovieModel {
  final bool adult, video;
  final String backdropPath,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      releaseDate,
      title;
  final int id, voteCount;
  final double popularity;
  final List<dynamic> genreIds;
  final dynamic voteAverage;

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        posterPath = json['poster_path'],
        backdropPath = json['backdrop_path'],
        overview = json['overview'],
        releaseDate = json['release_date'],
        voteAverage = json['vote_average'],
        voteCount = json['vote_count'],
        genreIds = json['genre_ids'],
        adult = json['adult'],
        video = json['video'],
        popularity = json['popularity'],
        originalTitle = json['original_title'],
        originalLanguage = json['original_language'];
}
